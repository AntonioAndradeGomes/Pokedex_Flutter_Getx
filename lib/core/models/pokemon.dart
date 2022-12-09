import 'package:pokedex_getx_flutter/core/models/evolution.dart';
import 'package:flutter/material.dart';

class Pokemon {
  final int id;
  final String num;
  final String name;
  final String img;
  final List<String> types;
  final String? height;
  final String? weight;
  final String? candy;
  final int? candyCount;
  final String? egg;
  final double spawnChance;
  final double? avgSpawns;
  final String? spawnTime;
  final List<double>? multipliers;
  final List<String>? weaknesses;
  final List<Evolution>? nextEvolution;
  final List<Evolution>? prevEvolution;

  Pokemon({
    required this.id,
    required this.num,
    required this.name,
    required this.img,
    required this.types,
    required this.height,
    required this.weight,
    required this.candy,
    required this.candyCount,
    required this.egg,
    required this.spawnChance,
    required this.avgSpawns,
    required this.spawnTime,
    this.multipliers,
    this.weaknesses,
    this.nextEvolution,
    this.prevEvolution,
  });

  String get image =>
      'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$num.png';

  factory Pokemon.fromMap(Map<String, dynamic> map) => Pokemon(
        id: map['id'],
        num: map['num'],
        name: map['name'],
        img: map['img'],
        types: List<String>.from(map['type']),
        height: map['height'],
        weight: map['weight'],
        candy: map['candy'],
        candyCount: map['candy_count'],
        egg: map['egg'],
        spawnChance: (map['spawn_chance']).toDouble(),
        avgSpawns: (map['avg_spawns'])?.toDouble(),
        spawnTime: map['spawn_time'] as String?,
        multipliers: map['multipliers'] == null
            ? null
            : List<double>.from(map['multipliers']),
        weaknesses: map['weaknesses'] == null
            ? null
            : List<String>.from(map['weaknesses']),
        nextEvolution: map['next_evolution'] == null
            ? null
            : List<Map<String, dynamic>>.from(map['next_evolution'])
                .map((e) => Evolution.fromMap(e))
                .toList(),
        prevEvolution: map['prev_evolution'] == null
            ? null
            : List<Map<String, dynamic>>.from(map['prev_evolution'])
                .map((e) => Evolution.fromMap(e))
                .toList(),
      );

  @override
  String toString() =>
      'Pokemon(name: $name, id: $id, num: $num, types: $types, weight: $weight, height: $height)';

  Color get baseColor => color(type: types[0]) ?? Colors.pink;

  static Color? color({required String type}) {
    switch (type) {
      case 'Normal':
        return Colors.brown[400];
      case 'Fire':
        return Colors.red;
      case 'Water':
        return Colors.blue;
      case 'Grass':
        return Colors.green;
      case 'Electric':
        return Colors.amber;
      case 'Ice':
        return Colors.cyanAccent[400];
      case 'Fighting':
        return Colors.orange;
      case 'Poison':
        return Colors.purple;
      case 'Ground':
        return Colors.orange[300];
      case 'Flying':
        return Colors.indigo[200];
      case 'Psychic':
        return Colors.pink;
      case 'Bug':
        return Colors.lightGreen[500];
      case 'Rock':
        return Colors.grey;
      case 'Ghost':
        return Colors.indigo[400];
      case 'Dark':
        return Colors.brown;
      case 'Dragon':
        return Colors.indigo[800];
      case 'Steel':
        return Colors.blueGrey;
      case 'Fairy':
        return Colors.pinkAccent[100];
      default:
        return Colors.grey;
    }
  }
}
