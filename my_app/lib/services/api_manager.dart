import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:my_app/models/parking.dart';

class API_Manager {
  Future<List<Parking>> getParkingLots() async {
    var client = http.Client();

    try {
      String url = 'http://10.0.2.2:5004/api/Parking';
      var response = await client.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        await Future.delayed(Duration(seconds: 5));
        return parkingFromJson(jsonString);
      } else {
        throw Exception('Test to get parking lot data');
      }
    } catch (error) {
      print(error);
      throw Exception('Failed to request parking lot data');
    }
  }
}
