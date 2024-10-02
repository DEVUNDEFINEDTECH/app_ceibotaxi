import 'package:app_taxis/src/data/models/carrera_model.dart';
import 'package:app_taxis/src/data/services/notification_service.dart';
import 'package:app_taxis/src/global_memory.dart';
import 'package:app_taxis/src/utils/helpers.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

// ignore: constant_identifier_names
enum ServerStatus { OnLine, OffLine, Conecting }

NotificationService notificationService = NotificationService();

GlobalMemory gm = Get.find<GlobalMemory>();

class SocketsService extends GetxController {
  final Rx<ServerStatus> _statusServer = ServerStatus.Conecting.obs;
  late IO.Socket _socket;
  IO.Socket get socket => _socket;
  ServerStatus get status => _statusServer.value;

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
                gm.carreraActiva[0].direccion);
            // showBottomSheet(
            //     context: Get.context!,
            //     builder: (context) {
            //       return Container(
            //         child: Text("Nueva carrera"),
            //       );
            //     });
            // showCupertinoModalBottomSheet(
            //   context: Get.context,
            //   builder: (context) => Container(
            //     child: cardCarrer(
            //         hora: gm.carreraActiva[0].fecharegistro.toString(),
            //         width: width,
            //         height: height,
            //         cliente: carrera.name,
            //         cod_cliente: carrera.codigocliente ?? 00),
            //   ),
            // );
          } else {}
        });
        _statusServer.value = ServerStatus.OnLine;
        //notificationService.showNotification('10-8', 'Bienvenido al martillo');
      });
    }
  }

  void disconnectSocket() {
    _socket.off('id');
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
