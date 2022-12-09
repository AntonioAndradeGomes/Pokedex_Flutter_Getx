class Evolution {
  final String num;
  final String name;

  Evolution({
    required this.num,
    required this.name,
  });

  factory Evolution.fromMap(Map<String, dynamic> map) => Evolution(
        num: map['num'],
        name: map['name'],
      );

  @override
  String toString() => 'Evolution(name: $name, num: $num)';
}
