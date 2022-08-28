import 'dart:convert';
import 'dart:developer';

import 'package:wweather/app/data/api_model.dart';
import 'package:wweather/app/modules/home/controllers/home_controller.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class WeatherApiService {
  final city = HomeController().city!.value;
  var client = http.Client;

  Future request(thiscity) async {
    var city = thiscity;
    final baseUrl =
        'https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=488f4111e6b7924073ff22cd896b2e2a';
    try {
      final response = await http.get(Uri.parse(baseUrl));
      print(response.statusCode);
      var data = weatherModelFromJson(response.body);
      // Map<String, dynamic> data = convert.jsonDecode(response.body);
      print(data);

      print('sucess\n');
      return data;
    } catch (e) {
      print('++++++++++++++++++++++');
      print(e);
    }
    return null;
  }
}
