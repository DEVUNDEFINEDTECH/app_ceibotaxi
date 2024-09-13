import 'package:app_taxis/src/global_memory.dart';
import 'package:get/get.dart';

class PerfilController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isActive = true.obs;
  final tabIndex = 0.obs;
  GlobalMemory gm = Get.find<GlobalMemory>();
}
