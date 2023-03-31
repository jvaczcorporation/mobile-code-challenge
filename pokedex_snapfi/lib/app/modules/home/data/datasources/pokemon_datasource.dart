import 'package:pokedex_snapfi/app/modules/home/home.dart';

abstract class PokemonDatasource {
  Future<PokemonModel> getPokemonRemote({required int id});
}
