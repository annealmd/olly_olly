import 'dart:convert';

import 'city_model.dart';
import 'element_model.dart';

class WeatherModel {
    final String cod;
    final int message;
    final int cnt;
    final List<ElementModel> list;
    final CityModel city;

    WeatherModel({
        required this.cod,
        required this.message,
        required this.cnt,
        required this.list,
        required this.city,
    });

  @override
  String toString() {
    return 'WeatherModel(cod: $cod, message: $message, cnt: $cnt, list: $list, city: $city,)';
  }

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    return WeatherModel(
      cod: map['cod'] ?? '',
      message: map['message']?.toInt() ?? 0,
      cnt: map['cnt']?.toInt() ?? 0,
      list: List<ElementModel>.from(map['list']?.map((x) => ElementModel.fromMap(x))),
      city: CityModel.fromMap(map['city']),
    );
  }

  factory WeatherModel.fromJson(String source) => WeatherModel.fromMap(json.decode(source));
}


