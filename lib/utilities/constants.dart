import 'package:flutter/material.dart';

const kAPIKEY = '34e266285b3e8c0664869079716006fa';
const kBaseURL = 'api.openweathermap.org/data/2.5/weather';

const kInputDecorationStyle = InputDecoration(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
  hintText: 'Enter city name',
  fillColor: Colors.white,
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  filled: true,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
    size: 30,
  ),
);
