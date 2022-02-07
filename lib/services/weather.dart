import 'package:weather/models/weather_model.dart';
import 'package:weather/utilities/constants.dart';
import 'networking.dart';

class Weather {
  // this method takes current location
  // make object of Network class and pass this location to class constructor
  // this call network method http.get and return with weather data
  Future getWeatherData(userLocation) async {
    NetworkHelper helper =
        NetworkHelper('http://api.openweathermap.org/data/2.5/weather?'
            'lat=${userLocation.lat}&'
            'lon=${userLocation.lon}&appid='
            '$kAPIKEY&units=metric');

    return helper.getWeatherData();
  }
}
