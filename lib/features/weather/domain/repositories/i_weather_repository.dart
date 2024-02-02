import 'package:dartz/dartz.dart';

import '../../data/models/weather_model.dart';

abstract class IWeatherRepository {
  Future<Either<Exception,WeatherModel>> getWeather(
      {required String city,
      required String stateCode,
      required String countryCode});
}
