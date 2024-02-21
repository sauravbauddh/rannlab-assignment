import 'package:flutter/material.dart';
import 'package:rannlab_assignment/common/routes/routes_name.dart';
import 'package:rannlab_assignment/features/weather/view/weather_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return _buildPageRoute(const WeatherScreen());
      default:
        return _buildPageRoute(
          const Scaffold(
            body: Center(
              child: Text("No route defined"),
            ),
          ),
        );
    }
  }

  static MaterialPageRoute<dynamic> _buildPageRoute(Widget page) {
    return MaterialPageRoute<dynamic>(builder: (ctx) => page);
  }
}
