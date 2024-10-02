import 'package:app_taxis/src/data/services/local_storage_service.dart';
import 'package:app_taxis/src/screens/auth/auth_controller.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController(localStorage: Get.find<LocalStorage>()));
  }
}
