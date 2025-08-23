import 'package:app_taxis/src/data/models/payment_model.dart';
import 'package:app_taxis/src/data/services/payment_service.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  final PaymentService paymentService;
  PaymentController({required this.paymentService});
  var isLoading = false.obs;
  var payments = <Payment>[].obs;
  var errorMessage = "".obs;

  @override
  void onInit() {
    super.onInit();
    loadPayments();
  }

  Future<void> loadPayments() async {
    try {
      isLoading.value = true;
      errorMessage.value = "";
      final data = await PaymentService.getPayments(13);
      if (data != null) {
        payments.value = data;
      } else {
        errorMessage.value = "No se encontraron pagos.";
      }
    } catch (e) {
      errorMessage.value = "Error al cargar pagos: $e";
    } finally {
      isLoading.value = false;
    }
  }
}
