import 'package:app_taxis/src/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app_taxis/src/screens/splash/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
              height: height * 0.2,
              width: width * 0.6,
              'assets/images/logo_rtsg.png',
            ),
            Image.asset(
              width: width * 0.6,
              'assets/images/slogan.png',
            ),
            const SizedBox(
              height: 50,
            ),
            LinearProgressIndicator(
              color: ColorsApp.lightGreen,
            ),
            const SizedBox(height: 20),
            const Text("Cargando..."),
          ],
        ),
      ),
    );
  }
}
