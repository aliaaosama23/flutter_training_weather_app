import 'package:flutter/material.dart';
import 'package:weather/screens/loading_page.dart';

void main() {
  runApp(const MyApp());
}

// bundle id: com.flutter.weather.app
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const LoadingPage(),
    );
  }
}
