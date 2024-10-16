import 'dart:async';
import 'package:app_taxis/src/data/models/route_model.dart';
import 'package:app_taxis/src/data/services/routes_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MyMapController extends GetxController {
  StreamSubscription? streamPosition;
  Rx<LatLng> userLocation = LatLng(0.0, 0.0).obs;
  List<LatLng> route = <LatLng>[].obs;
  RoutesProvider _routesProvider = RoutesProvider();

  @override
  void onInit() {
    super.onInit();
    getCurrentPosition();
  }

  Future<LatLng> getCurrentPosition() async {
    try {
      final position = await Geolocator.getCurrentPosition();
      print('Posición actual: $position');
      return LatLng(position.latitude, position.longitude);
    } catch (e) {
      print('Error al obtener la posición: $e');
      return LatLng(0.0, 0.0);
    }
  }

  Future<void> getRoute(LatLng? startLocation) async {
    if (startLocation != null) {
      try {
        LatLng currentPosition = await getCurrentPosition();
        Route routeTemp =
            await _routesProvider.getRoute(currentPosition, startLocation);
        route.assignAll(
            routeTemp.coordinates); // Asegurar actualización reactiva
        print("Ruta obtenida: ${routeTemp.coordinates}");
      } catch (e) {
        print("Error al obtener la ruta: $e");
      }
    } else {
      print("Start location es null, no se puede obtener la ruta.");
    }
  }

  Future<void> startFollowingUnity() async {
    try {
      streamPosition = Geolocator.getPositionStream().listen((event) {
        userLocation.value = LatLng(event.latitude, event.longitude);
        print('Posición actualizada: $userLocation');
      });
    } catch (e) {
      print("Error al iniciar seguimiento de ubicación: $e");
    }
  }

  void stopFollowingUnity() async {
    streamPosition?.cancel();
    print('Suscripción de ubicación cancelada');
  }

  Future<void> openMapWithAddress(String address) async {
    // Convierte la dirección a un formato que se pueda pasar en la URL
    final String encodedAddress = Uri.encodeFull(address);

    // URL para abrir Google Maps con una dirección de destino
    final String googleMapsUrl =
        "https://www.google.com/maps/search/?api=1&query=$encodedAddress";

    // Revisa si el dispositivo puede abrir la URL y abre Google Maps
    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      throw 'No se pudo abrir Google Maps con la dirección proporcionada';
    }
  }

  // Método para abrir Google Maps con coordenadas de destino
  Future<void> openMapWithCoordinates(double lat, double lng) async {
    final String googleMapsUrl =
        "https://www.google.com/maps/search/?api=1&query=$lat,$lng";

    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      throw 'No se pudo abrir Google Maps con las coordenadas proporcionadas';
    }
  }

  @override
  void onClose() {
    stopFollowingUnity();
    super.onClose();
  }
}
