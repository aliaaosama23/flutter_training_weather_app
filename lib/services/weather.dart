// api.openweathermap.org/data/2.5/weather?lat=31.05566427672437&lon=31.37659237627977&appid=34e266285b3e8c0664869079716006fa

import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
