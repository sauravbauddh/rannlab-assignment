import 'package:rannlab_assignment/core/data/network/base_api_service.dart';
import 'package:rannlab_assignment/core/data/network/network_api_service.dart';
import 'package:rannlab_assignment/core/url_endpoints.dart';
import 'package:rannlab_assignment/features/weather/model/weather_model.dart';

class WeatherRepository {
  BaseApiService baseApiService = NetworkApiService();

  Future<dynamic> weatherApi(WeatherModel data) async {
    try {
      dynamic response =
          baseApiService.geWeatherApiResponse(UrlEndpoints.baseUrl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
