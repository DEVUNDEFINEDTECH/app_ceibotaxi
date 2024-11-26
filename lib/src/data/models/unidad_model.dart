import 'dart:convert';

class Unidad {
  int id;
  String placa;
  String marca;
  String modelo;
  String anovehiculo;
  dynamic fechaultimarevision;
  dynamic observacion;
  int socioid;
  bool estado;
  int numerounidad;
  String apellidopaterno;
  String apellidomaterno;
  String nombres;
  DateTime fecharegistro;
  DateTime? fechamodificacion;

  Unidad({
    required this.id,
    required this.placa,
    required this.marca,
    required this.modelo,
    required this.anovehiculo,
    this.fechaultimarevision,
    this.observacion,
    required this.socioid,
    required this.estado,
    required this.numerounidad,
    required this.apellidopaterno,
    required this.apellidomaterno,
    required this.nombres,
    required this.fecharegistro,
    this.fechamodificacion,
  });

  factory Unidad.fromRawJson(String str) => Unidad.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Unidad.fromJson(Map<String, dynamic> json) => Unidad(
        id: json["id"],
        placa: json["placa"],
        marca: json["marca"],
        modelo: json["modelo"],
        anovehiculo: json["anovehiculo"],
        fechaultimarevision: json["fechaultimarevision"],
        observacion: json["observacion"],
        socioid: json["socioid"],
        estado: json["estado"],
        numerounidad: json["numerounidad"],
        apellidopaterno: json["apellidopaterno"],
        apellidomaterno: json["apellidomaterno"],
        nombres: json["nombres"],
        fecharegistro: DateTime.parse(json["fecharegistro"]),
        fechamodificacion: json["fechamodificacion"] =
            null ?? DateTime.parse(json["fechamodificacion"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "placa": placa,
        "marca": marca,
        "modelo": modelo,
        "anovehiculo": anovehiculo,
        "fechaultimarevision": fechaultimarevision,
        "observacion": observacion,
        "socioid": socioid,
        "estado": estado,
        "numerounidad": numerounidad,
        "apellidopaterno": apellidopaterno,
        "apellidomaterno": apellidomaterno,
        "nombres": nombres,
        "fecharegistro": fecharegistro.toIso8601String(),
        "fechamodificacion": fechamodificacion!.toIso8601String(),
      };
}
