import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyMapController extends GetxController {
  StreamSubscription? streamPosition;
  //final location = Location();
  Rx<LatLng> userLocation = LatLng(0.0, 0.0).obs;
  late final List<LatLng> historyLocation;

  @override
  void onInit() {
    print("iniciando el mapa");
    super.onInit();
    getCurrentPosition();
    // _getLocationUpdates();
  }

  Future getCurrentPosition() async {
    final position = await Geolocator.getCurrentPosition();
    userLocation.value = LatLng(position.latitude, position.longitude);

    print('Posicion $position');
  }

  void startFollowingUnity() async {
    streamPosition = Geolocator.getPositionStream().listen((event) {
      final position = event;
      userLocation.value = LatLng(position.latitude, position.longitude);
      print('Posicion $userLocation');
    });
  }

  void stopFollowingUnity() async {
    streamPosition?.cancel();
    print('Stop Suscripction');
  }

  @override
  void onClose() {
    stopFollowingUnity();
    super.onClose();
  }
}
