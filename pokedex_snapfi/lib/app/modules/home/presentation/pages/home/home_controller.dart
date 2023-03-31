import 'package:pokedex_snapfi/app/commons/domain/enums/store_state.dart';
import 'package:pokedex_snapfi/app/modules/home/domain/use_cases/get_pokemons_use_case.dart';
import 'package:pokedex_snapfi/app/modules/home/presentation/stores/pokemons_store.dart';

class HomeController {
  final PokemonsStore store;
  final GetPokemonsUseCase getPokemonsUseCase;

  HomeController({
    required this.store,
    required this.getPokemonsUseCase,
  });

  fetchPokemons() async {
    store.state = StoreState.loading;

    try {
      store.data = await getPokemonsUseCase();
      store.state = StoreState.completed;
    } on Exception catch (e) {
      store.exception = e;
      store.error = e.toString();
      store.state = StoreState.error;
    }
  }

  nextPokemon() {
    if (store.indexSelected + 1 < store.data!.length) store.indexSelected++;
  }

  previousPokemon() {
    if (store.indexSelected > 0) store.indexSelected--;
  }
}
