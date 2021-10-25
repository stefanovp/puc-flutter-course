// To parse this JSON data, do
//
//     final parking = parkingFromJson(jsonString);

import 'dart:convert';

List<Parking> parkingFromJson(String str) =>
    List<Parking>.from(json.decode(str).map((x) => Parking.fromJson(x)));

String parkingToJson(List<Parking> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Parking {
  Parking({
    required this.name,
    required this.id,
    required this.available,
    required this.total,
    required this.outline,
  });

  String name;
  int id;
  int available;
  int total;
  List<Outline> outline;

  factory Parking.fromJson(Map<String, dynamic> json) => Parking(
        name: json["name"],
        id: json["id"],
        available: json["available"],
        total: json["total"],
        outline:
            List<Outline>.from(json["outline"].map((x) => Outline.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "available": available,
        "total": total,
        "outline": List<dynamic>.from(outline.map((x) => x.toJson())),
      };
}

class Outline {
  Outline({
    required this.lat,
    required this.lon,
  });

  double lat;
  double lon;

  factory Outline.fromJson(Map<String, dynamic> json) => Outline(
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
      };
}
