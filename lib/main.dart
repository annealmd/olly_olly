import 'package:flutter/material.dart';
import 'package:weather/core/theme/app_theme.dart';
import 'package:weather/features/weather/presenter/mobile_ui/weather_page_mobile.dart'
    as mobile;
import 'package:weather/features/weather/presenter/web_ui/weather_page_web.dart'
    as web;

import 'core/dependency_injection/injector.dart';

void main() {
  Injects.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
        darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
        // onGenerateRoute: AppRouter.onGenerateRoute,
        home: MediaQuery.of(context).size.width > 600
            ? const web.WeatherPage()
            : const mobile.WeatherPage());
  }
}
