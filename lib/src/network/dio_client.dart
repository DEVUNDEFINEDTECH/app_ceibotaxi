import 'package:app_taxis/src/network/api_interceptor.dart';
import 'package:dio/dio.dart';

class DioClient {
  static final Dio _dio = Dio()..interceptors.add(ApiInterceptor());

  static Dio get dio => _dio;
}
