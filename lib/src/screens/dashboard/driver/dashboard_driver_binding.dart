import 'package:app_taxis/src/screens/carrers/carrers_controller.dart';
import 'package:app_taxis/src/screens/dashboard/driver/dashboard_controller.dart';
import 'package:app_taxis/src/screens/home/home_controller.dart';
import 'package:app_taxis/src/screens/perfil/perfil_controller.dart';
import 'package:get/get.dart';

class DashboardDriverBinding extends Bindings {
  @override
  void dependencies() {
    //Get.find<AuthController>();
    Get.put(DashboardDriverController());
    Get.put(HomeController());
    Get.put(CarrersController());
    Get.put(PerfilController());

    // Get.find<GlobalMemory>();

    //Get.put(CarrersController());
    // Get.lazyPut<SplashController>(
    //   () => SplashController(),
    // );
  }
}
