import 'package:flutter/material.dart';

class TypePokemon extends StatelessWidget {
  final String type;
  final double? horizontalMargin;
  final Color? color;
  const TypePokemon({
    super.key,
    required this.type,
    this.horizontalMargin,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 2,
        horizontal: horizontalMargin ?? 0,
      ),
      width: 60,
      padding: const EdgeInsets.symmetric(
        //horizontal: 10,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color ??
            Colors.black.withOpacity(
              0.2,
            ),
      ),
      child: Center(
        child: Text(
          type,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            shadows: [
              BoxShadow(
                color: Colors.blueGrey,
                offset: Offset(0, 0),
                spreadRadius: 1.0,
                blurRadius: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
