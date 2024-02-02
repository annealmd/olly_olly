import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather/core/Exceptions/weather_exception.dart';
import 'package:weather/features/weather/data/models/weather_model.dart';
import 'package:weather/features/weather/infra/repositories/weather_repository.dart';
import 'package:weather/features/weather/infra/service/i_service.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockService extends Mock implements IService {}

void main() {
  late MockService mockService;
  late WeatherRepository sut;

  setUpAll(() {
    mockService = MockService();
    sut = WeatherRepository(service: mockService);
    // registerFallbackValue(Uri.parse(''));
  });

  test('Should Right with a WeatherModel', () async {
    when(() => mockService.fetchWeather(
            city: any(named: 'city'),
            stateCode: any(named: 'stateCode'),
            countryCode: any(named: 'countryCode')))
        .thenAnswer((_) async =>
            ApiResponse(body: fixture('weather.json'), statusCode: 200));
    var result = await sut.getWeather(
        city: 'test', stateCode: 'test', countryCode: 'test');
    expect(result, isA<Right>());
    result.fold(
      (left) => fail('Expected Right, but got Left: $left'),
      (weatherModel) {
        expect(weatherModel, isA<WeatherModel>());
      },
    );
  });

  test('Should return Left with WeatherException on error', () async {
    when(() => mockService.fetchWeather(
            city: any(named: 'city'),
            stateCode: any(named: 'stateCode'),
            countryCode: any(named: 'countryCode')))
        .thenAnswer((_) async => ApiResponse(body: '', statusCode: 404));

    var result = await sut.getWeather(
        city: 'test', stateCode: 'test', countryCode: 'test');

    expect(result, isA<Left>());

    result.fold(
      (weatherException) {
        expect(weatherException, isA<WeatherException>());
        var result = weatherException as WeatherException;
        expect(result.message, 'Check your connection');
      },
      (right) => fail('Expected Left, but got Right: $right'),
    );
  });
}
