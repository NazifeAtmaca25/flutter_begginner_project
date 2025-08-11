import 'package:weather_app/models/Forecast.dart';
import 'package:weather_app/models/weather.dart';

Map<String, Weather> dummyWeaterData = {
  "İstanbul": Weather(
      city: "İstanbul",
      temperature: 28,
      condition: "güneşli",
      date: "Pazartesi, 4 Ağustos",
      forecast: [
        Forecast(day: "Salı            ", condition: "güneşli", minTemp: 18, maxTemp: 29),
        Forecast(
            day: "Çarşamba ", condition: "bulutlu", minTemp: 19, maxTemp: 26),
        Forecast(
            day: "Perşembe ", condition: "rüzgarlı", minTemp: 17, maxTemp: 22),
        Forecast(day: "Cuma        ", condition: "güneşli", minTemp: 20, maxTemp: 29),
        Forecast(
            day: "Cumartesi", condition: "güneşli", minTemp: 20, maxTemp: 29),
        Forecast(day: "Pazar        ", condition: "bulutlu", minTemp: 19, maxTemp: 27),
      ]),
  "Ankara": Weather(
      city: "Ankara",
      temperature: 25,
      condition: "güneşli",
      date: "Pazartesi, 4 Ağustos",
      forecast: [
        Forecast(day: "Salı            ", condition: "yağmurlu", minTemp: 15, maxTemp: 27),
        Forecast(
            day: "Çarşamba ", condition: "rüzgarlı", minTemp: 16, maxTemp: 24),
        Forecast(
            day: "Perşembe ", condition: "yağmurlu", minTemp: 14, maxTemp: 20),
        Forecast(day: "Cuma        ", condition: "güneşli", minTemp: 17, maxTemp: 26),
        Forecast(
            day: "Cumartesi", condition: "güneşli", minTemp: 16, maxTemp: 28),
        Forecast(day: "Pazar        ", condition: "bulutlu", minTemp: 18, maxTemp: 25),
      ]),
  "İzmir": Weather(
      city: "İzmir",
      temperature: 24,
      condition: "bulutlu",
      date: "Pazartesi, 4 Ağustos",
      forecast: [
        Forecast(day: "Salı            ", condition: "güneşli", minTemp: 21, maxTemp: 31),
        Forecast(
            day: "Çarşamba ", condition: "bulutlu", minTemp: 22, maxTemp: 28),
        Forecast(
            day: "Perşembe ", condition: "rüzgarlı", minTemp: 20, maxTemp: 25),
        Forecast(day: "Cuma        ", condition: "bulutlu", minTemp: 23, maxTemp: 30),
        Forecast(
            day: "Cumartesi", condition: "güneşli", minTemp: 23, maxTemp: 31),
        Forecast(day: "Pazar        ", condition: "rüzgarlı", minTemp: 21, maxTemp: 28),
      ]),
  "Antalya": Weather(
      city: "Antalya",
      temperature: 33,
      condition: "güneşli",
      date: "Pazartesi, 4 Ağustos",
      forecast: [
        Forecast(day: "Salı            ", condition: "güneşli", minTemp: 24, maxTemp: 34),
        Forecast(
            day: "Çarşamba ", condition: "bulutlu", minTemp: 25, maxTemp: 30),
        Forecast(
            day: "Perşembe ", condition: "rüzgarlı", minTemp: 23, maxTemp: 28),
        Forecast(day: "Cuma        ", condition: "güneşli", minTemp: 26, maxTemp: 32),
        Forecast(
            day: "Cumartesi", condition: "güneşli", minTemp: 27, maxTemp: 33),
        Forecast(day: "Pazar        ", condition: "bulutlu", minTemp: 26, maxTemp: 31),
      ]),
  "Denizli": Weather(
      city: "Denizli",
      temperature: 32,
      condition: "güneşli",
      date: "Pazartesi, 4 Ağustos",
      forecast: [
        Forecast(day: "Salı            ", condition: "güneşli", minTemp: 23, maxTemp: 33),
        Forecast(
            day: "Çarşamba ", condition: "bulutlu", minTemp: 24, maxTemp: 30),
        Forecast(
            day: "Perşembe ", condition: "yağmurlu", minTemp: 22, maxTemp: 27),
        Forecast(day: "Cuma        ", condition: "güneşli", minTemp: 25, maxTemp: 31),
        Forecast(
            day: "Cumartesi", condition: "güneşli", minTemp: 26, maxTemp: 32),
        Forecast(day: "Pazar        ", condition: "yağmurlu", minTemp: 24, maxTemp: 29),
      ]),
  "Bursa": Weather(
      city: "Bursa",
      temperature: 26,
      condition: "rüzgarlı",
      date: "Pazartesi, 4 Ağustos",
      forecast: [
        Forecast(day: "Salı            ", condition: "güneşli", minTemp: 17, maxTemp: 28),
        Forecast(
            day: "Çarşamba ", condition: "bulutlu", minTemp: 18, maxTemp: 25),
        Forecast(
            day: "Perşembe ", condition: "rüzgarlı", minTemp: 16, maxTemp: 21),
        Forecast(day: "Cuma        ", condition: "güneşli", minTemp: 19, maxTemp: 27),
        Forecast(
            day: "Cumartesi", condition: "güneşli", minTemp: 20, maxTemp: 29),
        Forecast(day: "Pazar        ", condition: "bulutlu", minTemp: 18, maxTemp: 26),
      ]),
  "Trabzon": Weather(
      city: "Trabzon",
      temperature: 21,
      condition: "yağmurlu",
      date: "Pazartesi, 4 Ağustos",
      forecast: [
        Forecast(day: "Salı            ", condition: "yağmurlu", minTemp: 16, maxTemp: 22),
        Forecast(
            day: "Çarşamba ", condition: "bulutlu", minTemp: 17, maxTemp: 20),
        Forecast(
            day: "Perşembe ", condition: "rüzgarlı", minTemp: 15, maxTemp: 18),
        Forecast(day: "Cuma        ", condition: "güneşli", minTemp: 18, maxTemp: 24),
        Forecast(
            day: "Cumartesi", condition: "güneşli", minTemp: 19, maxTemp: 25),
        Forecast(day: "Pazar        ", condition: "yağmurlu", minTemp: 17, maxTemp: 23),
      ]),
  "Konya": Weather(
      city: "Konya",
      temperature: 24,
      condition: "güneşli",
      date: "Pazartesi, 4 Ağustos",
      forecast: [
        Forecast(day: "Salı            ", condition: "güneşli", minTemp: 14, maxTemp: 26),
        Forecast(
            day: "Çarşamba ", condition: "bulutlu", minTemp: 25, maxTemp: 23),
        Forecast(
            day: "Perşembe ", condition: "yağmurlu", minTemp: 13, maxTemp: 19),
        Forecast(day: "Cuma        ", condition: "güneşli", minTemp: 15, maxTemp: 25),
        Forecast(
            day: "Cumartesi", condition: "güneşli", minTemp: 15, maxTemp: 27),
        Forecast(day: "Pazar        ", condition: "rüzgarlı", minTemp: 17, maxTemp: 24),
      ]),
  "Erzurum": Weather(
      city: "Erzurum",
      temperature: 18,
      condition: "bulutlu",
      date: "Pazartesi, 4 Ağustos",
      forecast: [
        Forecast(day: "Salı            ", condition: "yağmurlu", minTemp: 9, maxTemp: 19),
        Forecast(
            day: "Çarşamba ", condition: "bulutlu", minTemp: 10, maxTemp: 16),
        Forecast(
            day: "Perşembe ", condition: "rüzgarlı", minTemp: 8, maxTemp: 14),
        Forecast(day: "Cuma        ", condition: "güneşli", minTemp: 11, maxTemp: 19),
        Forecast(
            day: "Cumartesi", condition: "güneşli", minTemp: 12, maxTemp: 20),
        Forecast(day: "Pazar        ", condition: "yağmurlu", minTemp: 10, maxTemp: 17),
      ])
};
