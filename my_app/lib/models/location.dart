// To parse this JSON data, do
//
//     final location = locationFromJson(jsonString);

import 'dart:convert';

Location locationFromJson(String str) => Location.fromJson(json.decode(str));

String locationToJson(Location data) => json.encode(data.toJson());

class Location {
  Location({
    required this.error,
    required this.msg,
    required this.data,
  });

  bool error;
  String msg;
  List<Parking> data;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        error: json["error"],
        msg: json["msg"],
        data: List<Parking>.from(json["data"].map((x) => Parking.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "msg": msg,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Parking {
  Parking({
    required this.name,
    required this.long,
    required this.lat,
  });

  String name;
  dynamic long;
  dynamic lat;

  factory Parking.fromJson(Map<String, dynamic> json) => Parking(
        name: json["name"],
        long: json["long"],
        lat: json["lat"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "long": long,
        "lat": lat,
      };
}
