class WeatherModel {
  WeatherModel({
    // //  required this.coord,
    this.weather,
    // required this.base,
    this.main,
    // required this.visibility,
    // required this.wind,
    // required this.clouds,
    // required this.dt,
    //required this.sys,
    // required this.timezone,
    // required this.id,
    this.name,
    //required this.cod,
  });

  // Coord coord;
  List<Weather>? weather;
  // String base;
  Main? main;
  // int visibility;
  // Wind wind;
  // Clouds clouds;
  // int dt;
  //Sys sys;
  // int timezone;
  // int id;
  String? name;
  //int cod;

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        //coord: Coord.fromJson(json["coord"]),
        weather:
            List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        // base: json["base"],
        main: Main.fromJson(json["main"]),
        // visibility: json["visibility"],
        // wind: Wind.fromJson(json["wind"]),
        // clouds: Clouds.fromJson(json["clouds"]),
        // dt: json["dt"],
        // sys: Sys.fromJson(json["sys"]),
        // timezone: json["timezone"],
        // id: json["id"],
        name: json["name"],
        //cod: json["cod"],
      );
}

class Clouds {
  Clouds({
    required this.all,
  });

  int all;

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: json["all"],
      );
}

class Coord {
  Coord({
    required this.lon,
    required this.lat,
  });

  double lon;
  double lat;

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lon: json["lon"],
        lat: json["lat"],
      );
}

class Main {
  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
    this.seaLevel,
    this.grndLevel,
  });

  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;
  int? seaLevel;
  int? grndLevel;

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: json["temp"].toDouble(),
        feelsLike: json["feels_like"].toDouble(),
        tempMin: json["temp_min"].toDouble(),
        tempMax: json["temp_max"].toDouble(),
        pressure: json["pressure"],
        humidity: json["humidity"],
        seaLevel: json["sea_level"],
        grndLevel: json["grnd_level"],
      );
}

class Sys {
  Sys({
    required this.type,
    required this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  int type;
  int id;
  String country;
  int sunrise;
  int sunset;

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        type: json["type"],
        id: json["id"],
        country: json["country"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
      );
}

class Weather {
  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  int id;
  String main;
  String description;
  String icon;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"],
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
      );
}

class Wind {
  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  double speed;
  int deg;
  double gust;

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"].toDouble(),
        deg: json["deg"],
        gust: json["gust"].toDouble(),
      );
}
