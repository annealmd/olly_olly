import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather/features/weather/data/datasource/i_weather_remote_data.dart';

class WeatherRemoteData implements IWeatherRemoteData {
  static const String token = 'f78d313be146a77c1aea37530add84f9';
  final http.Client client;

  WeatherRemoteData({required this.client});

  @override
  Future<void> getWeather(
      {required String city,
      required String stateCode,
      required String countryCode}) async {
    final String url =
        'https://api.openweathermap.org/data/2.5/forecast?q=$city,$stateCode,br&appid=$token&units=metric';
    final response = await client.get(Uri.http(url));

    if (response.statusCode == 200) {
      //final apiResponse = json.decode(response.body);
      debugPrint(response.body);
      //return WeatherModel.fromJson(json.decode(response.body));
    } else {
      debugPrint('error -> ${response.statusCode}');
      //throw ServerException();
    }
  }
}
