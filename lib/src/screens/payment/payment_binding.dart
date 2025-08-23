import 'package:app_taxis/src/data/services/payment_service.dart';
import 'package:app_taxis/src/screens/payment/payment_controller.dart';
import 'package:get/get.dart';

class PaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.create<PaymentController>(
      () => PaymentController(
        paymentService: PaymentService(),
      ),
    );
  }
}
