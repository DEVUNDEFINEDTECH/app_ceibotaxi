import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService extends GetxService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final _notificationsEnabled = false.obs;

  bool get notificationsEnabled => _notificationsEnabled.value;

  Future<void> init() async {
    // Verifica si las notificaciones están habilitadas
    NotificationSettings settings =
        await _firebaseMessaging.getNotificationSettings();
    _notificationsEnabled.value =
        settings.authorizationStatus == AuthorizationStatus.authorized;

    // Solicita permisos de notificación si no están habilitados
    if (!notificationsEnabled) {
      await requestPermission();
    }
    _onForeGroundMessage();
    // Configura la escucha de mensajes
    // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //   // Manejar los mensajes aquí
    //   print('Received message: ${message.notification?.title}');
    // });
  }

  Future<void> requestPermission() async {
    NotificationSettings settings =
        await _firebaseMessaging.requestPermission();
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("Permisos de notificación otorgados");
      _notificationsEnabled.value = true;
    } else {
      print("Permisos de notificación denegados");
      _notificationsEnabled.value = false;
    }
  }

  // Activa las notificaciones
  Future<void> enableNotifications() async {
    await requestPermission();
    if (notificationsEnabled) {
      String? token = await _firebaseMessaging.getToken();
      print('Token de FCM: $token');
      // Guarda o envía el token al servidor si es necesario
    }
  }

  // Desactiva las notificaciones
  Future<void> disableNotifications() async {
    await _firebaseMessaging.deleteToken();
    print('Notificaciones desactivadas y token eliminado');
    _notificationsEnabled.value = false;
  }

  void _handleRemoteMessage(RemoteMessage message) {
    print('Got a Message wilst in the foreground!');
    print('Message data ${message.data}');
    if (message.notification == null) return;
    print('Message also contained a notification : ${message.notification}');
  }

  void _onForeGroundMessage() {
    FirebaseMessaging.onMessage.listen(_handleRemoteMessage);
  }

  // Estado de las notificaciones
  bool areNotificationsEnabled() {
    return _notificationsEnabled.value;
  }
}
