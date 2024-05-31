class Base {
  int? id;
  String? nombre;
  String? prlimite;
  String? selimite;
  String? telimite;
  String? culimite;
  dynamic observacion;
  bool? estado;
  DateTime? fecharegistro;
  DateTime? fechamodificacion;

  Base({
    this.id,
    this.nombre,
    this.prlimite,
    this.selimite,
    this.telimite,
    this.culimite,
    this.observacion,
    this.estado,
    this.fecharegistro,
    this.fechamodificacion,
  });

  factory Base.fromJson(Map<String, dynamic> json) => Base(
        id: json["id"],
        nombre: json["nombre"] ?? "",
        prlimite: json["prlimite"] ?? "",
        selimite: json["selimite"] ?? "",
        telimite: json["telimite"] ?? "",
        culimite: json["culimite"] ?? "",
        observacion: json["observacion"] ?? "",
        estado: json["estado"],
        fecharegistro: json["fecharegistro"] == null
            ? null
            : DateTime.parse(json["fecharegistro"]),
        fechamodificacion: json["fechamodificacion"] == null
            ? null
            : DateTime.parse(json["fechamodificacion"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "prlimite": prlimite,
        "selimite": selimite,
        "telimite": telimite,
        "culimite": culimite,
        "observacion": observacion,
        "estado": estado,
        "fecharegistro": fecharegistro?.toIso8601String(),
        "fechamodificacion": fechamodificacion?.toIso8601String(),
      };
}
