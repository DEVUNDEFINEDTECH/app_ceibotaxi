class Coordenadas {
  double lat;
  double lng;

  Coordenadas({
    required this.lat,
    required this.lng,
  });

  factory Coordenadas.fromJson(Map<String, dynamic> json) => Coordenadas(
        lat: double.parse(json["lat"]),
        lng: double.parse(json["lng"]),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}
