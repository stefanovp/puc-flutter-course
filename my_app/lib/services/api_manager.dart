import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:my_app/models/location.dart';

class API_Manager {
  Future<Location?> getParkingLots() async {
    var client = http.Client();
    Location? locations;

    try {
      String url = 'https://countriesnow.space/api/v0.1/countries/positions';
      var response = await client.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        locations = Location.fromJson(jsonMap);
      }
    } catch (error) {
      print(error);
      throw Exception('Faield to get parking lot data');
    }

    await Future.delayed(Duration(seconds: 5));
    return locations;
  }
}
