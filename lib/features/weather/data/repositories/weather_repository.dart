import 'package:dartz/dartz.dart';
import 'package:weather/features/weather/data/models/weather_model.dart';

import '../../../../core/Exceptions/weather_exception.dart';
import '../../domain/repositories/i_weather_repository.dart';
import '../../infra/service/i_service.dart';

class WeatherRepository implements IWeatherRepository {
  final IService service;

  WeatherRepository({required this.service});
  @override
  Future<Either<Exception, WeatherModel>> getWeather(
      {required String city,
      required String stateCode,
      required String countryCode}) async {
    var response = await service.fetchWeather(
        city: city, stateCode: stateCode, countryCode: countryCode);
    if (response.statusCode == 200) {
      return right(WeatherModel.fromJson(response.body));
    } else {
      return left(WeatherException(message: 'Check your connection'));
    }
  }
}
