import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex_snapfi/app/commons/commons.dart';

import 'package:pokedex_snapfi/app/modules/home/home.dart';

import '../../../../../mocks/mocks.dart';

class PokemonDatasourceSpy extends Mock implements PokemonDatasource {}

void main() {
  late PokemonDatasource datasource;
  late PokemonRepository sut;

  setUp(() {
    datasource = PokemonDatasourceSpy();
    sut = PokemonRepositoryImpl(
      datasource: datasource,
    );
  });

  group("getPokemon", () {
    test(
      "Should call get data pokemon with success",
      () async {
        when(
          () => datasource.getPokemonRemote(id: any(named: "id")),
        ).thenAnswer((_) async => Mocks.pokemonModelMock);

        final result = await sut.getPokemon(id: 1);

        expect(result, isA<PokemonEntity>());
        expect(result.id, Mocks.pokemonEntityMock.id);
        expect(result.name, Mocks.pokemonEntityMock.name);
      },
    );

    test(
      "Should failure repository get data pokemon datasource",
      () async {
        when(
          () => datasource.getPokemonRemote(id: any(named: "id")),
        ).thenThrow(
          FailureRepository(message: ""),
        );

        final result = sut.getPokemon(id: 1);

        expect(result, throwsA(isA<FailureRepository>()));
      },
    );
  });
}
