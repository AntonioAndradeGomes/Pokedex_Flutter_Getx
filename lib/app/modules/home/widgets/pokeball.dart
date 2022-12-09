import 'package:flutter/material.dart';

class Pokeball extends StatelessWidget {
  const Pokeball({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -50,
      right: -50,
      child: Image.asset(
        'assets/images/pokeball.png',
        width: 200,
      ),
    );
  }
}
