import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wweather/app/data/api_model.dart';
import 'package:wweather/app/data/api_services.dart';

class HomeController extends GetxController {
  RxString? city = 'coimbatore'.obs;
  RxString? condition;
  RxInt? temp = 15.obs;
  RxInt? feelsLike;
  RxInt? pressure;
  RxInt? visibility;
  RxString? humidity;
  RxInt? windSpeed;
  RxString? country;
  RxString? name;
  RxString? icon;

  Future updateCity(newCity) async {
    city?.value = newCity;
    update();
  }

  Future updateTemp(newTemp) async {
    temp?.value = newTemp;
  }

  @override
  void onInit() {
    getWeather(city);
    super.onInit();
  }

  getWeather(city) async {
    final weather = await WeatherApiService().request(city);
    // // print(weather);
    // final weatherfromapi = weatherModelFromJson(weather);
    // print(weatherfromapi);
  }
}
