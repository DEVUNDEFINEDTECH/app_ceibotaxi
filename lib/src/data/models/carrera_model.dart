import 'package:app_taxis/src/data/models/coordenadas_model.dart';

class Carrera {
  int id;
  dynamic clienteid;
  int usuarioid;
  String name;
  String? apellidopaterno;
  String? apellidomaterno;
  String? telefono;
  String? telefonocelular;
  String direccion;
  String? ubicacion;
  int? codigocliente;
  int? baseid;
  String? nombrebase;
  int? unidadid;
  int? numerounidad;
  String? placa;
  String? modelo;
  String? nombrecliente;
  String? direcciondestino;
  String? coordenadasdestino;
  String? direccionpartida;
  String? ubicacionexactacliente;
  String? telefonocliente;
  String? coordenadaspartida;
  String? observacion;
  String? estadocarrera;
  DateTime? fecharegistro;
  DateTime? fechamodificacion;
  Coordenadas? coordenadasPersona;

  Carrera(
      {required this.id,
      this.clienteid,
      required this.usuarioid,
      required this.name,
      this.apellidopaterno,
      this.apellidomaterno,
      this.telefono,
      this.telefonocelular,
      required this.direccion,
      this.ubicacion,
      this.codigocliente,
      this.baseid,
      this.nombrebase,
      this.unidadid,
      this.numerounidad,
      this.placa,
      this.modelo,
      this.nombrecliente,
      this.direcciondestino,
      this.coordenadasdestino,
      this.direccionpartida,
      this.ubicacionexactacliente,
      this.telefonocliente,
      this.coordenadaspartida,
      this.observacion,
      this.estadocarrera,
      this.fecharegistro,
      this.fechamodificacion,
      this.coordenadasPersona});

  factory Carrera.fromJson(Map<String, dynamic> json) => Carrera(
        id: json["id"],
        clienteid: json["clienteid"],
        usuarioid: json["usuarioid"] ?? "",
        name: json["nombres"] ?? "",
        apellidopaterno: json["apellidopaterno"] ?? "",
        apellidomaterno: json["apellidomaterno"] ?? "",
        telefono: json["telefonofijo"] ?? "sin telefono",
        telefonocelular: json["telefonocelular"] ?? "sin celular",
        direccion: json["direccion"] ?? "Sin Dirección de partida",
        ubicacion: json["ubicacionexacta"] ?? "",
        codigocliente: json["codigocliente"],
        baseid: json["baseid"],
        nombrebase: json["nombrebase"],
        unidadid: json["unidadid"],
        numerounidad: json["numerounidad"],
        placa: json["placa"],
        modelo: json["modelo"],
        nombrecliente: json["nombrecliente"],
        direcciondestino: json["direcciondestino"],
        coordenadasdestino: json["coordenadasdestino"],
        direccionpartida: json["direccionpartida"] ?? "",
        ubicacionexactacliente: json["ubicacionexacta"],
        telefonocliente: json["telefonocliente"],
        coordenadaspartida: json["coordenadaspartida"],
        observacion: json["observacionpersona"],
        estadocarrera: json["estadocarrera"],
        fecharegistro: json["fecharegistro"] == null
            ? null
            : DateTime.parse(json["fecharegistro"]),
        fechamodificacion: json["fechamodificacion"] == null
            ? null
            : DateTime.parse(json["fechamodificacion"]),
        coordenadasPersona: (json["coordenadaspersona"]) != null
            ? Coordenadas.fromJson(json["coordenadaspersona"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "clienteid": clienteid,
        "usuarioid": usuarioid,
        "nombres": name,
        "apellidopaterno": apellidopaterno,
        "apellidomaterno": apellidomaterno,
        "telefonofijo": telefono,
        "telefonocelular": telefonocelular,
        "direccion": direccion,
        "ubicacionexacta": ubicacion,
        "codigocliente": codigocliente,
        "baseid": baseid,
        "nombrebase": nombrebase,
        "unidadid": unidadid,
        "numerounidad": numerounidad,
        "placa": placa,
        "modelo": modelo,
        "nombrecliente": nombrecliente,
        "direcciondestino": direcciondestino,
        "coordenadasdestino": coordenadasdestino,
        "direccionpartida": direccionpartida,
        "ubicacionexactacliente": ubicacionexactacliente,
        "telefonocliente": telefonocliente,
        "coordenadaspartida": coordenadaspartida,
        "observacion": observacion,
        "estadocarrera": estadocarrera,
        "fecharegistro": fecharegistro?.toIso8601String(),
        "fechamodificacion": fechamodificacion?.toIso8601String(),
      };
}
