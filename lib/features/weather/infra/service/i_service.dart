abstract class IService {
  Future<ApiResponse> fetchWeather(
      {required String city,
      required String stateCode,
      required String countryCode});
}

class ApiResponse {
  final dynamic body;
  final int statusCode;

  ApiResponse({required this.body, required this.statusCode});
}
