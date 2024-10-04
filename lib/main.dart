import 'package:app_taxis/main_binding.dart';
import 'package:app_taxis/src/data/services/push_notifications_service.dart';
import 'package:app_taxis/src/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:app_taxis/src/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //await Firebase.initializeApp();
  final NotificationService notificationService =
      Get.put(NotificationService());
  await notificationService.init();
  //Get.put(GlobalMemory());
  //final NotificationService notificationService = Get.put(NotificationService());
  await GetStorage.init();
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
      initialBinding: MainBinding(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
