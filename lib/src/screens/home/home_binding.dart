import 'package:app_taxis/src/screens/home/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.find<HomeController>();
  }
}
