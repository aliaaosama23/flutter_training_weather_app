class Location {
  late double _latitude;
  late double _longitude;

  //Location({this._latitude, this._longitude});

  // ignore: unnecessary_getters_setters
  double get longitude => _longitude;

  // ignore: unnecessary_getters_setters
  set longitude(double value) {
    _longitude = value;
  }

  // ignore: unnecessary_getters_setters
  double get latitude => _latitude;

  // ignore: unnecessary_getters_setters
  set latitude(double value) {
    _latitude = value;
  }
}
