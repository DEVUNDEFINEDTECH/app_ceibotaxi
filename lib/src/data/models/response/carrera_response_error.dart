import 'dart:convert';

class CarreraResponseError {
  bool estado;
  String observacion;
  Datos datos;

  CarreraResponseError({
    required this.estado,
    required this.observacion,
    required this.datos,
  });

  factory CarreraResponseError.fromRawJson(String str) =>
      CarreraResponseError.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CarreraResponseError.fromJson(Map<String, dynamic> json) =>
      CarreraResponseError(
        estado: json["estado"],
        observacion: json["observacion"],
        datos: Datos.fromJson(json["datos"]),
      );

  Map<String, dynamic> toJson() => {
        "estado": estado,
        "observacion": observacion,
        "datos": datos.toJson(),
      };
}

class Datos {
  Datos();

  factory Datos.fromRawJson(String str) => Datos.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datos.fromJson(Map<String, dynamic> json) => Datos();

  Map<String, dynamic> toJson() => {};
}
