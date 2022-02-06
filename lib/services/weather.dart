import 'package:weather/utilities/constants.dart';
import 'networking.dart';

class Weather {
  Future getWeatherData(userLocation) async {
    NetworkHelper helper =
        NetworkHelper('http://api.openweathermap.org/data/2.5/weather?'
            'lat=${userLocation.latitude}&'
            'lon=${userLocation.latitude}&appid='
            '$kAPIKEY&units=metric');
    return helper.getData();
  }
}
