import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_snapfi/app/commons/helpers/string_helper.dart';
import 'package:pokedex_snapfi/app/modules/home/domain/entities/pokemon_entity.dart';

class HeaderDetails extends StatelessWidget {
  final PokemonEntity pokemon;

  const HeaderDetails({
    super.key,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Image.asset(
            "assets/pokeball.png",
            height: 208,
            color: Colors.white.withOpacity(0.2),
          ),
        ),
        Positioned(
          top: 0,
          child: SizedBox(
            width: MediaQuery.of(context).size.width - 8,
            child: Row(
              children: [
                IconButton(
                  onPressed: Modular.to.pop,
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                Text(
                  pokemon.name.capitalize(),
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const Expanded(
                  child: SizedBox.shrink(),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 20,
                  ),
                  child: Text(
                    '#${pokemon.id.toString().padLeft(3, '0')}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
