import 'package:pokedex_snapfi/app/modules/home/home.dart';

abstract class PokemonRepository {
  Future<PokemonEntity> getPokemon({required int id});
}
