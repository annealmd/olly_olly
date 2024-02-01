import 'dart:convert';

class ElementModel {
  final int dt;
  final Main main;
  final List<Weather> weather;
  final Clouds clouds;
  final Wind wind;
  final int visibility;
  final double pop;
  final Rain rain;
  final Sys sys;
  final DateTime dtTxt;

  ElementModel({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    required this.rain,
    required this.sys,
    required this.dtTxt,
  });

  @override
  String toString() {
    return 'ElementModel(dt: $dt, main: $main, weather: $weather, clouds: $clouds, wind: $wind, visibility: $visibility, pop: $pop, rain: $rain, sys: $sys, dtTxt: $dtTxt)';
  }

  factory ElementModel.fromMap(Map<String, dynamic> map) {
    return ElementModel(
      dt: map['dt']?.toInt() ?? 0,
      main: Main.fromMap(map['main']),
      weather:
          List<Weather>.from(map['weather']?.map((x) => Weather.fromMap(x))),
      clouds: Clouds.fromMap(map['clouds']),
      wind: Wind.fromMap(map['wind']),
      visibility: map['visibility']?.toInt() ?? 0,
      pop: map['pop']?.toDouble() ?? 0.0,
      rain: Rain.fromMap(map['rain']),
      sys: Sys.fromMap(map['sys']),
      dtTxt: DateTime.fromMillisecondsSinceEpoch(map['dtTxt']),
    );
  }

  factory ElementModel.fromJson(String source) =>
      ElementModel.fromMap(json.decode(source));
}

class Clouds {
  final int all;

  Clouds({
    required this.all,
  });

  @override
  String toString() => 'Clouds(all: $all)';

  factory Clouds.fromMap(Map<String, dynamic> map) {
    return Clouds(
      all: map['all']?.toInt() ?? 0,
    );
  }

  factory Clouds.fromJson(String source) => Clouds.fromMap(json.decode(source));
}

class Main {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int seaLevel;
  final int grndLevel;
  final int humidity;
  final double tempKf;

  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.seaLevel,
    required this.grndLevel,
    required this.humidity,
    required this.tempKf,
  });

  @override
  String toString() {
    return 'Main(temp: $temp, feelsLike: $feelsLike, tempMin: $tempMin, tempMax: $tempMax, pressure: $pressure, seaLevel: $seaLevel, grndLevel: $grndLevel, humidity: $humidity, tempKf: $tempKf)';
  }

  factory Main.fromMap(Map<String, dynamic> map) {
    return Main(
      temp: map['temp']?.toDouble() ?? 0.0,
      feelsLike: map['feelsLike']?.toDouble() ?? 0.0,
      tempMin: map['tempMin']?.toDouble() ?? 0.0,
      tempMax: map['tempMax']?.toDouble() ?? 0.0,
      pressure: map['pressure']?.toInt() ?? 0,
      seaLevel: map['seaLevel']?.toInt() ?? 0,
      grndLevel: map['grndLevel']?.toInt() ?? 0,
      humidity: map['humidity']?.toInt() ?? 0,
      tempKf: map['tempKf']?.toDouble() ?? 0.0,
    );
  }

  factory Main.fromJson(String source) => Main.fromMap(json.decode(source));
}

class Rain {
  final double the3H;

  Rain({
    required this.the3H,
  });

  @override
  String toString() => 'Rain(the3H: $the3H)';

  factory Rain.fromMap(Map<String, dynamic> map) {
    return Rain(
      the3H: map['the3H']?.toDouble() ?? 0.0,
    );
  }

  factory Rain.fromJson(String source) => Rain.fromMap(json.decode(source));
}

class Sys {
  final String pod;

  Sys({
    required this.pod,
  });

  @override
  String toString() => 'Sys(pod: $pod)';

  factory Sys.fromMap(Map<String, dynamic> map) {
    return Sys(
      pod: map['pod'] ?? '',
    );
  }

  factory Sys.fromJson(String source) => Sys.fromMap(json.decode(source));
}

class Weather {
  final int id;
  final String main;
  final String description;
  final String icon;

  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  @override
  String toString() {
    return 'Weather(id: $id, main: $main, description: $description, icon: $icon)';
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      id: map['id']?.toInt() ?? 0,
      main: map['main'] ?? '',
      description: map['description'] ?? '',
      icon: map['icon'] ?? '',
    );
  }

  factory Weather.fromJson(String source) =>
      Weather.fromMap(json.decode(source));
}

class Wind {
  final double speed;
  final int deg;
  final double gust;

  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  @override
  String toString() => 'Wind(speed: $speed, deg: $deg, gust: $gust)';

  factory Wind.fromMap(Map<String, dynamic> map) {
    return Wind(
      speed: map['speed']?.toDouble() ?? 0.0,
      deg: map['deg']?.toInt() ?? 0,
      gust: map['gust']?.toDouble() ?? 0.0,
    );
  }

  factory Wind.fromJson(String source) => Wind.fromMap(json.decode(source));
}
