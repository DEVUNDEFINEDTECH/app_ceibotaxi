import 'package:app_taxis/src/data/services/push_notifications_service.dart';
import 'package:app_taxis/src/data/services/socket_servicer.dart';
import 'package:app_taxis/src/global_memory.dart';
import 'package:app_taxis/src/screens/carrers/carrers_controller.dart';
import 'package:get/get.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class DashboardController extends GetxController {
  final NotificationService _notificationService = Get.find();

  @override
  void onReady() async {
    CarrersController carrersController = Get.find<CarrersController>();
    SocketsService().connectSocket();
    SocketsService().startLocationTracking();
    carrersController.getCarreras();
    super.onReady();
  }

  @override
  void onInit() {
    super.onInit();
    WakelockPlus.enable(); // activa solo mientras se esté en el dashboard
  }

  bool get areNotificationsEnabled =>
      _notificationService.areNotificationsEnabled();

  Future<void> enableNotifications() async {
    await _notificationService.enableNotifications();
    update();
  }

  Future<void> disableNotifications() async {
    await _notificationService.disableNotifications();
    update();
  }

  final tabIndex = 0.obs;
  GlobalMemory gm = Get.find<GlobalMemory>();
  RxBool isActive = true.obs;
  RxBool isTracking = false.obs;

  @override
  void dispose() {
    WakelockPlus.disable();
    ; // Permite que vuelva a apagarse la pantalla normalmente
    super.dispose();
  }
}
