import 'package:weather/models/weather_model.dart';
import 'package:weather/services/location.dart';
import 'package:weather/utilities/constants.dart';
import 'networking.dart';

const BaseUrl = 'http://api.openweathermap.org/data/2.5/weather';

class WeatherService {
  getWeatherData() async {
    Location userLocation = Location();
    await userLocation.getLatLong();

    var weatherData = await getData(userLocation);
    return weatherData;
  }

  Future<WeatherModel> getData(Location userLocation) async {
    NetworkHelper helper = NetworkHelper('$BaseUrl?lat=${userLocation.lat}'
        '&lon=${userLocation.lon}'
        '&appid=$kAPIKEY&units=metric');
    return helper.getWeatherData();
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
