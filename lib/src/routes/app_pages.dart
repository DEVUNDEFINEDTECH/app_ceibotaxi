import 'package:app_taxis/src/screens/auth/login/login_binding.dart';
import 'package:app_taxis/src/screens/auth/login/login_screen.dart';
import 'package:app_taxis/src/screens/auth/user/user_screen.dart';
import 'package:app_taxis/src/screens/dashboard/dashboard_screen.dart';
import 'package:app_taxis/src/screens/dashboard/driver/dashboard_driver_binding.dart';
import 'package:app_taxis/src/screens/dashboard/driver/dashboard_driver_screen.dart';
import 'package:app_taxis/src/screens/payment/payment_binding.dart';
import 'package:app_taxis/src/screens/payment/payment_screen.dart';
import 'package:app_taxis/src/screens/perfil/components/analitycs_detail.dart';
import 'package:app_taxis/src/screens/perfil/components/bases_detail.dart';
import 'package:app_taxis/src/screens/splash/splash_binding.dart';
import 'package:app_taxis/src/screens/splash/splash_screen.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    // GetPage(
    //   name: _Paths.HOME,
    //   page: () => HomeScreen(),
    //   binding: HomeBinding(),
    // ),
    // GetPage(
    //     name: _Paths.CARRERS,
    //     page: () => CarrersScreen(),
    //     binding: CarrersBinding()),
    // // GetPage(
    // //   name: _Paths.CARRERSDETAIL,
    // //   page: () => CarrerDetailPage(),
    // // ),
    GetPage(
      name: _Paths.BASESDETAIL,
      page: () => BasesDetailPage(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardScreen(),
      //binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARDDRIVER,
      page: () => DashboardDriverScreen(),
      binding: DashboardDriverBinding(),
    ),
    // GetPage(
    //   name: _Paths.OPTIONS,
    //   page: () => PerfilScreen(),
    //   binding: OptionsBinding(),
    // ),
    GetPage(
      name: _Paths.ANALITYCDETAIL,
      page: () => AnalyticsDetailPage(),
    ),
    GetPage(
      name: _Paths.USER,
      page: () => UserScreen(),
    ),
    GetPage(
      name: _Paths.PAYMENT,
      page: () => PaymentsScreen(),
      binding: PaymentBinding(),
    ),
    // GetPage(
    //   name: _Paths.CARRERDETAIL,
    //   page: () => CarrerDetailPage(),
    // ),
  ];
}
