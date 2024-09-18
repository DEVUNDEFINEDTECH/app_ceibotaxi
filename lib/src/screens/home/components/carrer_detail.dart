import 'package:app_taxis/src/screens/map/map_screen.dart';
import 'package:app_taxis/src/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarrerDetailPage extends StatelessWidget {
  final String direccion;
  final String cliente;
  final String cod_cliente;
  final String ubicacion_exacta;
  final String observacion;

  CarrerDetailPage({
    required this.direccion,
    required this.cliente,
    required this.cod_cliente,
    required this.ubicacion_exacta,
    required this.observacion,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          MapScreen(),
          Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(width * 0.05),
                    decoration: const BoxDecoration(
                        color: ColorsApp.lightGreen,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    height: height * 0.05,
                    width: height * 0.05,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.navigate_before_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Center(
                      child: Text(
                    "Detalle Carrera",
                    style: TextStyle(fontSize: 25),
                  ))
                ],
              ),
              Expanded(child: SizedBox()),
              card_detail(height, width),
            ],
          )
        ],
      ),
    ));
  }

  Container card_detail(double height, double width) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: const EdgeInsets.all(20),
      height: height * 0.2,
      width: width,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          borderRadius: const BorderRadius.vertical(
              top: Radius.circular(30), bottom: Radius.circular(30)),
          boxShadow: const [
            BoxShadow(
              color: Color(0x26000000),
              blurRadius: 30,
              offset: Offset(0, 0),
              spreadRadius: 0,
            )
          ]),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(cliente,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Row(
              children: [
                Icon(
                  Icons.radio_button_checked_outlined,
                  color: ColorsApp.lightGreen,
                  size: height * 0.03,
                ),
                Expanded(
                  child: Text(
                    direccion,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
            Text(
              "Coordenadas: $ubicacion_exacta",
              style: const TextStyle(fontSize: 15, color: Colors.black),
            ),
            const Divider(
              height: 5,
              thickness: 2,
              indent: 0,
              endIndent: 0,
              color: Colors.black,
            ),
            Text("Observacion: $observacion")
          ],
        ),
      ),
    );
  }
}
