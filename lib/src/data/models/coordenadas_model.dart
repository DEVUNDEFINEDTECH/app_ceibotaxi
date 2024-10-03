class Coordenadas {
  double? lat;
  double? lng;

  Coordenadas({
    required this.lat,
    required this.lng,
  });

  factory Coordenadas.fromJson(Map<String, dynamic> json) {
    return Coordenadas(
      lat: json["lat"] != null ? double.parse(json["lat"]) : null,
      lng: json["lng"] != null ? double.parse(json["lng"]) : null,
    );
  }

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}
