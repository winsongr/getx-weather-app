import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wweather/app/data/city_names.dart';
import 'package:wweather/app/modules/home/controllers/home_controller.dart';
import 'package:wweather/app/modules/home/views/home_view.dart';

class MySearchDelegate extends SearchDelegate {
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
          }
        },
        icon: const Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget buildResults(BuildContext context) {
    // query;
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> city = cities.where((cities) {
      final result = cities.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();
    return ListView.builder(
      itemCount: city.length,
      itemBuilder: (BuildContext context, int index) {
        final suggestion = city[index];
        return ListTile(
          title: Text(suggestion),
          onTap: () async {
            query = suggestion;
            showResults(context);
            HomeController().getWeather(query);
            Get.to(() => HomeView(
                  city: query,
                ));
          },
        );
      },
    );
  }
}
