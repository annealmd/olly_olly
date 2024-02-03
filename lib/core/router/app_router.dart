import 'package:flutter/material.dart';
import 'package:weather/features/login/presenter/mobile_ui/login_page.dart'
    as mobile_login;
import 'package:weather/features/login/presenter/web_ui/login_page.dart'
    as web_login;
import 'package:weather/splashpage.dart';

import '../../features/weather/presenter/mobile_ui/weather_page_mobile.dart'
    as mobile_weather;
import '../../features/weather/presenter/web_ui/weather_page_web.dart'
    as web_weather;

class AppRouter {
  static const String home = '/';

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => const Splashpage(),
        );
      case web_weather.WeatherPage.routeName:
        return MaterialPageRoute(
          builder: (_) => const web_weather.WeatherPage(),
        );
      case mobile_weather.WeatherPage.routeName:
        return MaterialPageRoute(
          builder: (_) => const mobile_weather.WeatherPage(),
        );
      case web_login.LoginPage.routeName:
        return MaterialPageRoute(
          builder: (_) => const web_login.LoginPage(),
        );
      case mobile_login.LoginPage.routeName:
        return MaterialPageRoute(
          builder: (_) => const mobile_login.LoginPage(),
        );

      default:
        throw Exception('Route not found!');
      // could be an error page as well
    }
  }
}
