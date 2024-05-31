// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:async';

import 'package:app_taxis/src/data/models/carrera_model.dart';
import 'package:app_taxis/src/data/models/response/carrera_response.dart';
import 'package:app_taxis/src/data/models/response/carrera_response_error.dart';
import 'package:app_taxis/src/global_memory.dart';
import 'package:app_taxis/src/utils/helpers.dart';
import 'package:dio/dio.dart';

class CarrersService {
  static final Dio _dio = Dio();

  static Future<bool> finalizarCarrera(int id, String usuarioid) async {
    try {
      GlobalMemory gm = GlobalMemory();
      var response = await _dio.put('$baseUrl/carreras/finalizar.carrera',
          data: {"id": id, "usuarioid": usuarioid},
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'x-access-token': gm.getToken()
            },
          ));
      print(response.data);
      //response.data[];
      return true;
    } on DioError catch (e) {
      print('Error $e');
      if (e.response!.statusCode == 500) {
        CarreraResponseError response =
            CarreraResponseError.fromJson(e.response!.data);
        throw Exception("$response");
      }
    } catch (e) {
      // print('Error $e');
      throw Exception("Error : $e");
    }

    throw Exception("Error en Inicio  de Sesión");
  }

  static Future<List<Carrera>?> getCarrers(int idUnidad) async {
    try {
      GlobalMemory gm = GlobalMemory();
      print("esta es launidad que esta llegando en el provider");
      print(idUnidad);
      print("este es el token");
      print(gm.getToken());

      var response = await _dio.get(
          '$baseUrl/carreras/reporte.carreras.unidad?unidadid=${idUnidad}',
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'x-access-token': gm.getToken()
            },
          ));
      print(response.data);

      CarrerasResponse carreraResponse =
          CarrerasResponse.fromJson(response.data);
      return carreraResponse.datos;
    } on DioError catch (e) {
      print('Error $e');
      // if (e.response!.statusCode == 500) {
      //   CarreraResponseError response =
      //       CarreraResponseError.fromJson(e.response!.data);
      //   throw Exception("$response");
      // }
    } catch (e) {
      throw Exception("Error : $e");
    }

    throw Exception("Error en Inicio  de Sesión");
  }

  static Future<List<Carrera>?> getCarrersPending(int idUnidad) async {
    try {
      GlobalMemory gm = GlobalMemory();
      print("esta es launidad que esta llegando en el provider");
      print(idUnidad);
      print("este es el token");
      print(gm.getToken());

      var response = await _dio.get(
          '$baseUrl/carreras/mostrar.carreras?unidadid=${idUnidad}',
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'x-access-token': gm.getToken()
            },
          ));
      print(response.data);

      CarrerasResponse carreraResponse =
          CarrerasResponse.fromJson(response.data);
      return carreraResponse.datos;
    } on DioError catch (e) {
      print('Error $e');
      // if (e.response!.statusCode == 500) {
      //   CarreraResponseError response =
      //       CarreraResponseError.fromJson(e.response!.data);
      //   throw Exception("$response");
      // }
    } catch (e) {
      throw Exception("Error : $e");
    }

    throw Exception("Error en Inicio  de Sesión");
  }
}
