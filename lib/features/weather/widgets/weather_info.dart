import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rannlab_assignment/constants/string_constants.dart';
import 'package:rannlab_assignment/features/weather/model/weather_model.dart';
import 'package:rannlab_assignment/theme/palette.dart';

class WeatherInfoWidget extends StatelessWidget {
  final Data weatherData;

  const WeatherInfoWidget({
    Key? key,
    required this.weatherData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<WeatherInfoItem> _weatherInfoList = [
      WeatherInfoItem(
          StringConstants.locationTitle,
          '${weatherData.cityName ?? StringConstants.notAvailable}, ${weatherData.countryCode ?? StringConstants.notAvailable}',
          Icons.location_on),
      WeatherInfoItem(
          StringConstants.temperatureTitle,
          '${weatherData.temp ?? StringConstants.notAvailable}°C',
          Icons.thermostat),
      WeatherInfoItem(
          StringConstants.descriptionTitle,
          weatherData.weather?.description ?? StringConstants.notAvailable,
          Icons.description),
      WeatherInfoItem(
          StringConstants.humidityTitle,
          '${weatherData.rh ?? StringConstants.notAvailable}%',
          Icons.water_drop),
      WeatherInfoItem(
          StringConstants.windTitle,
          '${weatherData.windSpd ?? StringConstants.notAvailable} KM/H',
          Icons.toys),
      WeatherInfoItem(
          StringConstants.visibilityTitle,
          '${weatherData.vis ?? StringConstants.notAvailable} KM',
          Icons.visibility),
    ];

    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Palette.cardColor,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => const SizedBox(height: 20),
          itemCount: _weatherInfoList.length,
          itemBuilder: (context, index) {
            final weatherInfo = _weatherInfoList[index];
            return _buildWeatherInfoItem(
              weatherInfo.title,
              weatherInfo.value,
              weatherInfo.icon,
            );
          },
        ),
      ),
    );
  }

  Widget _buildWeatherInfoItem(String title, String value, IconData icon) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 24,
          color: Palette.accentColor,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 18.0,
                  color: Palette.textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                value,
                style: GoogleFonts.poppins(
                  fontSize: 20.0,
                  color: Palette.textColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class WeatherInfoItem {
  final String title;
  final String value;
  final IconData icon;

  const WeatherInfoItem(this.title, this.value, this.icon);
}
