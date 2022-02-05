import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:weather/screens/location_page.dart';
import 'package:weather/services/location.dart';
import 'package:http/http.dart' as http;
import 'package:weather/utilities/constants.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location userLocation = Location();
    await userLocation.getLatLong();

    print('${userLocation.latitude}  - ${userLocation.longitude}');
    print('----------------AFTER GETTING LOCATION-----------------------');
    await getData(userLocation);
    print('------------------AFTER GETTING WEATHER---------------------');
  }

  getData(Location location) async {
    http.Response response = await http.get(
      Uri.parse(
          'http://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&'
          'lon=${location.latitude}&appid=34e266285b3e8c0664869079716006fa'),
    );
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);

      String cityName = decodedData['name'];
      double temp = decodedData['main']['temp'];
      int condition = decodedData['weather'][0]['id'];

      print('------------------AFTER decode data---------------------');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LocationPage(
            cityName: cityName,
            temperature: temp - 273.15,
          ),
        ),
      );
      print('city id$cityName - temp is $temp - condition is $condition');
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black26,
      body: SpinKitCircle(
        size: 70,
        color: Colors.deepPurpleAccent,
      ),
    );
  }
}
