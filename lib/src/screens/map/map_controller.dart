import 'dart:async';

import 'package:flutter/material.dart';
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
// Future<void> drawRoute() async {
//     // Coordenadas de origen y destino
//     LatLng origin = LatLng(37.7749, -122.4194); // Por ejemplo, San Francisco
//     LatLng destination = LatLng(37.3382, -121.8863); // Por ejemplo, San Jose

//     // Realiza la solicitud de dirección a la API de Google Maps
//     final directions.DirectionsResponse response = await directions
//         .GoogleMapsDirections(apiKey: 'TU_API_KEY') // Reemplaza con tu clave de API de Google Maps
//         .directionsWithLocation(
//           Location(origin.latitude, origin.longitude),
//           Location(destination.latitude, destination.longitude),
//           travelMode: directions.TravelMode.driving,
//         );

//     // Verifica que la respuesta sea exitosa
//     if (response.isOkay) {
//       // Obtiene la primera ruta de la respuesta
//       final route = response.results.first;

//       // Crea una polilínea a partir de los puntos de la ruta
//       Polyline polyline = Polyline(
//         polylineId: PolylineId('route'),
//         visible: true,
//         points: route.geometry,
//         color: Colors.blue,
//         width: 6,
//       );}
  // void _getLocationUpdates() {
  //   location.onLocationChanged.listen((LocationData locationData) {
  //     userLocation.value = LatLng(locationData.latitude ?? 0.0, locationData.longitude ?? 0.0);
  //   });
  // }
  @override
  void onClose() {
    stopFollowingUnity();
    super.onClose();
  }
}
