import 'package:app_taxis/src/data/models/base_model.dart';
import 'package:app_taxis/src/data/models/carrera_model.dart';
import 'package:app_taxis/src/data/models/unidad_model.dart';
import 'package:app_taxis/src/data/models/user_model.dart';
import 'package:app_taxis/src/data/services/base_service.dart';
import 'package:app_taxis/src/data/services/carrers_service.dart';
import 'package:app_taxis/src/data/services/auth_service.dart'; // Added import for AuthService
import 'package:app_taxis/src/data/services/local_storage_service.dart';
import 'package:app_taxis/src/global_memory.dart';
import 'package:app_taxis/src/routes/app_pages.dart';
import 'package:app_taxis/src/screens/splash/components/consent_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class SplashController extends GetxController {
  final LocalStorage localStorage;
  final AuthenticationService authService;
  SplashController({required this.localStorage, required this.authService});

  @override
  void onReady() async {
    super.onReady();
    //await _checkVersion();
    await checkAndRequestPermissions();
    await fechData();
  }

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
    // Muestra un cuadro de diálogo para el consentimiento
    bool? consent = GlobalMemory.to.box.read('consent');
    if (consent == null || consent == false) {
      bool isConsentGiven = await showConsentDialog();
      if (isConsentGiven) {
        GlobalMemory.to.box.write('consent', true);
      } else {
        Get.snackbar('Permiso Denegado',
            'Para usar la aplicación necesitamos acceder a tu ubicación.');
        SystemNavigator.pop();
        return;
      }
    }

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

    // Verifica el estado de los permisos
    if (locationStatus == PermissionStatus.granted &&
        notificationStatus == PermissionStatus.granted) {
      // Los permisos están otorgados, puedes continuar con tu lógica
    } else {
      // Al menos uno de los permisos no fue otorgado
      // Puedes mostrar un mensaje al usuario informándole que necesita otorgar permisos
      Get.snackbar('Permisos Requeridos',
          'Necesitamos permisos para acceder a tu ubicación y notificaciones.');
    }
  }

  Future<void> _checkVersion() async {
    final latestVersion = await authService.checkAppVersion();

    if (latestVersion != null) {
      await Get.dialog(
        AlertDialog(
          title: const Text('Actualización disponible'),
          content: Text(
              'Por favor actualiza la app a la versión más reciente.\n\nNueva versión: $latestVersion'),
          actions: [
            TextButton(
              // onPressed: () {
              //   SystemNavigator.pop(); // O redirigir a la tienda
              // },
              onPressed: () async {
                final url = Uri.parse(latestVersion);

                if (latestVersion != null &&
                    latestVersion.startsWith('https')) {
                  final uri = Uri.parse(latestVersion);

                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri, mode: LaunchMode.externalApplication);
                  } else {
                    print('No se pudo lanzar el enlace: $uri');
                    Get.snackbar(
                        'Error', 'No se pudo abrir el enlace de descarga');
                  }
                } else {
                  print('latestVersion inválido: $latestVersion');
                  Get.snackbar('Error', 'Enlace de descarga inválido');
                }
              },
              child: const Text('Actualizar'),
            ),
          ],
        ),
        barrierDismissible: false,
      );
    }
  }
}
