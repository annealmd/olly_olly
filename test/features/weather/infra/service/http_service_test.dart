import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:weather/features/weather/infra/service/http_service.dart';

import '../../../../fixtures/fixture_reader.dart';

class ClientMock extends Mock implements http.Client {}

void main() {
  late HttpService sut;
  late ClientMock mockClient;

  setUp(() {
    mockClient = ClientMock();
    sut = HttpService(client: mockClient);
    registerFallbackValue(Uri.parse(''));
  });

  test('Should return statusCode 200', () async {
    when(() => mockClient.get(any())).thenAnswer((_) async => http.Response(
          fixture('weather.json'),
          200,
        ));
    var result = await sut.fetchWeather(
        city: 'test', stateCode: 'test', countryCode: 'test');
    expect(result.body, isA<String>());
    debugPrint(result.body);
    expect(result.statusCode, 200);
  });

  test('Should return statusCode 404', () async {
    when(() => mockClient.get(any())).thenAnswer((_) async => http.Response(
          'Not Found',
          404,
        ));
    var result = await sut.fetchWeather(
        city: 'test', stateCode: 'test', countryCode: 'test');

    expect(result.body, 'Not Found');
    expect(result.statusCode, 404);
  });
}
