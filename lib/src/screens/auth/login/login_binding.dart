import 'package:app_taxis/src/screens/auth/auth_controller.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}
