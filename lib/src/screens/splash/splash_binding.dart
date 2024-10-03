import 'package:app_taxis/src/screens/splash/splash_controller.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<GlobalMemory>(() => GlobalMemory());
    //Get.lazyPut<LocalStorage>(() => LocalStorage());
    // Get.lazyPut<SplashController>(
    //     () => SplashController(localStorage: Get.find()));
    Get.put(SplashController(
      localStorage: Get.find(), // Inyecta la dependencia de localStorage
    ));
  }
}
