import 'package:pokedex_snapfi/app/commons/commons.dart';
import 'package:pokedex_snapfi/app/modules/home/home.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonDatasource datasource;

  PokemonRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<PokemonEntity> getPokemon({required int id}) async {
    final model = await datasource.getPokemonRemote(id: id);
    try {
      final pokemonEntity = PokemonMapper.toEntity(model);

      return pokemonEntity;
    } catch (e) {
      throw FailureRepository(
        message: e.toString(),
      );
    }
  }
}
