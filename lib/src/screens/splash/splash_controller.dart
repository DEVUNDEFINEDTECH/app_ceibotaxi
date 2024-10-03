import 'package:app_taxis/src/data/models/base_model.dart';
import 'package:app_taxis/src/data/models/carrera_model.dart';
import 'package:app_taxis/src/data/models/unidad_model.dart';
import 'package:app_taxis/src/data/models/user_model.dart';
import 'package:app_taxis/src/data/services/base_service.dart';
import 'package:app_taxis/src/data/services/carrers_service.dart';
import 'package:app_taxis/src/data/services/local_storage_service.dart';
import 'package:app_taxis/src/global_memory.dart';
import 'package:app_taxis/src/routes/app_pages.dart';

import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashController extends GetxController {
  final LocalStorage localStorage;
  SplashController({required this.localStorage});

  @override
  void onInit() async {
    super.onInit();
    await checkAndRequestPermissions();
    await fechData();
  }

  //GlobalMemory gm = Get.find<GlobalMemory>();

  // void validateSession() async {
  //   try {
  //     final token = await localStorage.getToken();
  //     print('token $token');
  //     if (token != null) {
  //       final user =
  //           await autenticationRepositoryInterface.getUserByToken(token);
  //       print('El user loggeado es: ${user?.username}');

  //       //final cities= await local

  //       if (user != null) {
  //         GlobalState.to.setUser(user);
  //         GlobalState.to.setAssignmentManager(user.assignmentmanager![0]);
  //         Get.toNamed(SgasRoutes.dashboard);
  //       }
  //       //Get.toNamed(SgasRoutes.login);
  //     } else {
  //       Get.toNamed(SgasRoutes.login);
  //     }
  //   } catch (e) {
  //     print('error fuera: $e');
  //     error.value = e.toString().replaceAll('Exception: ', '');
  //     Get.toNamed(SgasRoutes.login);
  //     Get.snackbar('Error', 'Error de Autenticación: ${error.value}',
  //         backgroundColor: Colors.red[200]);
  //   }
  // }

  Future<void> fechData() async {
    final user = GlobalMemory.to.box.hasData('user')
        ? await GlobalMemory.to.box.read('user')
        : null;
    final unity = GlobalMemory.to.box.hasData('unity')
        ? await GlobalMemory.to.box.read('unity')
        : null;
    if (user != null || unity != null) {
      if (GlobalMemory.to.user == null || GlobalMemory.to.unity == null) {
        GlobalMemory.to.user = User.fromJson(user);
        GlobalMemory.to.unity = Unidad.fromJson(unity);
      }
      try {
        await getBases();
        await getCarrers();
      } catch (e) {
        //muestra un mensaje de error si no se pudieron cargar los datos
        print(e);
        //showSnabarError(textError);
      }
      Get.offAndToNamed(Routes.DASHBOARDDRIVER);
    } else {
      Get.offAndToNamed(Routes.LOGIN);
      GlobalMemory.to.user = user;
      GlobalMemory.to.unity = unity;
    }
  }

  Future<void> getBases() async {
    List<Base>? basesList = await BasesService.getBases();
    if (basesList != null) {
      GlobalMemory.to.bases.value = basesList;
    }
  }

  Future<void> getCarrers() async {
    List<Carrera>? carrersList =
        await CarrersService.getCarrers(GlobalMemory.to.getUnity()!.id);
    if (carrersList != null) {
      GlobalMemory.to.carreras.value = carrersList;
    }
  }

  Future<void> checkAndRequestPermissions() async {
    // Verifica si tiene permiso para acceder al GPS
    PermissionStatus locationStatus = await Permission.location.status;

    // Si no tiene permiso, solicita permiso
    if (locationStatus != PermissionStatus.granted) {
      locationStatus = await Permission.location.request();
    }

    // Verifica si tiene permiso para recibir notificaciones
    PermissionStatus notificationStatus = await Permission.notification.status;

    // Si no tiene permiso, solicita permiso
    if (notificationStatus != PermissionStatus.granted) {
      notificationStatus = await Permission.notification.request();
    }

    // Puedes agregar más permisos según sea necesario

    // Verifica el estado de los permisos
    if (locationStatus == PermissionStatus.granted &&
        notificationStatus == PermissionStatus.granted) {
      // Los permisos están otorgados, puedes continuar con tu lógica
    } else {
      // Al menos uno de los permisos no fue otorgado
      // Puedes mostrar un mensaje al usuario informándole que necesita otorgar permisos
    }
  }
}
