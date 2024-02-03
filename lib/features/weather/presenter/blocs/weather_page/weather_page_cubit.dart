import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../../../core/Exceptions/weather_exception.dart';
import '../../../domain/repositories/i_weather_repository.dart';

import 'weather_page_state.dart';

class WeatherPageCubit extends Cubit<WeatherPageState> {
  final IWeatherRepository repo;
  WeatherPageCubit({required this.repo}) : super(const InitWeatherState());

  Future<void> getWeather(
      {required String city,
      required String stateCode,
      required String countryCode}) async {

        emit(const LoadingWeatherState());
    
      var response = await repo.getWeather(
          city: city, stateCode: stateCode, countryCode: countryCode);      
      response.fold(
        (left) {
          debugPrint("exception: $left");
          var error = left as WeatherException;
          emit(ErrorWeatherState(message: error.message));
        },
        (right) {
          debugPrint("weatherModel: $right");
          var weatherModel = right;
          emit(SuccessWeatherState(weatherModel: weatherModel));
        },
      );
  }

}
