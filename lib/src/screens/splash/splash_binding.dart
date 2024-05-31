import 'package:app_taxis/src/screens/splash/splash_controller.dart';
import 'package:get/get.dart';

// class SplashBinding extends Bindings {
//   @override
//   void dependencies() {
//     Get.put(SplashController(
//       localStorage: Get.find(),
//     ));
//     //Get.put(AuthController());
//     // Get.lazyPut<SplashController>(
//     //   () => SplashController(),
//     // );
//   }
// }
class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController(
      localStorage: Get.find(), // Inyecta la dependencia de localStorage
    ));
  }
}
