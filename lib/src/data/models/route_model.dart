import 'package:google_maps_flutter/google_maps_flutter.dart';

class Route {
  final List<LatLng> coordinates;
  double? duration;
  double? distance;

  Route({this.duration, this.distance, required this.coordinates});

  factory Route.fromJson(Map<String, dynamic> json) {
    var jsonRoutes = json['routes'] as List;
    List<LatLng> coordinates = jsonRoutes.isNotEmpty
        ? (jsonRoutes[0]['geometry']['coordinates'] as List)
            .map((coord) => LatLng(coord[1], coord[0]))
            .toList()
        : [];

    return Route(
        coordinates: coordinates,
        duration: jsonRoutes[0]['duration'],
        distance: jsonRoutes[0]['distance']);
  }
}
