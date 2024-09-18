import 'package:app_taxis/src/data/models/route_model.dart';
import 'package:app_taxis/src/utils/helpers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RoutesProvider {
  final String _accessToken = tokenMapBox;

  Future<Route> getRoute(LatLng start, LatLng end) async {
    final url =
        'https://api.mapbox.com/directions/v5/mapbox/driving/${start.longitude},${start.latitude};${end.longitude},${end.latitude}?access_token=$_accessToken&geometries=geojson';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final route = Route.fromJson(data);
      return route;
    } else {
      throw Exception('Failed to load route');
    }
  }
}
