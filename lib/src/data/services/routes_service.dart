import 'package:app_taxis/src/data/models/route_model.dart';
import 'package:app_taxis/src/utils/helpers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RoutesProvider {
  final String _accessToken = tokenMapBox;

  Future<Route> getRoute(LatLng start, LatLng end) async {
    try {
      // Construir la URL de la API de Mapbox
      final url =
          'https://api.mapbox.com/directions/v5/mapbox/driving/${start.longitude},${start.latitude};${end.longitude},${end.latitude}?access_token=$_accessToken&geometries=geojson';

      print("Solicitando ruta desde: $start hasta: $end");
      // Realizar la solicitud HTTP
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // Parsear la respuesta JSON
        final data = jsonDecode(response.body);
        if (data['routes'] != null && data['routes'].isNotEmpty) {
          final route = Route.fromJson(data);
          return route;
        } else {
          print('No se encontraron rutas disponibles en la respuesta.');
          throw Exception('No se encontraron rutas disponibles.');
        }
      } else {
        print(
            'Error en la solicitud. Código de estado: ${response.statusCode}');
        throw Exception('Error en la solicitud: ${response.statusCode}');
      }
    } catch (e) {
      print('Error al obtener la ruta: $e');
      throw Exception('Error al obtener la ruta: $e');
    }
  }
}
