import 'package:flutter/material.dart';
import '../../data/models/element_model.dart';

import 'page_header_widget.dart';

class ForecastDetail extends StatelessWidget {
  const ForecastDetail({
    super.key,
    required this.element,
  });

  final ElementModel element;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            color: const Color.fromARGB(236, 235, 250, 251),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  'https://openweathermap.org/img/wn/${element.weather!.first.icon}@2x.png',
                  width: 60.0,
                  height: 60.0,
                ),
                Container(
                  width: 3,
                  height: 50,
                  color: Colors.black.withOpacity(0.08),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    DateTitle(date: element.dtTxt!),
                    Text(
                      '${element.dtTxt!.hour}:${element.dtTxt!.minute}0 H',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '${element.weather!.first.description}',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),

                  Row(
                    children: [
                      const Text(
                        'Humidity: ',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '${element.main!.humidity} %',
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  //),
                ],
              ),
              CircleAvatar(
                radius: 50.0, // Adjust the size as needed
                backgroundColor: const Color.fromARGB(255, 249, 251, 215),
                child: Text(
                  '${element.main!.temp}º',
                  style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
