import 'package:app_taxis/src/routes/app_pages.dart';
import 'package:app_taxis/src/screens/splash/splash_binding.dart';
//import 'package:app_taxis/src/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:app_taxis/src/global_memory.dart';

Future<void> main() async {
  await GetStorage.init();
  Get.put(GlobalMemory());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App_Taxis',
      defaultTransition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF4f5726)),
        useMaterial3: true,
      ),
      // theme: lightTheme,
      initialBinding: SplashBinding(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
