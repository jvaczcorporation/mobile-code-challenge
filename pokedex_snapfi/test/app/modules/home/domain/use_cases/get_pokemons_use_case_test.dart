import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex_snapfi/app/modules/home/home.dart';

import '../../../../../mocks/mocks.dart';

class PokemonRepositorySpy extends Mock implements PokemonRepository {}

void main() {
  late PokemonRepository repository;
  late GetPokemonsUseCase sut;

  setUp(() {
    repository = PokemonRepositorySpy();
    sut = GetPokemonsUseCaseImpl(
      repository: repository,
    );
  });

  test(
    "Should call get usecase pokemons with success",
    () async {
      when(
        () => repository.getPokemon(id: any(named: "id")),
      ).thenAnswer((_) async => Mocks.pokemonEntityMock);

      final result = await sut.call();

      expect(result, isA<List<PokemonEntity>>());
      expect(result.length, equals(20));
      expect(result.first.id, Mocks.pokemonEntityMock.id);
      expect(result.first.name, Mocks.pokemonEntityMock.name);
    },
  );
}
