class WeatherException implements Exception {
  final String message;

  WeatherException({required this.message});

  @override
  String toString() => 'WeatherException(message: $message)';
}
