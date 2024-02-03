import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/weather_page/weather_page_cubit.dart';
import '../blocs/weather_page/weather_page_state.dart';

import '../../../../core/dependency_injection/dependency_injector.dart';

import '../../data/models/weather_model.dart';
import '../widgets/forecast_list_widget.dart';
import '../widgets/page_header_widget.dart';
import '../widgets/weather_container_widget.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});
  static const routeName = '/mobile_page';

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final weatherCubit = DependencyInjector().get<WeatherPageCubit>();

  late WeatherModel weather;
  @override
  void initState() {
    weatherCubit.getWeather(
        city: 'Montes Claros', stateCode: 'MG', countryCode: 'BR');
    debugPrint(weatherCubit.state.toString());

    super.initState();
  }

  @override
  void dispose() {
    weatherCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        color: Theme.of(context).colorScheme.primaryContainer,
        padding:
            const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
        child: BlocBuilder<WeatherPageCubit, WeatherPageState>(
          bloc: weatherCubit,
          builder: (context, state) {
            if (state is LoadingWeatherState) {
              return const CircularProgressIndicator();
            } else if (state is SuccessWeatherState) {
              var weather = state.weatherModel;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CityName(name: weather.city!.name!),
                  DateTitle(date: weather.list![0].dtTxt!),
                  const SizedBox(height: 30),
                  WeatherContainer(element: weather.list![0]),
                  const SizedBox(height: 30),
                  const Text(
                    'Check the Forecast!',
                    style: TextStyle(fontSize: 25),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ForecastList(weather: weather),
                  ),
                ],
              );
            } else if (state is ErrorWeatherState) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(221, 151, 1, 1),
                  ),
                ),
              );
            }
            return const Text('done');
          },
        ),
      ),
    );
  }
}
