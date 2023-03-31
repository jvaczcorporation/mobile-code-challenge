import 'package:pokedex_snapfi/app/commons/commons.dart';
import 'package:pokedex_snapfi/app/modules/home/home.dart';

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
    } on Failure catch (e) {
      store.state = StoreState.error;
      store.exception = e;
      store.error = e.message;
    } catch (e) {
      store.state = StoreState.error;
      store.exception = e as Exception;
      store.error = e.toString();
    }
  }
}
