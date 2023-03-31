import 'package:pokedex_snapfi/app/modules/home/domain/entities/pokemon_entity.dart';
import 'package:pokedex_snapfi/app/modules/home/domain/repositories/pokemon_repository.dart';

abstract class GetPokemonsUseCase {
  Future<List<PokemonEntity>> call();
}

class GetPokemonsUseCaseImpl implements GetPokemonsUseCase {
  final PokemonRepository repository;

  GetPokemonsUseCaseImpl({
    required this.repository,
  });

  @override
  Future<List<PokemonEntity>> call() async {
    List<PokemonEntity> listPokemon = [];
    for (int i = 1; i <= 20; i++) {
      final pokemon = await repository.getPokemon(id: i);
      pokemon.abilities.sort((b, a) => a.slot.compareTo(b.slot));

      listPokemon.add(pokemon);
    }
    return listPokemon;
  }
}
