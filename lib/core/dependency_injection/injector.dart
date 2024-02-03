import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import '../../features/weather/data/repositories/weather_repository.dart';
import '../../features/weather/domain/repositories/i_weather_repository.dart';
import '../../features/weather/infra/service/http_service.dart';
import '../../features/weather/infra/service/i_service.dart';
import '../../features/weather/presenter/blocs/weather_page/weather_page_cubit.dart';

import '../../features/login/presenter/blocs/internet/internet_cubit.dart';
import 'dependency_injector.dart';

class Injects {
  static void init() {
    var di = DependencyInjector();
    //Service
    di.register<IService>(() => HttpService(client: http.Client()));

    //Repository
    di.register<IWeatherRepository>(
        () => WeatherRepository(service: di<IService>()));

    //WeatherBLoC
    di.register(() => WeatherPageCubit(repo: di<IWeatherRepository>()));

    //Internet
    di.register(() => Connectivity());
    di.register(() => InternetCubit(connectivity: di<Connectivity>()));
  }
}
