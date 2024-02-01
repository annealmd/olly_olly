import 'dart:convert';

class CityModel {
  final int id;
  final String name;
  final Coords coord;
  final String country;
  final int population;
  final int timezone;
  final int sunrise;
  final int sunset;

  CityModel({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });

  factory CityModel.fromMap(Map<String, dynamic> map) {
    return CityModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      coord: Coords.fromMap(map['coord']),
      country: map['country'] ?? '',
      population: map['population']?.toInt() ?? 0,
      timezone: map['timezone']?.toInt() ?? 0,
      sunrise: map['sunrise']?.toInt() ?? 0,
      sunset: map['sunset']?.toInt() ?? 0,
    );
  }

  factory CityModel.fromJson(String source) =>
      CityModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CityModel(id: $id, name: $name, coord: $coord, country: $country, population: $population, timezone: $timezone, sunrise: $sunrise, sunset: $sunset,)';
  }
}

class Coords {
  final double lat;
  final double lon;

  Coords({
    required this.lat,
    required this.lon,
  });

  factory Coords.fromMap(Map<String, dynamic> map) {
    return Coords(
      lat: map['lat']?.toDouble() ?? 0.0,
      lon: map['lon']?.toDouble() ?? 0.0,
    );
  }

  factory Coords.fromJson(String source) => Coords.fromMap(json.decode(source));

  @override
  String toString() => 'Coords(lat: $lat, lon: $lon)';
}
