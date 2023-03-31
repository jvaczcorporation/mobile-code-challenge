import 'package:pokedex_snapfi/app/modules/home/data/models/pokemon_model.dart';

abstract class PokemonDatasource {
  Future<PokemonModel> getPokemonRemote({required int id});
}
