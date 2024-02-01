import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather/features/weather/data/models/weather_model.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  late String weatherJson;
  late WeatherModel sut;
  setUpAll(() {
    weatherJson = fixture('weather.json');
  });
  test('when receiving a json should return a model', () {
    sut = WeatherModel.fromJson(weatherJson);
    debugPrint(sut.toString());
    expect(sut.city!.name, 'Montes Claros');
  });
}
