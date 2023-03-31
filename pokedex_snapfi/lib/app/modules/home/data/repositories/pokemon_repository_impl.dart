import 'package:pokedex_snapfi/app/modules/home/data/datasources/pokemon_datasource.dart';
import 'package:pokedex_snapfi/app/modules/home/data/mappers/pokemon_mapper.dart';
import 'package:pokedex_snapfi/app/modules/home/domain/entities/pokemon_entity.dart';
import 'package:pokedex_snapfi/app/modules/home/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonDatasource datasource;

  PokemonRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<PokemonEntity> getPokemon({required int id}) async {
    try {
      final model = await datasource.getPokemonRemote(id: id);

      final pokemonEntity = PokemonMapper.toEntity(model);

      return pokemonEntity;
    } catch (_) {
      throw Exception(); //TODO
    }
  }
}
