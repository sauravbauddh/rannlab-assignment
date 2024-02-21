import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rannlab_assignment/features/weather/controller/weather_controller.dart';

import 'common/routes/routes.dart';
import 'common/routes/routes_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => WeatherController(),
        )
      ],
      child: MaterialApp(
        title: 'Weather App Assignment',
        theme: ThemeData(
          useMaterial3: true,
        ),
        initialRoute: RoutesName.home,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
