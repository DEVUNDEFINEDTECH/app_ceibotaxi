import 'package:app_taxis/src/config/theme.dart';
import 'package:flutter/material.dart';

class DetalleCarreraCard extends StatelessWidget {
  //const DetalleCarreraCard({super.key});
  const DetalleCarreraCard(
      {super.key,
      this.codigo,
      this.nombre,
      this.direccion_partida,
      this.direccion_llegada,
      this.estado_carrera,
      this.ubicacion_exacta,
      this.fecha});
  final String? codigo;
  final String? nombre;
  final String? direccion_partida;
  final String? direccion_llegada;
  final String? estado_carrera;
  final String? ubicacion_exacta;
  final String? fecha;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const Text(
          //   'Detalle carrera',
          //   style: TextStyle(
          //     fontSize: 20,
          //     fontWeight: FontWeight.bold,
          //     color: Colors.black87,
          //   ),
          // ),
          Row(
            children: [
              Expanded(child: SizedBox()),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: estado_carrera == "D"
                      ? Colors.green[100]
                      : Colors.red[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  estado_carrera == "D"
                      ? "FINALIZADA"
                      : estado_carrera == "C"
                          ? "CANCELADA"
                          : "NO FINALIZADAS",
                  style: TextStyle(
                    color: estado_carrera == "D" ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          Text(
            'Cliente # ${codigo ?? '---'}',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              //color: Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '${nombre ?? '---'}',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Icon(
                Icons.radio_button_checked_outlined,
                color: ColorsApp.lightGreen,
                size: 25,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  direccion_partida ?? '-----',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          Row(
            children: [
              Icon(
                Icons.pin_drop_sharp,
                color: ColorsApp.lightGreen,
                size: 25,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  direccion_llegada ?? '-----',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Ubicación exacta',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const Divider(),
          Text(
            ubicacion_exacta ??
                'No se proporcionó una ubicación exacta para esta carrera.',
            style: TextStyle(fontSize: 14, color: Colors.black54),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              fecha ?? '--/--/----',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
