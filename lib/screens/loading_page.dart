import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/models/loaction.dart';
import 'package:weather/screens/location_page.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  double lat = 0.0;
  double long = 0.0;
  var location = Location();

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  getLocation() async {
    await location.getLatLong();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationPage(
          latitude: location.latitude,
          longitude: location.longitude,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black26,
      body: SpinKitCircle(
        size: 50,
        color: Colors.deepPurpleAccent,
      ),
    );
  }
}
