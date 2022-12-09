import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class EvolutionPokemon extends StatelessWidget {
  final String imageUrl;
  final void Function() onTap;

  const EvolutionPokemon({
    super.key,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.contain,
        width: 100,
        placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
