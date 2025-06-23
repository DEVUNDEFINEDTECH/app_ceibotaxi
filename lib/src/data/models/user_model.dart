import 'package:app_taxis/src/data/models/unidad_model.dart';

class User {
  bool estado;
  int idpersona;
  int idusuario;
  String nombresUsuario;
  String? telefonoFijo;
  String? celular;
  String usuario;
  String rol;
  int rolid;
  String sexo;
  bool recuperacion;
  List<Unidad>? unidad;
  String? observacion;
  String? cedula;
  String token;

  User({
    required this.estado,
    required this.idpersona,
    required this.idusuario,
    required this.nombresUsuario,
    required this.usuario,
    required this.rol,
    required this.rolid,
    required this.sexo,
    required this.recuperacion,
    this.unidad,
    this.cedula,
    this.observacion,
    this.telefonoFijo,
    this.celular,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        cedula: json["cedulausuario"],
        estado: json["estado"],
        idpersona: json["idpersona"],
        idusuario: json["idusuario"],
        nombresUsuario: json["nombres_usuario"],
        telefonoFijo: json["telefonofijo"],
        celular: json["telefonocelular"],
        usuario: json["usuario"],
        rol: json["rol"],
        rolid: json["rolid"],
        sexo: json["sexo"],
        recuperacion: json["recuperacion"],
        unidad: (json["unidad"]) != null
            ? List<Unidad>.from(json["unidad"].map((x) => Unidad.fromJson(x)))
            : null,
        observacion: json["observacion"] ?? "",
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "cedulausuario": cedula,
        "estado": estado,
        "idpersona": idpersona,
        "idusuario": idusuario,
        "nombres_usuario": nombresUsuario,
        "telefonofijo": telefonoFijo,
        "telefonocelular": celular,
        "usuario": usuario,
        "rol": rol,
        "rolid": rolid,
        "sexo": sexo,
        "recuperacion": recuperacion,
        "unidad": List<dynamic>.from(unidad!.map((x) => x.toJson())),
        "observacion": observacion,
        "token": token,
      };
}
