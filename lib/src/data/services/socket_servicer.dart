import 'dart:async';

import 'package:app_taxis/src/data/models/carrera_model.dart';
import 'package:app_taxis/src/data/services/notification_service.dart';
import 'package:app_taxis/src/global_memory.dart';
import 'package:app_taxis/src/utils/helpers.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus { OnLine, OffLine, Conecting }

NotificationService notificationService = NotificationService();

GlobalMemory gm = Get.find<GlobalMemory>();

class SocketsService extends GetxController {
  final Rx<ServerStatus> _statusServer = ServerStatus.Conecting.obs;
  late IO.Socket _socket;
  IO.Socket get socket => _socket;
  ServerStatus get status => _statusServer.value;

  Timer? _locationTimer;
  SocketsService() {
    _initConfig();
  }

  _initConfig() {
    _socket = IO.io('$baseUrl', {
      // static IO.Socket socket = IO.io('${baseUrl}/', {
      'transports': ['websocket'],
      'autoConnect': true,
      'reconnection': true
    });
  }

  void connectSocket() {
    if (!_socket.connected) {
      _socket.connect();
      _socket.onConnect((_) {
        _socket.emit('socket', gm.getUnity()!.numerounidad);
        _socket.on('id', (data) {
          if (data != null) {
            gm.addCarrera(Carrera.fromJson(data));
            notificationService.showNotification(
                gm.carreraActiva[0].clienteid != null
                    ? "Nueva Carrera Asignada ${gm.carreraActiva[0].name} ${gm.carreraActiva[0].apellidopaterno} ${gm.carreraActiva[0].apellidomaterno}"
                    : "",
                gm.carreraActiva[0].direccion ?? "");
          } else {}
        });
        _statusServer.value = ServerStatus.OnLine;
        notificationService.showNotification('10-8', 'Bienvenido al martillo');
      });
    }
  }

  StreamSubscription<Position>? _positionStream;

  void startLocationTracking({bool tracking = false}) {
    print("Iniciando seguimiento de ubicación: $tracking");
    // Si ya hay un stream corriendo, lo cancelamos
    _positionStream?.cancel();

    // Configuración dinámica
    final settings = LocationSettings(
        accuracy: tracking ? LocationAccuracy.best : LocationAccuracy.medium,
        //distanceFilter: tracking ? 2 : 10, // Más sensible si tracking == true
        distanceFilter: 0);

    _positionStream = Geolocator.getPositionStream(locationSettings: settings)
        .listen((position) {
      print("Emitiendo pisicion: ${position.latitude}, ${position.longitude}");
      _socket.emit('skrastreo', {
        'lat': position.latitude,
        'lng': position.longitude,
        'unity_number': gm.getUnity()!.numerounidad,
        'tracking': tracking,
      });
    }, onError: (error) {
      print("Error stream: $error");
    });
  }

  // void startLocationTracking(bool tracking) {
  //   final settings = LocationSettings(
  //     accuracy: LocationAccuracy.medium,
  //     distanceFilter: 10,
  //   );

  //   _positionStream = Geolocator.getPositionStream(locationSettings: settings)
  //       .listen((position) {
  //     // Emitir al socket
  //     _socket.emit('skrastreo', {
  //       'lat': position.latitude,
  //       'lng': position.longitude,
  //       'unity_number': gm.getUnity()!.numerounidad,
  //       'tracking': false,
  //     });
  //   });
  // }

  void stopLocationTracking() {
    _positionStream?.cancel();
    print("Deteniendo seguimiento de ubicación");
  }

  void disconnectSocket() {
    _socket.off('id');
    _locationTimer?.cancel();
    if (_socket.connected) {
      _socket.disconnect();
      _socket.onDisconnect((_) {
        print("Disconetceddd");
      });
      print('_Socket desconectado');
      notificationService.showNotification('10-7', 'Tks por el martillo');
    }
    _statusServer.value = ServerStatus.OffLine;
    _socket.dispose();
  }
}
