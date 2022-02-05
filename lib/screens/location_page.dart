import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather/models/loaction.dart';

// Celsius \u2103
// Fahrenheit \u2109
class LocationPage extends StatelessWidget {
  const LocationPage({
    Key? key,
    required this.latitude,
    required this.longitude,
  }) : super(key: key);

  final double latitude;
  final double longitude;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.8),
              BlendMode.dstATop,
            ),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        print('get current location');
                      },
                      icon: const Icon(
                        Icons.near_me,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        print('choose city to get its location');
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
                    const Text(
                      '12',
                      style: TextStyle(
                        fontSize: 80,
                        color: Colors.white,
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
                const Text(
                  'Bring your jacket in case in Mountain View',
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
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
