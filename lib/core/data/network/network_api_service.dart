import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:rannlab_assignment/features/weather/model/weather_model.dart';

import '../app_exceptions.dart';
import 'base_api_service.dart';

class NetworkApiService extends BaseApiService {
  static const String apiKey = "a546a4eb585d415a8835b93903bfb96a";
  @override
  Future<dynamic> geWeatherApiResponse(
      String url, WeatherModel? weatherModel) async {
    try {
      if (weatherModel != null) {
        final Map<String, dynamic> params = {
          'key': apiKey,
        };

        if (weatherModel.cityName != null) {
          params['city'] = weatherModel.cityName!;
        }

        if (weatherModel.postalCode != null) {
          params['postal_code'] = weatherModel.postalCode!;
        }

        if (weatherModel.country != null) {
          params['country'] = weatherModel.country!;
        }

        final uri = Uri.parse(url).replace(queryParameters: params);
        print(uri);
        final response =
            await http.get(uri).timeout(const Duration(seconds: 10));
        return handleResponse(response);
      } else {
        final response =
            await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
        return handleResponse(response);
      }
    } on SocketException {
      throw FetchDataException("No internet connection");
    }
  }

  dynamic handleResponse(http.Response response) {
    final responseBody = jsonDecode(response.body);
    switch (response.statusCode) {
      case 200:
        return responseBody;
      case 400:
        throw BadRequestException(responseBody['error'] ?? "Bad request");
      default:
        throw FetchDataException(
          "Error occurred with status code ${response.statusCode}: ${responseBody['message'] ?? ''}",
        );
    }
  }
}
