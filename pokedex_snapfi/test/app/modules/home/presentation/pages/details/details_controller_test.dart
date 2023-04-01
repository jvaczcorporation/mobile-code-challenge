import 'package:flutter_test/flutter_test.dart';

import 'package:pokedex_snapfi/app/modules/home/home.dart';

import '../../../../../../mocks/mocks.dart';

void main() {
  late PokemonsStore store;
  late DetailsController sut;

  setUp(() {
    store = PokemonsStore();
    sut = DetailsController(
      store: store,
    );

    store.data = [Mocks.pokemonEntityMock, Mocks.pokemonEntityMock];
  });

  group("nextPokemon", () {
    test(
      "Should increment index selected",
      () async {
        await sut.nextPokemon();

        expect(store.indexSelected, equals(1));
      },
    );

    test(
      "Not Should increment index selected",
      () async {
        store.indexSelected = 2;

        await sut.nextPokemon();

        expect(store.indexSelected, equals(2));
      },
    );
  });

  group("previousPokemon", () {
    test(
      "Should decrement index selected",
      () async {
        store.indexSelected = 2;
        await sut.previousPokemon();

        expect(store.indexSelected, equals(1));
      },
    );

    test(
      "Not Should decrement index selected",
      () async {
        store.indexSelected = 0;
        await sut.previousPokemon();

        expect(store.indexSelected, equals(0));
      },
    );
  });
}
