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
    print('calling init');
    super.initState();
    getWeatherData();
  }

  void getWeatherData() async {
    Location userLocation = Location();
    await userLocation.getLatLong();

    Weather weather = Weather();
    var weatherData = await weather.getWeatherData(userLocation);
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
