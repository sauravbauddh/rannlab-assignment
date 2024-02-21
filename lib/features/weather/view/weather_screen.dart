import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rannlab_assignment/constants/string_constants.dart';
import 'package:rannlab_assignment/features/weather/controller/weather_controller.dart';
import 'package:rannlab_assignment/features/weather/model/weather_model.dart';
import 'package:rannlab_assignment/features/weather/widgets/weather_info.dart';
import 'package:rannlab_assignment/theme/palette.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController _locationController = TextEditingController();

  @override
  void dispose() {
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final weatherController = Provider.of<WeatherController>(context);
    final weatherData = weatherController.weatherData;
    final errorMessage = weatherController.errorMessage;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.backgroundColor,
        title: Text(
          StringConstants.weatherAppTitle,
          style: GoogleFonts.poppins(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Palette.textColor,
          ),
        ),
      ),
      backgroundColor: Palette.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Palette.searchBarColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _locationController,
                          style: GoogleFonts.poppins(
                            fontSize: 16.0,
                            color: Palette.textColor,
                          ),
                          decoration: InputDecoration(
                            hintText: StringConstants.locationHintText,
                            hintStyle: GoogleFonts.poppins(
                              fontSize: 16.0,
                              color: Palette.secondaryTextColor,
                            ),
                            border: InputBorder.none,
                            prefixIcon: const Icon(
                              Icons.location_city,
                              color: Palette.primaryColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      IconButton(
                        onPressed: () {
                          String text = _locationController.text;
                          WeatherModel request = WeatherModel();
                          if (text.isNotEmpty &&
                              text[0]
                                  .toUpperCase()
                                  .startsWith(RegExp(r'[0-9]'))) {
                            request.postalCode = text;
                          } else {
                            request.cityName = text;
                          }
                          weatherController.fetchWeather(request, context);
                          FocusScope.of(context).unfocus(); // Hide keyboard
                        },
                        icon: const Icon(
                          Icons.search,
                          color: Palette.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              if (errorMessage.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    errorMessage,
                    style: GoogleFonts.poppins(
                      fontSize: 16.0,
                      color: Colors.red,
                    ),
                  ),
                ),
              if (weatherData.cityName != null)
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: WeatherInfoWidget(
                    weatherData: weatherData,
                  ),
                ),
              if (weatherController.isLoading)
                const Center(child: CircularProgressIndicator()),
            ],
          ),
        ),
      ),
    );
  }
}
