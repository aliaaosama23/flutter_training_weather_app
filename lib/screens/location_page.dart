import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather/screens/city_page.dart';

// Celsius \u2103
// Fahrenheit \u2109
class LocationPage extends StatefulWidget {
  const LocationPage({
    Key? key,
    required this.weatherData,
    // required this.cityName,
    // required this.temperature,
  }) : super(key: key);

  final Map<dynamic, dynamic> weatherData;

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  late double temp = 0;
  late String cityName = '';
  @override
  void initState() {
    super.initState();
    updateUI(widget.weatherData);
  }

  updateUI(weatherData) {
    setState(() {
      if (weatherData == null) {
        temp = 0;
        cityName = '';
        return;
      } else {
        temp = weatherData['main']['temp'];
        cityName = widget.weatherData['name'];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.8),
              BlendMode.dstATop,
            ),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.near_me,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CityPage(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.location_city,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      temp.toStringAsFixed(1),
                      // temperature.toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 80,
                        color: Colors.white,
                        letterSpacing: 0.9,
                      ),
                    ),
                    const Text(
                      '\u00B0',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                    ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const LinearGradient(
                          colors: [
                            Colors.white,
                            Colors.lightBlue,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.0, 1.0],
                        ).createShader(bounds);
                      },
                      child: const FaIcon(
                        FontAwesomeIcons.cloud,
                        size: 80,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Bring your jacket in case in $cityName',
                  style: const TextStyle(
                    fontSize: 55,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// String cityName = decodedData['name'];
// double temp = decodedData['main']['temp'];
// int condition = decodedData['weather'][0]['id'];
