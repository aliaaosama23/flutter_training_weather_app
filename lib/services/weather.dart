import 'package:weather/models/weather_model.dart';
import 'package:weather/services/location.dart';
import 'package:weather/utilities/constants.dart';
import 'networking.dart';

const baseUrl = 'http://api.openweathermap.org/data/2.5/weather';

class WeatherService {
  Future<WeatherModel> getDataByLocation() async {
    // get current user location
    Location userLocation = Location();
    await userLocation.getLatLong();

    // get weather data dependent on current location
    //var weatherData = await getDataByLocation(userLocation);
    NetworkHelper helper = NetworkHelper('$baseUrl?lat=${userLocation.lat}'
        '&lon=${userLocation.lon}'
        '&appid=$kAPIKEY&units=metric');
    return helper.getWeatherData();
  }

  Future<WeatherModel> getDataByCityName(String cityName) async {
    NetworkHelper helper =
        NetworkHelper('$baseUrl?q=$cityName&appid=$kAPIKEY&units=metric');

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
