import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTitle extends StatelessWidget {
  const DateTitle({
    super.key,
    required this.date,
  });

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormated = DateFormat('MMMM dd, yyyy');
    return Text(dateFormated.format(date));
  }
}

class CityName extends StatelessWidget {
  const CityName({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: const TextStyle(fontSize: 35),
    );
  }
}
