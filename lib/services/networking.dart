import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weather/models/weather_model.dart';

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);

  Future<WeatherModel> getWeatherData() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
