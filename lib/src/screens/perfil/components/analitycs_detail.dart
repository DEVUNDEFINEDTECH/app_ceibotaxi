// import 'package:app_taxis/src/config/theme.dart';
// import 'package:app_taxis/src/global_memory.dart';
// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:get/get.dart';

// class AnalyticsDetailPage extends StatefulWidget {
//   @override
//   _AnalyticsDetailPageState createState() => _AnalyticsDetailPageState();
// }

// class _AnalyticsDetailPageState extends State<AnalyticsDetailPage> {
//   GlobalMemory gm = Get.put<GlobalMemory>(GlobalMemory());

//   Map<String, int> obtenerCarrerasPorMes() {
//     Map<String, int> carrerasPorMes = {
//       'Enero': 0,
//       'Febrero': 0,
//       'Marzo': 0,
//       'Abril': 0,
//       'Mayo': 0,
//       'Junio': 0,
//       'Julio': 0,
//       'Agosto': 0,
//       'Septiembre': 0,
//       'Octubre': 0,
//       'Noviembre': 0,
//       'Diciembre': 0,
//     };

//     int anioActual = DateTime.now().year;

//     for (var carrera in gm.carreras) {
//       if (carrera.fecharegistro != null &&
//           carrera.fecharegistro!.year == anioActual) {
//         String mes = _obtenerNombreMes(carrera.fecharegistro!.month);
//         carrerasPorMes[mes] = (carrerasPorMes[mes] ?? 0) + 1;
//       }
//     }

//     return carrerasPorMes;
//   }

//   double calcularMaxY(Map<String, int> carrerasPorMes) {
//     if (carrerasPorMes.isEmpty) return 10; // Valor por defecto si no hay datos.
//     int total = carrerasPorMes.values.fold(0, (sum, value) => sum + value);
//     double promedio = total / carrerasPorMes.length;
//     return (promedio * 1.5)
//         .ceilToDouble(); // Ajustamos maxY al 150% del promedio.
//   }

//   String _obtenerNombreMes(int mes) {
//     const meses = [
//       'Enero',
//       'Febrero',
//       'Marzo',
//       'Abril',
//       'Mayo',
//       'Junio',
//       'Julio',
//       'Agosto',
//       'Septiembre',
//       'Octubre',
//       'Noviembre',
//       'Diciembre'
//     ];
//     return meses[mes - 1];
//   }

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Container(
//                   margin: EdgeInsets.all(width * 0.05),
//                   decoration: const BoxDecoration(
//                       color: ColorsApp.lightGreen,
//                       borderRadius: BorderRadius.all(Radius.circular(10))),
//                   height: height * 0.05,
//                   width: height * 0.05,
//                   child: IconButton(
//                     onPressed: () {
//                       Get.back();
//                     },
//                     icon: const Icon(
//                       Icons.navigate_before_outlined,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//                 const Center(
//                     child: Text(
//                   "Resumen",
//                   style: TextStyle(fontSize: 25),
//                 ))
//               ],
//             ),
//             SizedBox(height: 20),
//             Expanded(
//               child: Obx(() {
//                 Map<String, int> carrerasPorMes = obtenerCarrerasPorMes();
//                 double maxY = calcularMaxY(carrerasPorMes);

//                 return BarChart(
//                   BarChartData(
//                     alignment: BarChartAlignment.spaceAround,
//                     maxY: maxY,
//                     barTouchData: BarTouchData(
//                       touchTooltipData: BarTouchTooltipData(
//                         getTooltipItem: (group, groupIndex, rod, rodIndex) {
//                           String mes = carrerasPorMes.keys.toList()[groupIndex];
//                           return BarTooltipItem(
//                             '$mes\n',
//                             TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold),
//                             children: <TextSpan>[
//                               TextSpan(
//                                 text: '${rod.toY.toInt()} carreras',
//                                 style: TextStyle(color: Colors.yellow),
//                               ),
//                             ],
//                           );
//                         },
//                       ),
//                     ),
//                     titlesData: FlTitlesData(
//                       // leftTitles: AxisTitles(
//                       //   sideTitles:
//                       //       SideTitles(showTitles: true, reservedSize: 28),
//                       // ),
//                       bottomTitles: AxisTitles(
//                         sideTitles: SideTitles(
//                           showTitles: true,
//                           getTitlesWidget: (double value, TitleMeta meta) {
//                             String mes =
//                                 carrerasPorMes.keys.toList()[value.toInt()];
//                             return Text(
//                               mes.substring(0, 3), // Abreviatura del mes
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.bold),
//                             );
//                           },
//                           reservedSize: 42,
//                           interval: 1,
//                         ),
//                       ),
//                     ),
//                     borderData: FlBorderData(
//                       show: true,
//                       border: Border.all(color: Colors.grey, width: 1),
//                     ),
//                     barGroups: _generarBarGroups(carrerasPorMes),
//                   ),
//                 );
//               }),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   List<BarChartGroupData> _generarBarGroups(Map<String, int> carrerasPorMes) {
//     return carrerasPorMes.entries.map((entry) {
//       int index = carrerasPorMes.keys.toList().indexOf(entry.key);
//       return BarChartGroupData(
//         x: index,
//         barRods: [
//           BarChartRodData(
//             toY: entry.value.toDouble(),
//             color: ColorsApp.lightGreen,
//             width: 16,
//             borderRadius: BorderRadius.circular(4),
//           ),
//         ],
//       );
//     }).toList();
//   }
// }
import 'package:app_taxis/src/config/theme.dart';
import 'package:app_taxis/src/global_memory.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';

class AnalyticsDetailPage extends StatefulWidget {
  @override
  _AnalyticsDetailPageState createState() => _AnalyticsDetailPageState();
}

class _AnalyticsDetailPageState extends State<AnalyticsDetailPage> {
  GlobalMemory gm = Get.put<GlobalMemory>(GlobalMemory());

  /// Obtiene un mapa con las carreras por mes de los últimos 6 meses
  Map<String, int> obtenerCarrerasUltimos6Meses() {
    Map<String, int> carrerasPorMes = {};
    DateTime hoy = DateTime.now();

    for (int i = 5; i >= 0; i--) {
      DateTime mes = DateTime(hoy.year, hoy.month - i, 1);
      String nombreMes = _obtenerNombreMes(mes.month);
      carrerasPorMes[nombreMes] = 0;
    }

    for (var carrera in gm.carreras) {
      if (carrera.fecharegistro != null) {
        DateTime fecha = carrera.fecharegistro!;
        DateTime inicio = hoy.subtract(Duration(days: 30 * 5));
        if (fecha.isAfter(inicio) || fecha.isAtSameMomentAs(inicio)) {
          String mes = _obtenerNombreMes(fecha.month);
          if (carrerasPorMes.containsKey(mes)) {
            carrerasPorMes[mes] = (carrerasPorMes[mes] ?? 0) + 1;
          }
        }
      }
    }

    return carrerasPorMes;
  }

  /// Calcula un maxY seguro para evitar desbordamiento
  double calcularMaxY(Map<String, int> carrerasPorMes) {
    if (carrerasPorMes.isEmpty) return 10;
    int max = carrerasPorMes.values.reduce((a, b) => a > b ? a : b);
    return (max * 1.2).ceilToDouble(); // margen del 20%
  }

  String _obtenerNombreMes(int mes) {
    const meses = [
      'Enero',
      'Febrero',
      'Marzo',
      'Abril',
      'Mayo',
      'Junio',
      'Julio',
      'Agosto',
      'Septiembre',
      'Octubre',
      'Noviembre',
      'Diciembre'
    ];
    return meses[mes - 1];
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
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
                    "Resumen",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: Obx(() {
                Map<String, int> carrerasPorMes =
                    obtenerCarrerasUltimos6Meses();
                double maxY = calcularMaxY(carrerasPorMes);

                return BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    maxY: maxY,
                    barTouchData: BarTouchData(
                      touchTooltipData: BarTouchTooltipData(
                        getTooltipItem: (group, groupIndex, rod, rodIndex) {
                          String mes = carrerasPorMes.keys.toList()[groupIndex];
                          return BarTooltipItem(
                            '$mes\n',
                            TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(
                                text: '${rod.toY.toInt()} carreras',
                                style: TextStyle(color: Colors.yellow),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 32,
                          getTitlesWidget: (value, meta) {
                            return Text(
                              value.toInt().toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            );
                          },
                          interval: 10,
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (double value, TitleMeta meta) {
                            int index = value
                                .toInt()
                                .clamp(0, carrerasPorMes.length - 1);
                            String mes = carrerasPorMes.keys.toList()[index];
                            return Text(
                              mes.substring(0, 3),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            );
                          },
                          reservedSize: 42,
                          interval: 1,
                        ),
                      ),
                    ),
                    borderData: FlBorderData(
                      show: true,
                      border: Border.all(color: Colors.grey, width: 1),
                    ),
                    barGroups: _generarBarGroups(carrerasPorMes),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  List<BarChartGroupData> _generarBarGroups(Map<String, int> carrerasPorMes) {
    return carrerasPorMes.entries.map((entry) {
      int index = carrerasPorMes.keys.toList().indexOf(entry.key);
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: entry.value.toDouble(),
            color: ColorsApp.lightGreen,
            width: 16,
            borderRadius: BorderRadius.circular(4),
          ),
        ],
      );
    }).toList();
  }
}
