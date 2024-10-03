import 'package:app_taxis/src/screens/map/map_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  final LatLng? startLocation;
  final LatLng? endLocation;
  const MapScreen({super.key, this.startLocation, this.endLocation});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  MyMapController myMapController = MyMapController();
  BitmapDescriptor? customIcon;
  Set<Polyline> polylines = {};

  @override
  void initState() {
    super.initState();
    myMapController.startFollowingUnity();
    myMapController.getRoute(widget.startLocation);
    _loadCustomMarker();
  }

  @override
  void dispose() {
    myMapController.stopFollowingUnity();
    super.dispose();
  }

  Future<void> _loadCustomMarker() async {
    final icon = await BitmapDescriptor.asset(
      const ImageConfiguration(size: Size(35, 25)), // Tamaño de la imagen
      'assets/images/logo_rtsg.png', // Ruta a tu imagen
    );

    Polyline polyline = Polyline(
      polylineId: const PolylineId('polyline_id'),
      points: myMapController.route, // Usa tu lista de coordenadas aquí
      color: Colors.blue, // Color de la polyline
      width: 5, // Ancho de la línea
    );

    print("ruta:${myMapController.route}");

    setState(() {
      customIcon = icon;
      polylines.add(polyline);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(myMapController.userLocation.value);

    return Scaffold(
      body: Obx(() {
        return myMapController.userLocation.value == LatLng(0.0, 0.0)
            ? Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        color: Get.theme.colorScheme.primary,
                      ),
                      const Text("Espere Por Favor")
                    ]),
              )
            : GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                    // bearing: 192.8334901395799,
                    target: myMapController.userLocation.value,
                    //tilt: 59.440717697143555,
                    zoom: 19.151926040649414),
                polylines: polylines,
                markers: {
                    Marker(
                      markerId: const MarkerId('origin'),
                      position: myMapController.userLocation.value,
                      icon: customIcon ??
                          BitmapDescriptor.defaultMarker, // Icono personalizado
                      infoWindow: const InfoWindow(
                          title: 'Ubicación Actual',
                          snippet: 'Tu ubicación actual'),
                    ),
                  }
                // onMapCreated: (GoogleMapController controller) {
                //   _controller.complete(controller);
                // },
                );
      }),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:map_example/src/widgets/map/custom_map_controller.dart';

// class CustomMap extends StatelessWidget {
//   final LatLng? startLocation;
//   final LatLng? endLocation;

//   const CustomMap({super.key, this.startLocation, this.endLocation});

//   @override
//   Widget build(BuildContext context) {
//     // Registra el controlador solo si aún no está registrado
//     if (!Get.isRegistered<MapController>()) {
//       Get.put(MapController());
//     }
//     final MapController mapController = Get.find<MapController>();

//     if (startLocation != null && endLocation != null) {
//       mapController.setInitialPosition(startLocation!);
//       mapController.getRoute(startLocation!, endLocation!);
//       mapController.addEndMarker(endLocation!);
//     }

//     return Scaffold(
//       body: Obx(
//         () => GoogleMap(
//           mapType: MapType.normal,
//           initialCameraPosition: mapController.initialPosition.value,
//           onMapCreated: (GoogleMapController controller) {
//             mapController.googleMapController.complete(controller);
//           },
//           polylines: mapController.polylines,
//           markers: mapController.markers,
//         ),
//       ),
//       // floatingActionButton: FloatingActionButton.extended(
//       //   onPressed: startLocation != null && endLocation != null
//       //       ? () => mapController.getRoute(startLocation!, endLocation!)
//       //       : () => print("Sin coordenadas ${startLocation}  ${endLocation}"),
//       //   label: const Text('To the destination!'),
//       //   icon: const Icon(Icons.directions),
//       // ),
//       floatingActionButton: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           FloatingActionButton.extended(
//             onPressed: startLocation != null && endLocation != null
//                 ? () => mapController.getRoute(startLocation!, endLocation!)
//                 : () =>
//                     print("Sin coordenadas ${startLocation}  ${endLocation}"),
//             label: const Text('To the destination!'),
//             icon: const Icon(Icons.directions),
//           ),
//           SizedBox(height: 16),
//           FloatingActionButton.extended(
//             onPressed: startLocation != null && endLocation != null
//                 ? () => mapController.openMapsApp(startLocation!, endLocation!)
//                 : () =>
//                     print("Sin coordenadas ${startLocation}  ${endLocation}"),
//             label: const Text('Open in Maps'),
//             icon: const Icon(Icons.map),
//           ),
//         ],
//       ),
//     );
//   }
// }
