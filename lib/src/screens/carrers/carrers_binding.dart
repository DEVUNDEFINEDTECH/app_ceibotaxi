import 'package:app_taxis/src/global_memory.dart';
import 'package:app_taxis/src/screens/auth/auth_controller.dart';
import 'package:app_taxis/src/screens/carrers/carrers_controller.dart';
import 'package:get/get.dart';

class CarrersBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.lazyPut<GlobalMemory>(() => GlobalMemory());
    //Get.find<CarrersController>();

    Get.put(CarrersController());
    // Get.lazyPut<SplashController>(
    //   () => SplashController(),
    // );
  }
}
