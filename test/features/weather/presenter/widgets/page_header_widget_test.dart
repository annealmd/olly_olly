import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather/features/weather/presenter/widgets/page_header_widget.dart';

void main() {
  testWidgets('DateTitle displays formatted date and fontSize null', (WidgetTester tester) async {
    DateTime testDate = DateTime(2023, 2, 3);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DateTitle(date: testDate),
        ),
      ),
    );

    expect(find.text('February 03, 2023'), findsOneWidget);
    Text textWidget = tester.widget<Text>(find.text('February 03, 2023'));

    expect(textWidget.style?.fontSize, equals(null));
  });

  testWidgets('CityName displays city name with correct style',
      (WidgetTester tester) async {
    String cityName = 'test City';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CityName(name: cityName),
        ),
      ),
    );

    expect(find.text(cityName), findsOneWidget);
    Text textWidget = tester.widget<Text>(find.text(cityName));

    expect(textWidget.style?.fontSize, equals(35));
  });
}
