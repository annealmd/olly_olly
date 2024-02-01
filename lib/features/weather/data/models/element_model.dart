import 'dart:convert';

class ElementModel {
  final int? dt;
  final Main? main;
  final List<Weather>? weather;
  final Clouds? clouds;
  final Wind? wind;
  final int? visibility;
  final double? pop;
  final DateTime? dtTxt;

  ElementModel({
    this.dt,
    this.main,
    this.weather,
    this.clouds,
    this.wind,
    this.visibility,
    this.pop,
    this.dtTxt,
  });

  @override
  String toString() {
    return 'ElementModel(dt: $dt, main: $main, weather: $weather, clouds: $clouds, wind: $wind, visibility: $visibility, pop: $pop,  dtTxt: $dtTxt)';
  }

  factory ElementModel.fromMap(Map<String, dynamic> map) {
    return ElementModel(
      dt: map['dt']?.toInt(),
      main: map['main'] != null ? Main.fromMap(map['main']) : null,
      weather: map['weather'] != null
          ? List<Weather>.from(map['weather']?.map((x) => Weather.fromMap(x)))
          : null,
      clouds: map['clouds'] != null ? Clouds.fromMap(map['clouds']) : null,
      wind: map['wind'] != null ? Wind.fromMap(map['wind']) : null,
      visibility: map['visibility']?.toInt(),
      pop: map['pop']?.toDouble(),
      dtTxt: map['dtTxt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['dtTxt'])
          : null,
    );
  }

  factory ElementModel.fromJson(String source) =>
      ElementModel.fromMap(json.decode(source));
}

class Clouds {
  final int? all;

  Clouds({
    this.all,
  });

  factory Clouds.fromMap(Map<String, dynamic> map) {
    return Clouds(
      all: map['all']?.toInt(),
    );
  }

  factory Clouds.fromJson(String source) => Clouds.fromMap(json.decode(source));

  @override
  String toString() => 'Clouds(all: $all)';
}

class Main {
  final double? temp;
  final double? feelsLike;
  final double? tempMin;
  final double? tempMax;
  final int? humidity;
  final double? tempKf;

  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.humidity,
    this.tempKf,
  });

  factory Main.fromMap(Map<String, dynamic> map) {
    return Main(
      temp: map['temp']?.toDouble(),
      feelsLike: map['feelsLike']?.toDouble(),
      tempMin: map['tempMin']?.toDouble(),
      tempMax: map['tempMax']?.toDouble(),
      humidity: map['humidity']?.toInt(),
      tempKf: map['tempKf']?.toDouble(),
    );
  }

  factory Main.fromJson(String source) => Main.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Main(temp: $temp, feelsLike: $feelsLike, tempMin: $tempMin, tempMax: $tempMax, humidity: $humidity, tempKf: $tempKf)';
  }
}

class Sys {
  final String? pod;

  Sys({
    this.pod,
  });
}

class Weather {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      id: map['id']?.toInt(),
      main: map['main'],
      description: map['description'],
      icon: map['icon'],
    );
  }

  factory Weather.fromJson(String source) =>
      Weather.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Weather(id: $id, main: $main, description: $description, icon: $icon)';
  }
}

class Wind {
  final double? speed;
  final int? deg;
  final double? gust;

  Wind({
    this.speed,
    this.deg,
    this.gust,
  });

  @override
  String toString() => 'Wind(speed: $speed, deg: $deg, gust: $gust)';

  factory Wind.fromMap(Map<String, dynamic> map) {
    return Wind(
      speed: map['speed']?.toDouble(),
      deg: map['deg']?.toInt(),
      gust: map['gust']?.toDouble(),
    );
  }

  factory Wind.fromJson(String source) => Wind.fromMap(json.decode(source));
}
