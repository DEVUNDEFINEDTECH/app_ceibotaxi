import 'dart:convert';

import 'package:app_taxis/src/data/models/base_model.dart';
import 'package:app_taxis/src/data/models/payment_model.dart';

PaymentResponse paymentResponseFromJson(String str) =>
    PaymentResponse.fromJson(json.decode(str));

String paymentResponseToJson(PaymentResponse data) =>
    json.encode(data.toJson());

class PaymentResponse {
  bool? estado;
  dynamic observacion;
  List<Payment>? datos;

  PaymentResponse({
    this.estado,
    this.observacion,
    this.datos,
  });

  factory PaymentResponse.fromJson(Map<String, dynamic> json) =>
      PaymentResponse(
        estado: json["estado"],
        observacion: json["observacion"],
        datos: json["datos"] == null
            ? []
            : List<Payment>.from(
                json["datos"]!.map((x) => Payment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "estado": estado,
        "observacion": observacion,
        "datos": datos == null
            ? []
            : List<dynamic>.from(datos!.map((x) => x.toJson())),
      };
}
