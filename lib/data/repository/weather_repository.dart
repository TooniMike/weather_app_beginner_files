import 'dart:convert';

import 'package:weather_app/data/data_provider/weather_data_provider.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherRepository {
  final WeatherDataProvider weatherDataProvider;

  WeatherRepository(this.weatherDataProvider);

    Future<WeatherModel> getCurrentWeather() async {
    try {
      String cityName = 'Canada';
      final weatherData = await WeatherDataProvider().getCurrentWeather(cityName);

      final data = jsonDecode(weatherData);

      if (data['cod'] != '200') {
        throw 'An unexpected error occurred';
      }

      return WeatherModel.fromJson(weatherData);
    } catch (e) {
      throw e.toString();
    }
  }

}