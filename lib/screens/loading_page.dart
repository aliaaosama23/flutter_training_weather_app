import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/screens/location_page.dart';
import 'package:weather/services/location.dart';
import 'package:weather/utilities/constants.dart';
import './../services/weather.dart';

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
    await getLocationData(userLocation);
  }

  getLocationData(Location location) async {
    NetworkHelper helper = NetworkHelper(
        'http://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&'
        'lon=${location.latitude}&appid=$kAPIKEY&units=metric');

    var weatherData = await helper.getData();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationPage(weatherData: weatherData),
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
