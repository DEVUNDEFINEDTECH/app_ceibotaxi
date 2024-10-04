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
  BitmapDescriptor? customIconStart;
  BitmapDescriptor? customIconEnd;
  Set<Polyline> polylines = {};

  @override
  void initState() {
    super.initState();
    myMapController.startFollowingUnity();
    _initializeMap();
  }

  Future<void> _initializeMap() async {
    await myMapController.getRoute(widget.startLocation);
    _loadCustomMarker();
  }

  @override
  void dispose() {
    myMapController.stopFollowingUnity();
    super.dispose();
  }

  Future<void> _loadCustomMarker() async {
    final iconStart = await BitmapDescriptor.asset(
      const ImageConfiguration(size: Size(35, 35)), // Tamaño de la imagen
      'assets/images/logo_rtsg.png', // Ruta a tu imagen
    );
    final iconEnd = await BitmapDescriptor.asset(
      const ImageConfiguration(size: Size(35, 35)), // Tamaño de la imagen
      'assets/images/icon_home.png', // Ruta a tu imagen
    );

    print("STRAT Location : ${widget.startLocation}");
    print("End Location : ${widget.endLocation}");

    if (widget.startLocation != null) {
      setState(() {
        customIconEnd = iconEnd;
      });
    }

    if (myMapController.route.isNotEmpty) {
      Polyline polyline = Polyline(
        polylineId: const PolylineId('polyline_id'),
        points: myMapController.route, // Usa tu lista de coordenadas aquí
        color: Colors.blue, // Color de la polyline
        width: 5, // Ancho de la línea
      );

      print("ruta:${myMapController.route}");

      setState(() {
        customIconStart = iconStart;
        polylines.add(polyline);
      });
    } else {
      setState(() {
        customIconStart = iconStart;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print(myMapController.userLocation.value);
    GoogleMapController? _mapController;
    RxDouble _currentZoom = 14.0.obs;

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
            : Obx(() => GoogleMap(
                  zoomControlsEnabled: false,
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                      target: myMapController.userLocation.value,
                      zoom: _currentZoom.value),
                  polylines: polylines,
                  markers: {
                    Marker(
                      markerId: const MarkerId('origin'),
                      position: myMapController.userLocation.value,
                      icon: customIconStart ??
                          BitmapDescriptor.defaultMarker, // Icono personalizado
                      infoWindow: const InfoWindow(
                          title: 'Ubicación Actual',
                          snippet: 'Tu ubicación actual'),
                    ),
                    if (widget.startLocation != null)
                      Marker(
                        markerId: const MarkerId('destino'),
                        position: widget.startLocation ?? LatLng(0.0, 0.0),
                        icon: customIconEnd ??
                            BitmapDescriptor
                                .defaultMarker, // Icono personalizado
                        infoWindow: const InfoWindow(
                            title: 'LLegada',
                            snippet: 'Aqui hay que recojer al cliente'),
                      ),
                  },
                  onMapCreated: (GoogleMapController controller) {
                    _mapController = controller;
                  },
                ));
      }),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //const SizedBox(height: 20),
          FloatingActionButton(
            mini: true,
            heroTag: "zoom_in",
            onPressed: () {
              _currentZoom.value += 1;
              _mapController?.animateCamera(CameraUpdate.zoomIn());
            },
            child: const Icon(Icons.zoom_in),
          ),
          const SizedBox(height: 3),
          FloatingActionButton(
            mini: true,
            heroTag: "zoom_out",
            onPressed: () {
              _currentZoom.value -= 1;
              _mapController?.animateCamera(CameraUpdate.zoomOut());
            },
            child: const Icon(Icons.zoom_out),
          ),
        ],
      ),
    );
  }
}
