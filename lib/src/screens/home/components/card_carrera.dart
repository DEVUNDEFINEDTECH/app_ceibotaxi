import 'dart:ui';
import 'package:app_taxis/src/data/models/carrera_model.dart';
import 'package:app_taxis/src/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardCarrer extends StatelessWidget {
  const CardCarrer({
    super.key,
    required this.carrer,
    required this.width,
    required this.height,
    required this.finalizar,
    required this.detalle,
  });
  final Carrera carrer;
  final VoidCallback finalizar;
  final VoidCallback detalle;
  final double width;
  final double height;

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
                        "${carrer.name} ${carrer.apellidopaterno} ${carrer.apellidomaterno}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        carrer.codigocliente != null
                            ? carrer.codigocliente.toString()
                            : "Nocliente",
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
                DateFormat('M/d/y').format(
                          carrer.fecharegistro!.toLocal(),
                        ) ==
                        DateFormat('M/d/y').format(DateTime.now())
                    ? "Hoy"
                    : DateFormat('M/d/y').format(
                        carrer.fecharegistro!.toLocal(),
                      ),
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
                    child: Text(DateFormat('HH:mm a').format(
                      carrer.fecharegistro!.toLocal(),
                    ))),
                Expanded(
                  child: TextFormField(
                    initialValue: carrer.direccion != null
                        ? carrer.direccion
                        : carrer.direccionpartida ?? "Sin Dirección",
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
                    onPressed: finalizar,
                    child: const Text(
                      "Finalizar",
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
                      onPressed: detalle,
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
