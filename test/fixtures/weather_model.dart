import 'package:weather/features/weather/data/models/city_model.dart';
import 'package:weather/features/weather/data/models/element_model.dart';
import 'package:weather/features/weather/data/models/weather_model.dart';

final WeatherModel mockWeather = WeatherModel(
  cod: '200',
  message: 0,
  cnt: 40,
  list: [
    ElementModel(
        dt: 1706821200,
        main: Main(
            temp: 27.5,
            feelsLike: 30.0,
            tempMin: 23.4,
            tempMax: 28.0,
            humidity: 69,
            tempKf: null),
        weather: [Weather(id: 500, description: 'light rain', icon: '10d')],
        clouds: Clouds(all: 96),
        wind: Wind(speed: 1.89, deg: 182, gust: 2.22),
        visibility: 10000,
        pop: 0.77,
        dtTxt: DateTime(2023, 2, 3)),
  ],
  city: CityModel(
    id: 3456814,
    name: 'Montes Claros',
    coord: Coord(lat: -16.735, lon: -43.8617),
    country: 'BR',
    population: 332379,
    timezone: -10800,
    sunrise: 1706777031,
    sunset: 1706823236,
  ),
);
