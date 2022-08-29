import 'package:get/get.dart';

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
}
