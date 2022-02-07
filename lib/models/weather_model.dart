import '../services/location.dart';

class WeatherModel {
  final Location? coord;
  final List<WeatherInfo>? weather;
  final String? base;
  final MainInfo? main;
  final int? visibility;
  final WindInfo? wind;
  final CloudsInfo? clouds;
  final int? dt;
  final SystemInfo? sys;
  final int? timezone;
  final int? id;
  final String? name;
  final int? cod;

  WeatherModel({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });
// factory constructor that creates an WeatherModel from JSON.
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      coord: json['coord'],
      weather: json['weather'],
      base: json['base'],
      main: json['main'],
      visibility: json['visibility'],
      wind: json['wind'],
      clouds: json['clouds'],
      dt: json['dt'],
      sys: json['sys'],
      timezone: json['timezone'],
      id: json['id'],
      name: json['name'],
      cod: json['cod'],
    );
  }
}

class WeatherInfo {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  WeatherInfo({
    this.id,
    this.main,
    this.description,
    this.icon,
  });
}

class MainInfo {
  final double? temp;
  final double? feels_like;
  final double? temp_min;
  final double? temp_max;
  final int? pressure;
  final int? humidity;
  final int? sea_level;
  final int? grnd_level;

  MainInfo({
    this.temp,
    this.feels_like,
    this.temp_min,
    this.temp_max,
    this.pressure,
    this.humidity,
    this.sea_level,
    this.grnd_level,
  });
}

class WindInfo {
  final double? speed;
  final int? deg;
  final double? gust;

  WindInfo({
    this.speed,
    this.deg,
    this.gust,
  });
}

class CloudsInfo {
  final int? all;
  CloudsInfo({this.all});
}

class SystemInfo {
  final int? type;
  final int? id;
  final String? country;
  final int? sunrise;
  final int? sunset;
  SystemInfo({
    this.type,
    this.id,
    this.country,
    this.sunrise,
    this.sunset,
  });
}
