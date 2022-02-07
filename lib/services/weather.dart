import 'package:weather/models/weather_model.dart';
import 'package:weather/services/location.dart';
import 'package:weather/utilities/constants.dart';
import 'networking.dart';

class Weather {
  Future<WeatherModel> getWeatherData(Location userLocation) async {
    NetworkHelper helper =
        NetworkHelper('http://api.openweathermap.org/data/2.5/weather?'
            'lat=${userLocation.lat}&'
            'lon=${userLocation.lon}&appid='
            '$kAPIKEY&units=metric');
    return helper.getWeatherData();
  }
}
