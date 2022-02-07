import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/screens/city_page.dart';
import 'package:weather/services/weather.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key, required this.weatherData}) : super(key: key);

  final WeatherModel weatherData;

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  late double temp = 0;
  late String cityName = '';
  late String icon = '';
  @override
  void initState() {
    super.initState();
    updateUI(widget.weatherData);
  }

  updateUI(WeatherModel weatherData) {
    setState(() {
      if (weatherData == null) {
        temp = 0;
        cityName = '';
        return;
      } else {
        temp = weatherData.main.temp;
        cityName = weatherData.name;
        icon = WeatherService().getWeatherIcon(weatherData.weather[0].id);
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
                      onPressed: () async {
                        // get current waether depend on current loaction
                        WeatherService weather = WeatherService();
                        var weatherData = await weather.getWeatherData();
                        updateUI(weatherData);
                      },
                      icon: const Icon(
                        Icons.near_me,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        final city = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CityPage(),
                          ),
                        );
                        print('backed city is $city');
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
                      style: const TextStyle(
                        fontSize: 80,
                        color: Colors.white,
                        letterSpacing: 0.9,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      '\u1d52',
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      icon,
                      style: const TextStyle(
                        fontSize: 70,
                      ),
                    )
                    // ShaderMask(
                    //   shaderCallback: (Rect bounds) {
                    //     return const LinearGradient(
                    //       colors: [
                    //         Colors.white,
                    //         Colors.lightBlue,
                    //       ],
                    //       begin: Alignment.topLeft,
                    //       end: Alignment.bottomRight,
                    //       stops: [0.0, 1.0],
                    //     ).createShader(bounds);
                    //   },
                    //   child: const FaIcon(
                    //     FontAwesomeIcons.cloud,
                    //     size: 80,
                    //   ),
                    // ),
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
