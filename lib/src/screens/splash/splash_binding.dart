import 'package:app_taxis/src/data/services/auth_service.dart';
import 'package:app_taxis/src/screens/splash/splash_controller.dart';

import 'package:get/get.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<GlobalMemory>(() => GlobalMemory());
    //Get.lazyPut<LocalStorage>(() => LocalStorage());
    // Get.lazyPut<SplashController>(
    //     () => SplashController(localStorage: Get.find()));
    Get.lazyPut<AuthenticationService>(() => AuthenticationService());
    Get.put(SplashController(
      localStorage: Get.find(), // Inyecta la dependencia de localStorage
      authService: Get.find(), // Inyecta la dependencia de authService
    ));
  }
}
