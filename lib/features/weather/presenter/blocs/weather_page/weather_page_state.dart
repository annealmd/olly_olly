import 'package:weather/features/weather/data/models/weather_model.dart';

abstract class WeatherPageState {
  const WeatherPageState();
}

class InitWeatherState implements WeatherPageState {
  const InitWeatherState();
  @override
  String toString() => 'InitWeatherState';
}

class LoadingWeatherState implements WeatherPageState {
  const LoadingWeatherState();
  @override
  String toString() => 'LoadingWeatherState';
}

class SuccessWeatherState implements WeatherPageState {
  final WeatherModel weatherModel;

  const SuccessWeatherState({required this.weatherModel});
  @override
  String toString() => 'SuccessWeatherState';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SuccessWeatherState && other.weatherModel == weatherModel;
  }

  @override
  int get hashCode => weatherModel.hashCode;
}

class ErrorWeatherState implements WeatherPageState {
  final String message;
  const ErrorWeatherState({required this.message});
  @override
  String toString() => 'ErrorWeatherState';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ErrorWeatherState && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
