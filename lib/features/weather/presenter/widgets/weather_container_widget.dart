import 'package:flutter/material.dart';

import '../../data/models/element_model.dart';

class WeatherContainer extends StatelessWidget {
  const WeatherContainer({
    super.key,
    required this.element,
  });

  final ElementModel element;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25),
      color: const Color.fromARGB(238, 255, 255, 255),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image.network(
            'https://openweathermap.org/img/wn/${element.weather!.first.icon}@2x.png',
            width: 80.0,
            height: 80.0,
          ),
          Container(
            width: 3,
            height: 80,
            color: Colors.black.withOpacity(0.08),
          ),
          Column(
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '${element.main!.temp}',
                      style: const TextStyle(
                        fontSize: 55,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    TextSpan(
                      text: 'ºC',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '${element.weather!.first.description}',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
