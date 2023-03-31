import 'package:pokedex_snapfi/app/modules/home/presentation/stores/pokemons_store.dart';

class DetailsController {
  final PokemonsStore store;

  DetailsController({
    required this.store,
  });

  nextPokemon() {
    if (store.indexSelected + 1 < store.data!.length) store.indexSelected++;
  }

  previousPokemon() {
    if (store.indexSelected > 0) store.indexSelected--;
  }
}
