import 'package:app_taxis/src/screens/carrers/carrers_controller.dart';
import 'package:get/get.dart';

class CarrersBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CarrersController());
    // Get.lazyPut<SplashController>(
    //   () => SplashController(),
    // );
  }
}
