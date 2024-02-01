
abstract class IWeatherRemoteData {
  Future<void> getWeather(
      {required String city,
      required String stateCode,
      required String countryCode});
}

