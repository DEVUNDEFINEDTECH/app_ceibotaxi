class Coordenadas {
  double? lat;
  double? lng;

  Coordenadas({
    required this.lat,
    required this.lng,
  });

  factory Coordenadas.fromJson(Map<String, dynamic> json) {
    return Coordenadas(
      lat: _parseDouble(json["lat"]),
      lng: _parseDouble(json["lng"]),
    );
  }

  static double? _parseDouble(dynamic value) {
    if (value == null) return null;
    try {
      return double.parse(value.toString());
    } catch (e) {
      // Si ocurre un error en la conversión, se devuelve null
      return null;
    }
  }

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}
