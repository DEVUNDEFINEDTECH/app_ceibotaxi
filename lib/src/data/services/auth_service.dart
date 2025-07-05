//Importacion de paquetes
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:package_info_plus/package_info_plus.dart';
//Importaciones de la app
import 'package:app_taxis/src/data/models/request/login_request.dart';
import 'package:app_taxis/src/data/models/response/login_response.dart';
import 'package:app_taxis/src/data/models/response/login_response_error.dart';
import 'package:app_taxis/src/utils/helpers.dart';

class AuthenticationService {
  static final Dio _dio = Dio();

  static Future<LoginResponse> login(LoginRequest loginRequest) async {
    try {
      var response = await _dio.post(
        '$baseUrl/usuarios/acceder/',
        data: {
          "usuario": loginRequest.userName,
          "contrasena": loginRequest.password
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      // Parsear la respuesta del login
      return LoginResponse.fromJson(response.data);
    } on DioException catch (e) {
      // Manejar error 500 (error del servidor)
      if (e.response?.statusCode == 500) {
        LoginResponseError errorResponse =
            LoginResponseError.fromJson(e.response?.data);
        throw Exception("Error del servidor: ${errorResponse.observacion}");
      }
      // Manejo de otros errores con más detalles
      print('Error de autenticación: ${e.message}');
      throw Exception("Error de autenticación: ${e.message}");
    } catch (e) {
      // Manejo de errores genéricos
      print('Error de inicio de sesión: $e');
      throw Exception("Error de inicio de sesión: $e");
    }
  }

  Future<String?> checkAppVersion() async {
    try {
      final PackageInfo packageInfo = await PackageInfo.fromPlatform();
      final String currentVersion = packageInfo.version;
      final String buildNumber = packageInfo.buildNumber;

      print('Versión actual: $currentVersion (build $buildNumber)');

      final response = await _dio.get('https://tuservidor.com/api/version');

      if (response.statusCode == 200) {
        final latestVersion = response.data['latestVersion'];

        if (currentVersion != latestVersion) {
          print('¡Hay una nueva versión disponible!');
          return latestVersion;
        } else {
          print('La app está actualizada.');
        }
      } else {
        print('Error al verificar la versión: ${response.statusCode}');
      }
    } catch (e) {
      print('Excepción al verificar la versión: $e');
    }
    return null;
  }
}
