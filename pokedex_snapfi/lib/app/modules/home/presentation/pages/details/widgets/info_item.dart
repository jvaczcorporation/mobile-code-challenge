import 'package:flutter/material.dart';
import 'package:pokedex_snapfi/app/modules/home/domain/entities/pokemon_entity.dart';
import 'package:pokedex_snapfi/app/commons/helpers/string_helper.dart';

class InfoItem extends StatelessWidget {
  final PokemonEntity pokemon;
  final String title;
  final List<String> values;
  final Widget? icon;

  const InfoItem({
    super.key,
    required this.pokemon,
    required this.title,
    required this.values,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 48.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (icon != null) icon!,
                  const SizedBox(
                    width: 8.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ...values.map(
                        (String value) => Text(
                          value.capitalize(),
                          style: const TextStyle(
                            fontSize: 10.0,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 8.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
