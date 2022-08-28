import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:wweather/app/data/assets.dart';

import '../controllers/home_controller.dart';
import 'searchDelegate.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({this.city, Key? key}) : super(key: key);
  final String? city;

  @override
  Widget build(BuildContext context) {
    if (city != null) {
      controller.updateCity(city);
    }
    controller.updateTemp(22);

    // print(controller.country!.value);
    return
        //  Obx(() =>
        SafeArea(
            child: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.snow),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.location_on_outlined),
                  Text(controller.city!.value.toUpperCase()),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        showSearch(
                          context: context,
                          delegate: MySearchDelegate(),
                        );
                      },
                      icon: const Icon(Icons.search))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${controller.temp!.value}\u2103",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const RotatedBox(
                    quarterTurns: -1,
                    child: Text("Winter"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      // ),
    ));
  }
}
