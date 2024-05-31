import 'package:app_taxis/main_binding.dart';
import 'package:app_taxis/src/routes/app_pages.dart';
import 'package:app_taxis/src/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
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
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: ColorsApp.green),
      //   useMaterial3: true,
      // ),
      theme: lightTheme,
      initialBinding: MainBinding(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
