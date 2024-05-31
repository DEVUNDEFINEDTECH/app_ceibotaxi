import 'dart:convert';

import 'package:app_taxis/src/data/models/base_model.dart';

BasesResponse basesResponseFromJson(String str) =>
    BasesResponse.fromJson(json.decode(str));

String basesResponseToJson(BasesResponse data) => json.encode(data.toJson());

class BasesResponse {
  bool? estado;
  dynamic observacion;
  List<Base>? datos;

  BasesResponse({
    this.estado,
    this.observacion,
    this.datos,
  });

  factory BasesResponse.fromJson(Map<String, dynamic> json) => BasesResponse(
        estado: json["estado"],
        observacion: json["observacion"],
        datos: json["datos"] == null
            ? []
            : List<Base>.from(json["datos"]!.map((x) => Base.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "estado": estado,
        "observacion": observacion,
        "datos": datos == null
            ? []
            : List<dynamic>.from(datos!.map((x) => x.toJson())),
      };
}
