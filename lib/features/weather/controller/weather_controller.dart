import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rannlab_assignment/features/weather/model/weather_model.dart';

import '../repository/weather_repository.dart';

class WeatherController with ChangeNotifier {
  Data _weatherData = Data();
  String _errorMessage = '';
  bool _isLoading = false;

  Data get weatherData => _weatherData;
  String get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;

  final WeatherRepository _weatherRepo = WeatherRepository();

  Future<void> fetchWeather(WeatherModel request, BuildContext context) async {
    try {
      _isLoading = true;
      _errorMessage = '';
      notifyListeners();

      final value = await _weatherApi(request);
      _weatherData = Data.fromJson(value['data'][0]);
    } catch (error) {
      _errorMessage = error.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<dynamic> _weatherApi(WeatherModel data) async {
    try {
      final result = await _weatherRepo.weatherApi(data);
      if (kDebugMode) {
        print(result.toString());
      }
      return result;
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
      rethrow;
    }
  }
}
