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

}


