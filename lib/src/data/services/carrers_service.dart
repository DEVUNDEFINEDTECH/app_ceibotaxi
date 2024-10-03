import 'dart:async';
import 'package:dio/dio.dart';

import 'package:app_taxis/src/data/models/carrera_model.dart';
import 'package:app_taxis/src/data/models/response/carrera_response.dart';
import 'package:app_taxis/src/network/dio_client.dart';

class CarrersService {
  static Future<bool> finalizarCarrera(int id, String usuarioid) async {
    try {
      var response = await DioClient.dio.put(
        '/carreras/finalizar.carrera',
        data: {"id": id, "usuarioid": usuarioid},
      );
      print(response.data);
      return true;
    } on DioException catch (e) {
      print('Error $e');
      if (e.response?.statusCode == 500) {
        throw Exception("Error del servidor: ${e.response?.data}");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
    throw Exception("Error en la finalización de carrera");
  }

  static Future<List<Carrera>?> getCarrers(int idUnidad) async {
    try {
      var response = await DioClient.dio.get(
        '/carreras/reporte.carreras.unidad',
        queryParameters: {'unidadid': idUnidad},
      );
      print(response.data);

      CarrerasResponse carreraResponse =
          CarrerasResponse.fromJson(response.data);
      return carreraResponse.datos;
    } on DioException catch (e) {
      print('Error $e');
    } catch (e) {
      throw Exception("Error: $e");
    }
    throw Exception("Error en obtener las carreras");
  }

  static Future<List<Carrera>?> getCarrersPending(int idUnidad) async {
    try {
      var response = await DioClient.dio.get(
        '/carreras/mostrar.carreras',
        queryParameters: {'unidadid': idUnidad},
      );
      print(response.data);

      CarrerasResponse carreraResponse =
          CarrerasResponse.fromJson(response.data);
      return carreraResponse.datos;
    } on DioException catch (e) {
      print('Error $e');
    } catch (e) {
      throw Exception("Error: $e");
    }
    throw Exception("Error en obtener las carreras pendientes");
  }
}
