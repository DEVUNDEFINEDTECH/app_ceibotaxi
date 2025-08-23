import 'package:app_taxis/src/data/models/payment_model.dart';
import 'package:app_taxis/src/data/models/response/payment_response.dart';
import 'package:app_taxis/src/network/dio_client.dart';
import 'package:dio/dio.dart';

class PaymentService {
  static Future<List<Payment>?> getPayments(int idUnidad) async {
    try {
      var response = await DioClient.dio.get(
        '/api/v2/collection/cartera',
        queryParameters: {'idunidad': idUnidad},
      );
      print(response.data);

      PaymentResponse carreraResponse = PaymentResponse.fromJson(response.data);
      return carreraResponse.datos;
    } on DioException catch (e) {
      print('Error $e');
    } catch (e) {
      throw Exception("Error: $e");
    }
    throw Exception("Error en obtener las carreras");
  }
}
