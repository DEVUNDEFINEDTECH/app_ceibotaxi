import 'package:app_taxis/src/global_memory.dart';
import 'package:app_taxis/src/routes/app_pages.dart';
import 'package:app_taxis/src/screens/carrers/carrers_controller.dart';
import 'package:app_taxis/src/screens/dashboard/driver/dashboard_controller.dart';
import 'package:app_taxis/src/screens/home/components/card_carrera.dart';
import 'package:app_taxis/src/screens/home/home_controller.dart';
import 'package:app_taxis/src/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class HomeScreen extends GetView<HomeController> {
  CarrersController carrers_controller = Get.find<CarrersController>();
  GlobalMemory gm = Get.find<GlobalMemory>();
  DashboardDriverController dc = Get.find<DashboardDriverController>();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> nombres = gm.user!.nombresUsuario.split(' ');
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      //backgroundColor: Colors.white,
      body: Container(
        //color: controller.modalOpen.value ? Colors.black : Colors.white,
        margin: EdgeInsets.symmetric(
            horizontal: width * 0.05, vertical: height * 0.03),
        //padding: EdgeInsets.symmetric(vertical: height * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //_perfilData(height: height, width: width, gm: gm),
            const Text(
              "Ceibo Taxi",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: ColorsApp.lightGreen),
            ),
            SizedBox(
              height: height * 0.025,
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: height * 0.04,
                  backgroundImage:
                      const AssetImage("assets/images/avatar_driver.png"),
                ),
                SizedBox(width: width * 0.05),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Hola, ${nombres[2]}",
                      style: const TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text(
                      "Unidad  ${gm.unity!.numerounidad}       ",
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    )
                  ],
                )
              ],
            ),

            Row(
              children: [
                GestureDetector(
                    onTap: () => dc.tabIndex.value = 1,
                    child: _card(
                        "Total de Carreras",
                        gm.carreras.length.toString(),
                        height * 0.15,
                        width * 0.4)),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.BASESDETAIL);
                  },
                  child: _card("Total de bases", gm.bases.length.toString(),
                      height * 0.15, width * 0.4),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.015,
            ),
            Row(
              children: [
                const Text(
                  "     Nuevas Carreras ",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                const Expanded(child: Text("")),
                GestureDetector(
                  onTap: () => dc.tabIndex.value = 1,
                  child: const Text(
                    "Ver todas    ",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            SizedBox(
              height: height * 0.015,
            ),
            const Divider(),
            Expanded(
              child: RefreshIndicator(
                onRefresh: carrers_controller.refreshData,
                child: Obx(
                  () => carrers_controller.gm.carreraActiva.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: carrers_controller.gm.carreraActiva.length,
                          itemBuilder: (context, index) {
                            final carrera =
                                carrers_controller.gm.carreraActiva[index];
                            return CardCarrer(
                                observacion: carrera.observacion,
                                ubicacion_exacta:
                                    carrera.ubicacionexactacliente ??
                                        carrera.direccionpartida ??
                                        "",
                                direccion: carrera.codigocliente != null
                                    ? carrera.direccion
                                    : carrera.direccionpartida ??
                                        "Sin Dirección",
                                fecha: carrera.fecharegistro!.toLocal(),
                                width: width,
                                height: height * 0.27,
                                cliente: carrera.codigocliente != null
                                    ? "${carrera.name} ${carrera.apellidopaterno} ${carrera.apellidomaterno}"
                                    : carrera.nombrecliente ?? "",
                                cod_cliente: carrera.codigocliente != null
                                    ? "Cliente ${carrera.codigocliente.toString()}"
                                    : "No Cliente");
                          },
                        )
                      : Column(
                          children: [
                            SizedBox(
                              height: height * 0.05,
                            ),
                            Icon(
                              Icons.taxi_alert_outlined,
                              color: ColorsApp.lightGreen.withOpacity(0.4),
                              size: 100,
                            ),
                            SizedBox(
                              height: height * 0.05,
                            ),
                            const Center(
                                child: Text(
                              "No hay Carreras Activas",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                          ],
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _card(String title, String content, double height, double width) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.all(8),
      child: Card(
        //color: ColorsApp.lightGreen.withOpacity(0.8),
        margin: const EdgeInsets.all(0),
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              25), // Ajusta el radio para controlar el redondeo
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                content,
                style: TextStyle(
                  color: ColorsApp.lightGreen.withOpacity(0.4),
                  fontWeight: FontWeight.bold,
                  fontSize: Get.width < 370 ? 15 : 25,
                ),
              ),
              const Expanded(child: Text("")),
              Text(
                title,
                style: TextStyle(
                  //color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: Get.width < 370 ? 10 : 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
