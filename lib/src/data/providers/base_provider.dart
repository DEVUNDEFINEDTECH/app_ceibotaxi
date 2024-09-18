// ignore_for_file: unnecessary_brace_in_string_interps
import 'package:app_taxis/src/utils/helpers.dart';
import 'package:dio/dio.dart';

import 'package:app_taxis/src/data/models/base_model.dart';
import 'package:app_taxis/src/data/models/response/base_response.dart';
import 'package:app_taxis/src/global_memory.dart';

class BasesService {
  static final Dio _dio = Dio();

  static Future<List<Base>?> getBases() async {
    try {
      GlobalMemory gm = GlobalMemory();
      var response = await _dio.get('$baseUrl/bases/mostrar.bases',
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'x-access-token': gm.getToken()
            },
          ));
      print("esta es la respuesta");
      print(response);
      BasesResponse baseResponse = BasesResponse.fromJson(response.data);
      return baseResponse.datos;
    } on DioException catch (e) {
      print('Error $e');
      // if (e.response!.statusCode == 500) {
      //   CarreraResponseError response =
      //       CarreraResponseError.fromJson(e.response!.data);
      //   throw Exception("$response");
      // }
    } catch (e) {
      print('Error $e');
      throw Exception("Error : $e");
    }

    throw Exception("Error en Inicio  de Sesión");
  }
}
