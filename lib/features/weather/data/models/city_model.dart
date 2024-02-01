import 'dart:convert';

class CityModel {
  final int? id;
  final String? name;
  final Coord? coord;
  final String? country;
  final int? population;
  final int? timezone;
  final int? sunrise;
  final int? sunset;

  CityModel({
    this.id,
    this.name,
    this.coord,
    this.country,
    this.population,
    this.timezone,
    this.sunrise,
    this.sunset,
  });

  @override
  String toString() {
    return 'CityModel(id: $id, name: $name, coord: $coord, country: $country, population: $population, timezone: $timezone, sunrise: $sunrise, sunset: $sunset)';
  }

  factory CityModel.fromMap(Map<String, dynamic> map) {
    return CityModel(
      id: map['id']?.toInt(),
      name: map['name'],
      coord: map['coord'] != null ? Coord.fromMap(map['coord']) : null,
      country: map['country'],
      population: map['population']?.toInt(),
      timezone: map['timezone']?.toInt(),
      sunrise: map['sunrise']?.toInt(),
      sunset: map['sunset']?.toInt(),
    );
  }

  factory CityModel.fromJson(String source) =>
      CityModel.fromMap(json.decode(source));
}

class Coord {
  final double? lat;
  final double? lon;

  Coord({
    this.lat,
    this.lon,
  });

  @override
  String toString() => 'Coord(lat: $lat, lon: $lon)';

  Map<String, dynamic> toMap() {
    return {
      'lat': lat,
      'lon': lon,
    };
  }

  factory Coord.fromMap(Map<String, dynamic> map) {
    return Coord(
      lat: map['lat']?.toDouble(),
      lon: map['lon']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Coord.fromJson(String source) => Coord.fromMap(json.decode(source));
}
