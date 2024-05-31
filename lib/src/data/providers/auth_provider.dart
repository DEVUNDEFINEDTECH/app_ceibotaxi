import 'dart:async';
import 'package:app_taxis/src/data/models/request/login_request.dart';
import 'package:app_taxis/src/data/models/response/login_response.dart';
import 'package:app_taxis/src/data/models/response/login_response_error.dart';
import 'package:app_taxis/src/utils/helpers.dart';
import 'package:dio/dio.dart';

class AuthenticationService {
  static final Dio _dio = Dio();

  static Future<LoginResponse> login(LoginRequest loginRequest) async {
    try {
      var response = await _dio.post('$baseUrl/usuarios/acceder/',
          data: {
            "usuario": loginRequest.userName,
            "contrasena": loginRequest.password
          },
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
          ));
      // if (!response.data.estado) {
      //   print("Debug estado falso");
      //   throw Exception("Error en las credenciales");
      // }

      LoginResponse loginResponse = LoginResponse.fromJson(response.data);
      return loginResponse;
    } on DioError catch (e) {
      if (e.response!.statusCode == 500) {
        LoginResponseError response =
            LoginResponseError.fromJson(e.response!.data);
        throw Exception("$response");
      }
    } catch (e) {
      print(e);
      throw Exception("Error de inicio de sesion $e");
    }

    throw Exception("Error en Inicio  de conexion con el server");
  }
}
