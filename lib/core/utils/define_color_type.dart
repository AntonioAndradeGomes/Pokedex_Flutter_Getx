import 'package:flutter/material.dart';

Color defineColorType(String type) {
  switch (type) {
    case 'Grass':
      return Colors.greenAccent;
    case 'Fire':
      return Colors.redAccent;
    case 'Water':
      return Colors.lightBlue;
    case 'Poison':
      return Colors.deepPurpleAccent;
    case 'Electric':
      return Colors.amber;
    case 'Rock':
      return Colors.brown.shade500;
    case 'Ground':
      return Colors.brown;
    case 'Psychic':
      return Colors.indigo;
    case 'Fighting':
      return Colors.orange;
    case 'Bug':
      return Colors.lightGreenAccent;
    case 'Ghost':
      return Colors.deepPurple;
    case 'Normal':
      return Colors.grey.shade400;
    default:
      return Colors.pink;
  }
}
