import 'package:http/http.dart' as http;

import 'i_service.dart';

class HttpService implements IService {
  static const String token = 'f78d313be146a77c1aea37530add84f9';
  static const String baseUrl = 'https://api.openweathermap.org';
  final http.Client client;

  HttpService({required this.client});
  @override
  Future<ApiResponse> fetchWeather(
      {required String city,
      required String stateCode,
      required String countryCode}) async {
    final url =
        '$baseUrl/data/2.5/forecast?q=$city,$stateCode,br&appid=$token&units=metric';
    final response = await client.get(Uri.parse(url));
    return ApiResponse(body: response.body, statusCode: response.statusCode);
  }
}
