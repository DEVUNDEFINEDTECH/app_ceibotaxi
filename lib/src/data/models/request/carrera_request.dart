class CarreraRequest {
  const CarreraRequest(this.estado, this.unidadId);
  final String estado;
  final String unidadId;
  Map<String, dynamic> toJson() {
    return {
      'estadocarrera': estado,
      'unidadid': unidadId,
    };
  }
}
