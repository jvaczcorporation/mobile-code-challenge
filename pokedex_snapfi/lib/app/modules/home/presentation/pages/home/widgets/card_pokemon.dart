import 'package:flutter/material.dart';
import 'package:pokedex_snapfi/app/commons/commons.dart';
import 'package:pokedex_snapfi/app/modules/home/home.dart';

class CardPokemon extends StatelessWidget {
  final PokemonEntity pokemon;
  final GestureTapCallback? onTap;

  const CardPokemon({
    super.key,
    required this.pokemon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: AppTheme.boxShadowContainer,
                borderRadius: BorderRadius.circular(
                  8.0,
                ),
              ),
              child: Column(
                children: [
                  const Expanded(
                    child: SizedBox.shrink(),
                  ),
                  Container(
                    height: 44,
                    decoration: const BoxDecoration(
                      color: Color(0xFFEFEFEF),
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(8.0),
                        right: Radius.circular(8.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned.fill(
              child: pokemon.isLoading
                  ? LoaderItem(
                      highlightColor: Colors.grey.withOpacity(0.5),
                      baseColor: Colors.white,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: AppTheme.boxShadowContainer,
                          borderRadius: BorderRadius.circular(
                            8.0,
                          ),
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 4.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              const Expanded(
                                child: SizedBox.shrink(),
                              ),
                              Text(
                                '#${pokemon.id.toString().padLeft(3, '0')}',
                                style: const TextStyle(
                                  fontSize: 8.0,
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Image.network(
                              pokemon.urlImage,
                            ),
                          ),
                          Text(
                            pokemon.name.capitalize(),
                          ),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
