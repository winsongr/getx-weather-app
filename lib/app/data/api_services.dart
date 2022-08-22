import 'dart:convert';
import 'dart:developer';

import 'package:wweather/app/data/api_model.dart';
import 'package:wweather/app/modules/home/controllers/home_controller.dart';
import 'package:http/http.dart' as http;

class WeatherApiService {
  final city = HomeController().city!.value;

  Future<WeatherModel?> request(thiscity) async {
    var city = thiscity;
    final baseUrl =
        'https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=488f4111e6b7924073ff22cd896b2e2a';
    http.Response response = await http.get(Uri.parse(baseUrl));
    try {
      if (response.statusCode == 200) {
        // List<WeatherModel> _model =
        //     weatherModelFromJson(response.body) as List<WeatherModel>;

        String data = response.body;
        Map<String, dynamic> decodejson = jsonDecode(data);
      print('${response.statusCode}++++++++++');

        // var weatherdata = WeatherModel.fromJson(decodejson);
        // print(baseUrl);
        // print(_model);
        // return _model;

        // print(decodejson);
        // return weatherdata;
      }
    } catch (e) {
      print('++++++++++++${response.statusCode}++++++++++');

      log(e.toString());
    }
    return null;
  }
}
