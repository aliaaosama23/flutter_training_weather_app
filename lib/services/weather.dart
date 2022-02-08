import 'package:weather/models/weather_model.dart';
import 'package:weather/services/location.dart';
import 'package:weather/utilities/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const baseUrl = 'http://api.openweathermap.org/data/2.5/weather';

class WeatherService {
  // Service 1: call aoi to get weather by location
  Future<WeatherModel> getDataByLocation() async {
    Location userLocation = Location();
    await userLocation.getLatLong();

    http.Response response =
        await http.get(Uri.parse('$baseUrl?lat=${userLocation.lat}'
            '&lon=${userLocation.lon}'
            '&appid=$kAPIKEY&units=metric'));

    if (response.statusCode == 200) {
      print('all data ${jsonDecode(response.body)}');
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<WeatherModel> getDataByCityName(String cityName) async {
    http.Response response = await http
        .get(Uri.parse('$baseUrl?q=$cityName&appid=$kAPIKEY&units=metric'));

    if (response.statusCode == 200) {
      print('all data ${jsonDecode(response.body)}');
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }
}
