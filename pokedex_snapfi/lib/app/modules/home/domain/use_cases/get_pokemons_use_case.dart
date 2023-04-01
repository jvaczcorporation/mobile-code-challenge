import 'package:pokedex_snapfi/app/modules/home/home.dart';

abstract class GetPokemonsUseCase {
  Future<List<PokemonEntity>> call({int offset = 1, int limit = 20});
}

class GetPokemonsUseCaseImpl implements GetPokemonsUseCase {
  final PokemonRepository repository;

  GetPokemonsUseCaseImpl({
    required this.repository,
  });

  @override
  Future<List<PokemonEntity>> call({int offset = 1, int limit = 20}) async {
    List<PokemonEntity> listPokemon = [];
    for (int i = offset; i <= limit; i++) {
      final pokemon = await repository.getPokemon(id: i);
      listPokemon.add(pokemon);
    }
    return listPokemon;
  }
}
