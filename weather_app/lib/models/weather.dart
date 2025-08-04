import 'package:weather_app/models/Forecast.dart';

class Weather {
  final String city;
  final int temperature;
  final String condition;
  final String date;
  final List<Forecast> forecast;

  Weather(
      {required this.city,
      required this.temperature,
      required this.condition,
      required this.date,
      required this.forecast});
}
