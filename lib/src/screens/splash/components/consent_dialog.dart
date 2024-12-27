import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> showConsentDialog() async {
  return await showDialog<bool>(
        context: Get.context!,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Consentimiento para acceder a la ubicación'),
            content: const Text(
              "RTSG recopila datos de ubicación para habilitar rastreo de rutas y viajes, "
              "incluso cuando la app está cerrada o no se está utilizando. Estos datos también se usan para establecer tiempos de y distancias estimadas para los viajes.",
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false); // El usuario rechaza
                },
                child: const Text('Rechazar'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true); // El usuario acepta
                },
                child: const Text('Aceptar'),
              ),
            ],
          );
        },
      ) ??
      false; // Devuelve 'false' si el diálogo es cerrado sin selección
}
