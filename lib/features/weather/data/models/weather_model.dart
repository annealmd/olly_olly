import 'dart:convert';

import 'city_model.dart';
import 'element_model.dart';

class WeatherModel {
  final String? cod;
  final int? message;
  final int? cnt;
  final List<ElementModel>? list;
  final CityModel? city;

  WeatherModel({
    this.cod,
    this.message,
    this.cnt,
    this.list,
    this.city,
  });

  
  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    return WeatherModel(
      cod: map['cod'],
      message: map['message']?.toInt(),
      cnt: map['cnt']?.toInt(),
      list: map['list'] != null ? List<ElementModel>.from(map['list']?.map((x) => ElementModel.fromMap(x))) : null,
      city: map['city'] != null ? CityModel.fromMap(map['city']) : null,
    );
  }


  factory WeatherModel.fromJson(String source) => WeatherModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'WeatherModel(cod: $cod, message: $message, cnt: $cnt, list: $list, city: $city)';
  }
}
