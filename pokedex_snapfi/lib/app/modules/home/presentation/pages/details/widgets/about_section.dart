import 'package:flutter/material.dart';
import 'package:pokedex_snapfi/app/modules/home/home.dart';

class AboutSection extends StatelessWidget {
  final PokemonEntity pokemon;
  final Color color;

  const AboutSection({
    super.key,
    required this.pokemon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
          ),
          child: Text(
            "About",
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
        ),
        Row(
          children: [
            InfoItem(
              pokemon: pokemon,
              title: "Weight",
              values: [pokemon.weight.toString()],
              icon: Image.asset(
                "assets/weight.png",
                height: 16.0,
                width: 16.0,
              ),
            ),
            const CustomDivider(
              height: 48.0,
            ),
            InfoItem(
              pokemon: pokemon,
              title: "Height",
              values: [pokemon.height.toString()],
              icon: Image.asset(
                "assets/height.png",
                height: 16.0,
                width: 16.0,
              ),
            ),
            const CustomDivider(
              height: 48.0,
            ),
            InfoItem(
              pokemon: pokemon,
              title: "Moves",
              values: pokemon.abilities.map((e) => e.ability.name).toList(),
            ),
          ],
        ),
      ],
    );
  }
}
