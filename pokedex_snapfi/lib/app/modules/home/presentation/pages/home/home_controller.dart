import 'package:pokedex_snapfi/app/commons/commons.dart';
import 'package:pokedex_snapfi/app/modules/home/home.dart';

class HomeController {
  final PokemonsStore store;
  final GetPokemonsUseCase getPokemonsUseCase;

  HomeController({
    required this.store,
    required this.getPokemonsUseCase,
  });

  final int _limit = 20;

  initialFetchPokemons() async {
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

  aditionalFecthPokemons() async {
    final length = store.data?.length ?? 0;

    for (int i = 0; i < _limit; i++) {
      store.data!.add(_pokemonFakeLoading);
    }
    final fakeLength = store.data?.length ?? 0;

    store.state = StoreState.itensLoading;

    try {
      final list = await getPokemonsUseCase(
        offset: length + 1,
        limit: length + _limit,
      );
      final subList = store.data!.sublist(0, fakeLength - _limit);
      subList.addAll(list);

      store.data = subList;
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

  final PokemonEntity _pokemonFakeLoading = const PokemonEntity(
    id: 0,
    name: "name",
    height: 0,
    weight: 0,
    stats: [],
    abilities: [],
    types: [],
    isLoading: true,
  );
}
