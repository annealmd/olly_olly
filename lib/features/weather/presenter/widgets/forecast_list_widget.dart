import 'package:flutter/material.dart';

import '../../data/models/weather_model.dart';
import 'forecast_details_widget.dart';

class ForecastList extends StatelessWidget {
  const ForecastList({
    super.key,
    required this.weather,
  });

  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: weather.list!.length - 1,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 1),
          child: ForecastDetail(element: weather.list![index + 1]),
        );
      },
    );
  }
}
