import 'dart:ui';

import 'package:app_taxis/src/screens/home/components/carrer_detail.dart';
import 'package:app_taxis/src/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

class cardCarrer extends StatelessWidget {
  const cardCarrer({
    super.key,
    required this.direccion,
    required this.fecha,
    required this.width,
    required this.height,
    required this.cliente,
    required this.cod_cliente,
    required this.ubicacion_exacta,
    this.observacion = "Sin Observación",
  });
  final String? observacion;
  final double width;
  final double height;
  final DateTime fecha;
  final String cliente;
  final String direccion;
  final String cod_cliente;
  final String ubicacion_exacta;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          border: Border.all(color: Colors.grey, width: 1.0),
        ),
        width: width,
        height: height,
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: height * 0.12,
                  backgroundImage:
                      const AssetImage("assets/images/avatar_driver.png"),
                ),
                SizedBox(width: width * 0.02),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cliente,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        cod_cliente,
                        style: const TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                DateFormat('M/d/y').format(fecha) ==
                        DateFormat('M/d/y').format(DateTime.now())
                    ? "Hoy"
                    : DateFormat('M/d/y').format(fecha),
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ),
            const Divider(),
            Row(
              children: [
                Icon(
                  Icons.radio_button_checked_outlined,
                  color: ColorsApp.lightGreen,
                  size: height * 0.15,
                ),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(DateFormat('HH:mm a').format(fecha))),
                Expanded(
                  child: TextFormField(
                    initialValue: direccion,
                    readOnly: true,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      labelStyle: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    style: const TextStyle(fontSize: 12),
                    cursorColor: Colors.grey,
                  ),
                )
              ],
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Declinar",
                      style: TextStyle(color: ColorsApp.red),
                    )),
                SizedBox(width: width * 0.03),
                Expanded(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsApp.lightGreen,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      onPressed: () {
                        Get.to(CarrerDetailPage(
                          direccion: direccion,
                          cliente: cliente,
                          cod_cliente: cod_cliente,
                          ubicacion_exacta: ubicacion_exacta,
                          observacion: observacion ?? "Sin Observacion",
                        ));

                        //Get.toNamed(Routes.CARRERA_DETAIL);
                        // showBottomSheet(
                        //     elevation: 1,
                        //     context: context,
                        //     shape: const RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.vertical(
                        //         top: Radius.circular(25.0),
                        //       ),
                        //     ),
                        //     builder: (BuildContext context) {
                        //       return Stack(
                        //         children: [
                        //           MapScreen(),
                        //           Container(
                        //             margin: const EdgeInsets.symmetric(
                        //                 horizontal: 10, vertical: 10),
                        //             padding: const EdgeInsets.all(20),
                        //             height: height,
                        //             width: width,
                        //             decoration: BoxDecoration(
                        //                 color: Colors.white.withOpacity(0.5),
                        //                 borderRadius:
                        //                     const BorderRadius.vertical(
                        //                         top: Radius.circular(30),
                        //                         bottom: Radius.circular(30)),
                        //                 boxShadow: const [
                        //                   BoxShadow(
                        //                     color: Color(0x26000000),
                        //                     blurRadius: 30,
                        //                     offset: Offset(0, 0),
                        //                     spreadRadius: 0,
                        //                   )
                        //                 ]),
                        //             child: SingleChildScrollView(
                        //               child: Column(
                        //                 crossAxisAlignment:
                        //                     CrossAxisAlignment.start,
                        //                 mainAxisAlignment:
                        //                     MainAxisAlignment.spaceBetween,
                        //                 children: [
                        //                   Text(
                        //                     cod_cliente,
                        //                     style: const TextStyle(
                        //                         fontSize: 20,
                        //                         fontWeight: FontWeight.bold),
                        //                   ),
                        //                   Text(cliente,
                        //                       style: const TextStyle(
                        //                         fontSize: 15,
                        //                       )),
                        //                   Row(
                        //                     children: [
                        //                       Icon(
                        //                         Icons
                        //                             .radio_button_checked_outlined,
                        //                         color: ColorsApp.lightGreen,
                        //                         size: height * 0.1,
                        //                       ),
                        //                       Expanded(
                        //                         child: Text(
                        //                           direccion,
                        //                           overflow:
                        //                               TextOverflow.ellipsis,
                        //                           maxLines: 1,
                        //                         ),
                        //                       ),
                        //                     ],
                        //                   ),
                        //                   observacion != null
                        //                       ? Text(
                        //                           "Observacion: $observacion")
                        //                       : const Text("Sin Observacion"),
                        //                   const Text(
                        //                     "Ubicación Exacta: ",
                        //                     style: TextStyle(fontSize: 18),
                        //                   ),
                        //                   const Divider(
                        //                     height: 5,
                        //                     thickness: 2,
                        //                     indent: 0,
                        //                     endIndent: 0,
                        //                     color: Colors.black,
                        //                   ),
                        //                   Text(
                        //                     ubicacion_exacta,
                        //                     style: const TextStyle(
                        //                         fontSize: 15,
                        //                         color: Colors.black),
                        //                   ),
                        //                 ],
                        //               ),
                        //             ),
                        //           )
                        //         ],
                        //       );
                        //     });
                      },
                      child: const Text(
                        "Detalle Carrera",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CARRER_DETAIL {}
