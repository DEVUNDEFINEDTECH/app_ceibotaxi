import 'package:app_taxis/src/data/services/local_storage_service.dart';
import 'package:app_taxis/src/global_memory.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GlobalMemory>(() => GlobalMemory());
    Get.put<LocalStorage>(LocalStorage());
  }
}
