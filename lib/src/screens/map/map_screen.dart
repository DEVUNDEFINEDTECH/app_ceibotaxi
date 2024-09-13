import 'package:app_taxis/src/screens/map/map_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  MyMapController myMapController = MyMapController();

  @override
  void initState() {
    super.initState();
    myMapController.startFollowingUnity();
  }

  @override
  void dispose() {
    myMapController.stopFollowingUnity();
    super.dispose();
  }

  Set<Polyline> polylines = {};
  // Set<Marker> markers = {
  //   Marker(
  //     markerId: MarkerId('origin'),
  //     position: myMapController.userLocation.value,
  //     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
  //     infoWindow: InfoWindow(title: 'Origen', snippet: 'Inicio del viaje'),
  //   ),
  //   // Marker(
  //   //   markerId: MarkerId('destino'),
  //   //   position: origin,
  //   //   icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
  //   //   infoWindow: InfoWindow(title: 'Destino', snippet: 'Destino del viaje'),
  //   // )
  // };

  // final CameraPosition _cameraPosition = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(-1.0385661, -80.4858653),
  //     tilt: 59.440717697143555,
  //     zoom: 15);
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
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueGreen),
                      infoWindow: const InfoWindow(
                          title: 'Origen', snippet: 'Inicio del viaje'),
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
