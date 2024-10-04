import 'package:app_taxis/src/data/services/push_notifications_service.dart';
import 'package:app_taxis/src/data/services/socket_servicer.dart';
import 'package:app_taxis/src/global_memory.dart';
import 'package:app_taxis/src/screens/carrers/carrers_controller.dart';
import 'package:get/get.dart';

class DashboardDriverController extends GetxController {
  final NotificationService _notificationService = Get.find();

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

  @override
  void onReady() async {
    CarrersController carrersController = Get.find<CarrersController>();
    SocketsService().connectSocket();
    carrersController.getCarreras();
    super.onReady();
  }
}
