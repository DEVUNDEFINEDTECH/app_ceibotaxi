import 'package:app_taxis/src/routes/app_pages.dart';
import 'package:app_taxis/src/utils/helpers.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart'; // GetX para la navegación
import 'package:app_taxis/src/global_memory.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Añadir la base URL a todas las peticiones automáticamente
    options.baseUrl = baseUrl;

    // Verificar si hay un token disponible
    String? token = GlobalMemory.to.getToken();
    if (token != null && token.isNotEmpty) {
      options.headers['Content-Type'] = 'application/json';
      options.headers['Accept'] = 'application/json';
      options.headers['x-access-token'] = token;
    } else {
      // Si no hay token, redirigir al login
      Get.offAllNamed(Routes.LOGIN);
      return;
    }

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Manejo centralizado de errores
    print('Error en la petición: ${err.message}');
    if (err.response?.statusCode == 500) {
      // Manejar errores 500 de manera específica
      print('Error del servidor: ${err.response?.data}');
    }

    // Si el error es 401 (no autorizado), redirigir al login
    if (err.response?.statusCode == 401) {
      Get.offAllNamed(Routes.LOGIN);
    }

    super.onError(err, handler);
  }
}
