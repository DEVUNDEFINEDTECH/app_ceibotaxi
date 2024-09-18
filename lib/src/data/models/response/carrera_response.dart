import 'package:app_taxis/src/data/models/carrera_model.dart';

class CarrerasResponse {
  bool? estado;
  dynamic observacion;
  List<Carrera>? datos;

  CarrerasResponse({
    this.estado,
    this.observacion,
    this.datos,
  });
  factory CarrerasResponse.fromJson(Map<String, dynamic> json) {
    return CarrerasResponse(
      estado: json["estado"],
      observacion: json["observacion"],
      datos: json["datos"]!.isNotEmpty
          ? List<Carrera>.from(json["datos"]!.map((x) => Carrera.fromJson(x)))
          : [],
    );
  }

  Map<String, dynamic> toJson() => {
        "estado": estado,
        "observacion": observacion,
        "datos": datos == []
            ? []
            : List<dynamic>.from(datos!.map((x) => x.toJson())),
      };
}
