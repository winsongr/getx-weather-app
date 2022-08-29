import 'package:wweather/app/data/api_model.dart';
import 'package:wweather/app/modules/home/controllers/home_controller.dart';
import 'package:http/http.dart' as http;

class WeatherApiService {
  final city = HomeController().city!.value;
  var client = http.Client;

  Future<WeatherDataModel?> request(thiscity) async {
    var city = thiscity;
    final baseUrl =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=488f4111e6b7924073ff22cd896b2e2a&units=metric';
    var response = await http.get(Uri.parse(baseUrl));
    WeatherDataModel? weatherModel;
    if (response.statusCode == 200) {
      weatherModel = weatherDataModelFromJson(response.body);
      return weatherModel;
    } else {
      print('error**********************');
    }
    return null;
  }
}
