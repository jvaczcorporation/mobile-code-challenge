import 'package:flutter/material.dart';
import 'package:pokedex_snapfi/app/commons/helpers/string_helper.dart';
import 'package:pokedex_snapfi/app/modules/home/domain/entities/pokemon_entity.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

class TypesSection extends StatelessWidget {
  final PokemonEntity pokemon;

  const TypesSection({
    super.key,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...pokemon.types.mapIndexed(
          (index, type) => Padding(
            padding: EdgeInsets.only(
              left: index != pokemon.types.length ? 24.0 : 0.0,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 2.0,
                horizontal: 8.0,
              ),
              decoration: BoxDecoration(
                color: type.type.name.color,
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
              ),
              child: Text(
                type.type.name.name.capitalize(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
