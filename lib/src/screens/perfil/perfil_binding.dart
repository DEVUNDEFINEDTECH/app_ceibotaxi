import 'package:app_taxis/src/screens/perfil/perfil_controller.dart';
import 'package:get/get.dart';

class OptionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.find<PerfilController>();

    // Get.lazyPut<SplashController>(
    //   () => SplashController(),
    // );
  }
}
