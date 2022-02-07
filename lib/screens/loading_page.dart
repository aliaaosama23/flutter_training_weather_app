import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/screens/location_page.dart';
import 'package:weather/services/location.dart';
import 'package:weather/services/weather.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    getWeatherData();
  }

  void getWeatherData() async {
    // create class for location(lat & long)
    // make object from this class
    Location userLocation = Location();

    // call get location from geolocation package
    // then set lat and long from returned data to location object
    await userLocation.getLatLong();

    // create weather class for weather data dependent on current location
    Weather weather = Weather();
    // get weather depend on location object and return with weather data
    // set this data to weatherData variable
    var weatherData = await weather.getWeatherData(userLocation);
    print('returned waegter model data $weatherData');
    // forward these data to the location page to be displayed
    navigateToWeatherPage(weatherData);
  }

  navigateToWeatherPage(weatherData) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationPage(
          weatherData: weatherData,
        ),
      ),
    );
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
