import 'package:geolocator/geolocator.dart';

class Location {
  double lat = 0.0;
  double lon = 0.0;

  Future<void> getLatLong() async {
    try {
      Position userCurrentPosition = await _determinePosition();
      // set location (lat & long) to location properties
      lon = userCurrentPosition.longitude;
      lat = userCurrentPosition.latitude;
      print('loaction is $lat -$lon');
    } catch (e) {
      print('get location error');
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }
}
