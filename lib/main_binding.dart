import 'package:app_taxis/src/data/providers/local_storage_provider.dart';
import 'package:app_taxis/src/global_memory.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GlobalMemory());
    Get.lazyPut<LocalStorage>(() => LocalStorage());
    // Get.lazyPut<AuthenticationRepositoryInterface>(
    //     () => AuthenticationRepositoryImplementation());
  }
}
