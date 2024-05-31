import 'package:app_taxis/src/data/models/user_model.dart';

class LoginResponse {
  bool estado;
  String? observacion;
  User? datos;
  String? token;

  LoginResponse({
    required this.estado,
    this.observacion,
    this.datos,
    required this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        estado: json["estado"],
        observacion: json["observacion"] ?? "",
        datos: json["estado"] == false ? null : User.fromJson(json["datos"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "estado": estado,
        "observacion": observacion,
        "datos": datos!.toJson(),
        "token": token,
      };
}
