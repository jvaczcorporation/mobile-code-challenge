import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokedex_snapfi/app/modules/home/data/datasources/pokemon_datasource.dart';
import 'package:pokedex_snapfi/app/modules/home/data/models/pokemon_model.dart';

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
    } catch (_) {
      throw Exception(); //TODO
    }
  }
}
