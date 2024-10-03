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
    String? currentDateLabel;
    return Scaffold(
      // backgroundColor: ColorsApp.KpBackgroundScreen,
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        actions: [
          IconButton(
              onPressed: () => controller.refreshData(),
              icon: const Icon(Icons.refresh_outlined))
        ],
        automaticallyImplyLeading: false,
        //   backgroundColor: ColorsApp.KpBackgroundScreen,
        elevation: 0,
        title: const Center(
          child: Text(
            'Mis Carreras',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              //  color: ColorsApp.kPrimaryColor,
            ),
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: controller.refreshData,
        child: Column(
          children: [
            Obx(
              () => controller.gm.carreras.isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.gm.carreras.length,
                        itemBuilder: (context, index) {
                          final carrera = controller.gm.carreras[index];

                          // Obtener la fecha de la carrera
                          DateTime date = carrera.fecharegistro!.toLocal();
                          String formattedDate =
                              DateFormat('M/d/y').format(date) ==
                                      DateFormat('M/d/y').format(DateTime.now())
                                  ? "Hoy"
                                  : DateFormat('dd/MM/yyyy').format(date);

                          // Mostrar el label solo cuando cambia la fecha
                          Widget dateLabel = formattedDate != currentDateLabel
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    formattedDate,
                                    style: const TextStyle(
                                        fontSize: 15, color: Colors.grey),
                                  ),
                                )
                              : Container();

                          // Actualizar la fecha actual
                          currentDateLabel = formattedDate;

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: dateLabel),
                              cardCarrerResumen(
                                  status: carrera.estadocarrera == "D",
                                  width: width,
                                  height: height * 0.1,
                                  cliente: carrera.codigocliente != null
                                      ? "${carrera.name} ${carrera.apellidopaterno} ${carrera.apellidomaterno}"
                                      : carrera.nombrecliente ?? "",
                                  cod_cliente: carrera.codigocliente != null
                                      ? "Cliente ${carrera.codigocliente.toString()}"
                                      : "No Cliente")
                            ],
                          );
                        },
                      ),
                    )
                  : const Center(child: Text("No hay Carreras Activas")),
            ),
          ],
        ),
      ),
    );
  }
}
