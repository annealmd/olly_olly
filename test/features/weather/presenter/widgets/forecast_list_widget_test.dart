
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather/features/weather/data/models/weather_model.dart';
import 'package:weather/features/weather/presenter/widgets/forecast_details_widget.dart';
import 'package:weather/features/weather/presenter/widgets/forecast_list_widget.dart';

import '../../../../fixtures/weather_model.dart';

void main() {
  testWidgets('ForecastList displays ForecastDetail widgets', (WidgetTester tester) async {
    // from test/fixtures
    WeatherModel weather = mockWeather;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ForecastList(weather: weather),
        ),
      ),
    );

    // the right number
    expect(find.byType(ForecastDetail), findsNWidgets(weather.list!.length - 1));
  });
}