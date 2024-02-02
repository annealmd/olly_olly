import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather/core/Exceptions/weather_exception.dart';
import 'package:weather/features/weather/data/models/weather_model.dart';
import 'package:weather/features/weather/domain/repositories/i_weather_repository.dart';
import 'package:weather/features/weather/presenter/blocs/weather_page/weather_page_cubit.dart';
import 'package:weather/features/weather/presenter/blocs/weather_page/weather_page_state.dart';

import '../../../../../fixtures/weather_model.dart';

class MockRepo extends Mock implements IWeatherRepository {}

void main() {
  late MockRepo mockRepo;
  late WeatherPageCubit sut;
  late WeatherModel weatherModel;

  setUp(() {
    mockRepo = MockRepo();
    sut = WeatherPageCubit(repo: mockRepo);
    weatherModel = mockWeather;
  });
  tearDown(() {
     sut.close();
   });

  test('Should emit InitState', () {
    expect(sut.state, isA<InitWeatherState>());
  });
  
  blocTest<WeatherPageCubit, WeatherPageState>(
    'Should emit states [Loading, Success]',
    build: () {
      when(() => mockRepo.getWeather(
              city: any(named: 'city'),
              stateCode: any(named: 'stateCode'),
              countryCode: any(named: 'countryCode')))
          .thenAnswer((_) async => Right(weatherModel));
      return sut;
    },
    act: (sut) async => await sut.getWeather(
        city: 'city', stateCode: 'stateCode', countryCode: 'countryCode'),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      const LoadingWeatherState(),
      SuccessWeatherState(weatherModel: weatherModel)
    ],
    verify: (_) {
      verify(() => mockRepo.getWeather(
          city: any(named: 'city'),
          stateCode: any(named: 'stateCode'),
          countryCode: any(named: 'countryCode'))).called(1);
    },
    
  );

  blocTest<WeatherPageCubit, WeatherPageState>(
    'Should emit states [Loading, Error]',
    build: () {
      when(() => mockRepo.getWeather(
              city: any(named: 'city'),
              stateCode: any(named: 'stateCode'),
              countryCode: any(named: 'countryCode')))
          .thenAnswer(
              (_) async => Left(WeatherException(message: 'Server Error')));
      return sut;
    },
    act: (sut) async => await sut.getWeather(
        city: 'city', stateCode: 'stateCode', countryCode: 'countryCode'),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      const LoadingWeatherState(),
      const ErrorWeatherState(message: 'Server Error')
    ],
    verify: (_) {
      verify(() => mockRepo.getWeather(
          city: any(named: 'city'),
          stateCode: any(named: 'stateCode'),
          countryCode: any(named: 'countryCode'))).called(1);
    },
    
  );
}
