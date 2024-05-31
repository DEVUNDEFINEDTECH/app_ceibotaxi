import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app_taxis/src/screens/splash/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 70,
            ),
            Image.asset(
              'assets/images/logo_rtsg.png',
            ),
            Image.asset(
              'assets/images/slogan_rtsg.png',
            ),
            const SizedBox(
              height: 50,
            ),
            LinearProgressIndicator(
              color: Get.theme.colorScheme.primary,
            ),
            const SizedBox(height: 20),
            const Text("Cargando..."),
          ],
        ),
      ),
    );
  }
}
