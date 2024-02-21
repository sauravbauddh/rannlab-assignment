import 'package:rannlab_assignment/features/weather/model/weather_model.dart';

abstract class BaseApiService {
  Future<dynamic> geWeatherApiResponse(String url, WeatherModel? weatherModel);
}
