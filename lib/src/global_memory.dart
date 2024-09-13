import 'package:app_taxis/src/data/models/carrera_model.dart';
import 'package:app_taxis/src/data/models/unidad_model.dart';
import 'package:app_taxis/src/data/models/user_model.dart';
import 'package:app_taxis/src/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class GlobalMemory {
  RxList bases = [].obs;
  RxList<Carrera> carreras = <Carrera>[].obs;
  RxBool ifCarrera = false.obs;
  RxList<Carrera> carreraActiva = <Carrera>[].obs;

  // Método para agregar una nueva carrera a la lista
  addCarrera(Carrera carrera) {
    carreraActiva.insert(0, carrera);
  }

  User? user;
  Unidad? unity;
  GetStorage box = GetStorage();

  static GlobalMemory get to => Get.find();
  Future<void> logout() async {
    await box.erase();
    //socketService.disconnectSocket();
    Get.offAndToNamed(Routes.LOGIN);
    await box.remove("user");
    //user = null;
    //Get.offAllNamed(Routes.ONBOARDING);
  }

  User? getUser() {
    user ??= User.fromJson(box.read("user"));
    return user;
  }

  // Método para obtener la unidad almacenada
  Unidad? getUnity() {
    unity ??= Unidad.fromJson(box.read("unity"));
    return unity;
  }

  int getIdUnity() {
    unity ??= Unidad.fromJson(box.read("unity"));
    return unity!.id;
  }

  String? getToken() {
    final token = box.read("token");
    return token;
  }

  Map<String, int> rango = {
    "1M": 1,
    "3M": 3,
    "6M": 6,
    "1A": 12,
  };
}
