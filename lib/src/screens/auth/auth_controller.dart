import 'package:app_taxis/src/data/models/request/login_request.dart';
import 'package:app_taxis/src/data/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app_taxis/src/data/models/response/login_response.dart';
import 'package:app_taxis/src/global_memory.dart';
import 'package:app_taxis/src/routes/app_pages.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isActive = true.obs;
  GlobalMemory gm = Get.find<GlobalMemory>();
  //NotificationService notificationService = NotificationService();

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final error = ''.obs;

  late LoginResponse loginResponse;

  void login() {
    Get.focusScope!.unfocus();
    isLoading.value = true;
    validate().then((value) {
      if (value) {
        Get.snackbar("Bienvenido", gm.user!.nombresUsuario.split(' ')[2],
            snackPosition: SnackPosition.BOTTOM,
            //backgroundColor: ColorsApp.lightGreen.withOpacity(0.7),
            colorText: Colors.white,
            icon: const Icon(
              Icons.time_to_leave_outlined,
              color: Colors.white,
            ));
        Get.offNamed(Routes.SPLASH);
      } else {
        isLoading.value = false;
        Get.snackbar("Error", error.value,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: const Color.fromARGB(255, 32, 32, 32),
            colorText: Colors.white,
            borderRadius: 10,
            margin: const EdgeInsets.all(10),
            borderWidth: 1,
            // textStyle: TextStyle(color: Colors.white),
            icon: const Icon(
              Icons.error,
              color: Colors.white,
            ));
      }
    });
  }

  Future<bool> validate() async {
    if (userNameController.text.isEmpty || passwordController.text.isEmpty) {
      error.value = 'Ingrese sus credenciales';
      isLoading.value = false;
      return false;
    }
    return await _toLogin();
  }

  _toLogin() async {
    try {
      LoginRequest loginRequest = LoginRequest(
          userNameController.text.trim(), passwordController.text.trim());
      LoginResponse response = await AuthenticationService.login(loginRequest);
      loginResponse = response;
      if (loginResponse.estado == true) {
        if (loginResponse.datos!.rolid == 3 ||
            loginResponse.datos!.rolid == 1 ||
            loginResponse.datos!.rolid == 4) {
          if (loginResponse.datos!.unidad == null) {
            error.value =
                "Al parecer no tienes una unidad asignada, contactate con el administrador";
            return false;
          }
          print("Dentro de la validacion del rol");
          await gm.box.write("token", loginResponse.token);
          await gm.box.write("user", loginResponse.datos);
          await gm.box.write("unity", loginResponse.datos!.unidad![0]);
          gm.user = loginResponse.datos;
          gm.unity = loginResponse.datos!.unidad![0];
          return true;
        } else {
          error.value =
              "Al parecer no eres conductor o socio, contactate con el administrador";
          return false;
        }
      } else {
        error.value = loginResponse.observacion!;
        return false;
      }
    } catch (e) {
      error.value = "$e";
      return false;
    }
  }

  logout() async {
    gm.box.erase();
    //socketService.disconnectSocket();
    Get.offAndToNamed(Routes.LOGIN);
  }
}
