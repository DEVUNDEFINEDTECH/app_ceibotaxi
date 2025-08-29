// import 'package:app_taxis/src/screens/carrers/carrers_controller.dart';
// import 'package:app_taxis/src/screens/carrers/components/card_carrera_resumen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'package:intl/intl.dart';

// class CarrersScreen extends GetView<CarrersController> {
//   CarrersScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     String? currentDateLabel;
//     return Scaffold(
//       // backgroundColor: ColorsApp.KpBackgroundScreen,
//       appBar: AppBar(
//         backgroundColor: Colors.grey[50],
//         actions: [
//           IconButton(
//               onPressed: () => controller.refreshData(),
//               icon: const Icon(Icons.refresh_outlined))
//         ],
//         automaticallyImplyLeading: false,
//         //   backgroundColor: ColorsApp.KpBackgroundScreen,
//         elevation: 0,
//         title: const Center(
//           child: Text(
//             'Mis Carreras',
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 25,
//               //  color: ColorsApp.kPrimaryColor,
//             ),
//           ),
//         ),
//       ),
//       body: RefreshIndicator(
//         onRefresh: controller.refreshData,
//         child: Column(
//           children: [
//             Obx(
//               () => controller.gm.carreras.isNotEmpty
//                   ? Expanded(
//                       child: ListView.builder(
//                         shrinkWrap: true,
//                         itemCount: controller.gm.carreras.length,
//                         itemBuilder: (context, index) {
//                           final carrera = controller.gm.carreras[index];

//                           // Obtener la fecha de la carrera
//                           DateTime date = carrera.fecharegistro!.toLocal();
//                           String formattedDate =
//                               DateFormat('M/d/y').format(date) ==
//                                       DateFormat('M/d/y').format(DateTime.now())
//                                   ? "Hoy"
//                                   : DateFormat('dd/MM/yyyy').format(date);

//                           // Mostrar el label solo cuando cambia la fecha
//                           Widget dateLabel = formattedDate != currentDateLabel
//                               ? Padding(
//                                   padding: const EdgeInsets.only(top: 8.0),
//                                   child: Text(
//                                     formattedDate,
//                                     style: const TextStyle(
//                                         fontSize: 15, color: Colors.grey),
//                                   ),
//                                 )
//                               : Container();

//                           // Actualizar la fecha actual
//                           currentDateLabel = formattedDate;

//                           return Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Container(
//                                   margin: const EdgeInsets.symmetric(
//                                       horizontal: 20),
//                                   child: dateLabel),
//                               cardCarrerResumen(
//                                   status: carrera.estadocarrera == "D",
//                                   width: width,
//                                   height: height * 0.1,
//                                   cliente: carrera.codigocliente != null
//                                       ? "${carrera.name} ${carrera.apellidopaterno} ${carrera.apellidomaterno}"
//                                       : carrera.nombrecliente ?? "",
//                                   cod_cliente: carrera.codigocliente != null
//                                       ? "Cliente ${carrera.codigocliente.toString()}"
//                                       : "No Cliente")
//                             ],
//                           );
//                         },
//                       ),
//                     )
//                   : const Center(child: Text("No hay Carreras Activas")),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:app_taxis/src/config/theme.dart';
import 'package:app_taxis/src/data/models/carrera_model.dart';
import 'package:app_taxis/src/screens/carrers/carrers_controller.dart';
import 'package:app_taxis/src/screens/carrers/components/card_carrera_resumen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CarrersScreen extends GetView<CarrersController> {
  CarrersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        actions: [
          IconButton(
            onPressed: () => controller.refreshData(),
            icon: const Icon(Icons.refresh_outlined),
          )
        ],
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Center(
          child: Text(
            'Mis Carreras',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: controller.refreshData,
        child: Column(
          children: [
            // Tabs
            Obx(() => Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      buildTab(controller, "Todas", 0),
                      buildTab(controller, "Finalizadas", 1),
                      buildTab(controller, "Canceladas", 2),
                    ],
                  ),
                )),
            // Lista
            Expanded(
              child: Obx(() {
                final carreras = _filtrarCarreras(controller);
                return buildLista(carreras, width, height);
              }),
            ),
          ],
        ),
      ),
    );
  }

  /// Filtro por pestaña seleccionada
  List<Carrera> _filtrarCarreras(CarrersController controller) {
    if (controller.tabIndex.value == 0) {
      return controller.gm.carreras;
    } else if (controller.tabIndex.value == 1) {
      return controller.gm.carreras
          .where((c) => c.estadocarrera == "D") // 👈 NO finalizadas
          .toList();
    } else {
      return controller.gm.carreras
          .where((c) => c.estadocarrera == "C") // 👈 Finalizadas
          .toList();
    }
  }

  Widget buildLista(List<Carrera> data, double width, double height) {
    Map<String, List<Carrera>> agrupado = {};

    for (Carrera carrera in data) {
      DateTime date = carrera.fecharegistro?.toLocal() ?? DateTime.now();
      String formattedDate = DateFormat('M/d/y').format(date) ==
              DateFormat('M/d/y').format(DateTime.now())
          ? "Hoy"
          : DateFormat('dd/MM/yyyy').format(date);

      if (!agrupado.containsKey(formattedDate)) {
        agrupado[formattedDate] = [];
      }
      agrupado[formattedDate]!.add(carrera);
    }
    return ListView(
      children: agrupado.entries.map((entry) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.blue[50],
              width: double.infinity,
              padding: const EdgeInsets.all(8.0),
              child: Text(
                entry.key,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ),
            ...entry.value.map((c) => GestureDetector(
                  onTap: () => mostrarModalDetalleCarrera(Get.context!, c),
                  child: ListTile(
                    title: Text(
                      c.codigocliente != null
                          ? "${c.name} ${c.apellidopaterno} ${c.apellidomaterno}"
                          : c.nombrecliente ?? "",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        c.direccion ?? c.direccionpartida ?? "Sin Dirección"),
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: c.estadocarrera == "D"
                            ? Colors.green[100]
                            : Colors.red[100],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        c.estadocarrera == "D"
                            ? "FINALIZADA"
                            : c.estadocarrera == "C"
                                ? "CANCELADA"
                                : "NO FINALIZADAS",
                        style: TextStyle(
                          color: c.estadocarrera == "D"
                              ? Colors.green
                              : Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                )),
          ],
        );
      }).toList(),
    );
  }

  Widget buildTab(CarrersController controller, String text, int index) {
    final bool selected = controller.tabIndex.value == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.tabIndex.value = index,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: selected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: selected ? Colors.black : Colors.black54,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  void mostrarModalDetalleCarrera(BuildContext context, Carrera carrera) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: SingleChildScrollView(
            child: DetalleCarreraCard(
              codigo: carrera.codigocliente != null
                  ? carrera.codigocliente.toString()
                  : null,
              nombre: carrera.codigocliente != null
                  ? "${carrera.name} ${carrera.apellidopaterno} ${carrera.apellidomaterno}"
                  : carrera.nombrecliente ?? "",
              direccion_partida: carrera.direccion ?? carrera.direccionpartida,
              direccion_llegada: carrera.direcciondestino,
              ubicacion_exacta:
                  carrera.ubicacionexactacliente ?? carrera.direccionpartida,
              fecha: carrera.fecharegistro != null
                  ? DateFormat('dd/MM/yyyy HH:mm')
                      .format(carrera.fecharegistro!.toLocal())
                  : null,
            ),
          ),
        );
      },
    );
  }
}
