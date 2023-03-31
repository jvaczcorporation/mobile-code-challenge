import 'package:dio/dio.dart';
import 'package:pokedex_snapfi/app/commons/commons.dart';
import 'package:pokedex_snapfi/app/modules/home/home.dart';

class PokemonDatasourceImpl implements PokemonDatasource {
  final Dio dio;

  PokemonDatasourceImpl({
    required this.dio,
  });

  @override
  Future<PokemonModel> getPokemonRemote({required int id}) async {
    try {
      final result = await dio.get("https://pokeapi.co/api/v2/pokemon/$id");

      final pokemonModel = PokemonModel.fromJson(result.data);

      return pokemonModel;
    } catch (e) {
      throw FailureDatasource(
        message: e.toString(),
      );
    }
  }
}
