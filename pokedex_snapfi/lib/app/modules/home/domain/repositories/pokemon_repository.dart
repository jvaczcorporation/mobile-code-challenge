import 'package:pokedex_snapfi/app/modules/home/domain/entities/pokemon_entity.dart';

abstract class PokemonRepository {
  Future<PokemonEntity> getPokemon({required int id});
}
