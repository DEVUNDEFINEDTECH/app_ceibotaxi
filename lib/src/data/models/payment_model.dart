import 'dart:convert';

Payment paymentFromJson(String str) => Payment.fromJson(json.decode(str));

String paymentToJson(Payment data) => json.encode(data.toJson());

class Payment {
  final int? idCartera;
  final int? idTransaccion;
  final int? idUnidad;
  final int? frecuenciaDetalleId;
  final String? razonSocial;
  final String? cedula;
  final String? celular;
  final int? numeroUnidad;
  final String? placa;
  final String? marca;
  final String? modelo;
  final DateTime? fechaDeuda;
  final int? plazo;
  final String? deuda;
  final String? abono;
  final String? saldo;
  final int? estadoCartera;

  Payment({
    this.idCartera,
    this.idTransaccion,
    this.idUnidad,
    this.frecuenciaDetalleId,
    this.razonSocial,
    this.cedula,
    this.celular,
    this.numeroUnidad,
    this.placa,
    this.marca,
    this.modelo,
    this.fechaDeuda,
    this.plazo,
    this.deuda,
    this.abono,
    this.saldo,
    this.estadoCartera,
  });

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        idCartera: json["id_cartera"],
        idTransaccion: json["id_transaccion"],
        idUnidad: json["id_unidad"],
        frecuenciaDetalleId: json["frecuencia_detalle_id"],
        razonSocial: json["razon_social"],
        cedula: json["cedula"],
        celular: json["celular"],
        numeroUnidad: json["numero_unidad"],
        placa: json["placa"],
        marca: json["marca"],
        modelo: json["modelo"],
        fechaDeuda: json["fecha_deuda"] == null
            ? null
            : DateTime.parse(json["fecha_deuda"]),
        plazo: json["plazo"],
        deuda: json["deuda"],
        abono: json["abono"],
        saldo: json["saldo"],
        estadoCartera: json["estado_cartera"],
      );

  Map<String, dynamic> toJson() => {
        "id_cartera": idCartera,
        "id_transaccion": idTransaccion,
        "id_unidad": idUnidad,
        "frecuencia_detalle_id": frecuenciaDetalleId,
        "razon_social": razonSocial,
        "cedula": cedula,
        "celular": celular,
        "numero_unidad": numeroUnidad,
        "placa": placa,
        "marca": marca,
        "modelo": modelo,
        "fecha_deuda": fechaDeuda?.toIso8601String(),
        "plazo": plazo,
        "deuda": deuda,
        "abono": abono,
        "saldo": saldo,
        "estado_cartera": estadoCartera,
      };
}
