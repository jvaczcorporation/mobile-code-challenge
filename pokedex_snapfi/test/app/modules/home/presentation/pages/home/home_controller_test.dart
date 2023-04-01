import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex_snapfi/app/commons/domain/domain.dart';
import 'package:pokedex_snapfi/app/modules/home/home.dart';

import '../../../../../../mocks/mocks.dart';

class GetPokemonsUseCaseSpy extends Mock implements GetPokemonsUseCase {}

void main() {
  late GetPokemonsUseCase getPokemonsUseCase;
  late PokemonsStore store;
  late HomeController sut;

  setUp(() {
    getPokemonsUseCase = GetPokemonsUseCaseSpy();
    store = PokemonsStore();
    sut = HomeController(
      getPokemonsUseCase: getPokemonsUseCase,
      store: store,
    );
  });

  group("initialFetchPokemons", () {
    test(
      "Should call initial fetch pokemons with success",
      () async {
        when(
          () => getPokemonsUseCase(),
        ).thenAnswer((_) async => [Mocks.pokemonEntityMock]);

        await sut.initialFetchPokemons();

        expect(store.state, StoreState.completed);
        expect(store.data, isA<List<PokemonEntity>>());
        expect(store.data!.length, equals(1));
        expect(store.data!.first.id, Mocks.pokemonEntityMock.id);
        expect(store.data!.first.name, Mocks.pokemonEntityMock.name);
      },
    );

    test(
      "Failure initial fetch pokemons",
      () async {
        when(
          () => getPokemonsUseCase(),
        ).thenThrow(
          FailureRepository(message: "message"),
        );

        await sut.initialFetchPokemons();

        expect(store.state, StoreState.error);
        expect(store.error, equals("message"));
        expect(store.exception, isA<FailureRepository>());
      },
    );

    test(
      "Emit generic exception error in fetch pokemons",
      () async {
        when(
          () => getPokemonsUseCase(),
        ).thenThrow(
          Exception(),
        );

        await sut.initialFetchPokemons();

        expect(store.state, StoreState.error);
        expect(store.exception, isA<Exception>());
      },
    );
  });

  group("aditionalFecthPokemons", () {
    test(
      "Should call aditional fetch pokemons with success",
      () async {
        store.data = [Mocks.pokemonEntityMock, Mocks.pokemonEntityMock];

        when(
          () => getPokemonsUseCase(
            limit: any(named: "limit"),
            offset: any(named: "offset"),
          ),
        ).thenAnswer((_) async => [Mocks.pokemonEntityMock]);

        await sut.aditionalFecthPokemons();

        expect(store.state, StoreState.completed);
        expect(store.data, isA<List<PokemonEntity>>());
        expect(store.data!.length, equals(3));
        expect(store.data!.first.id, Mocks.pokemonEntityMock.id);
        expect(store.data!.first.name, Mocks.pokemonEntityMock.name);
      },
    );

    test(
      "Failure aditional fetch pokemons",
      () async {
        store.data = [];
        when(
          () => getPokemonsUseCase(
            limit: any(named: "limit"),
            offset: any(named: "offset"),
          ),
        ).thenThrow(
          FailureRepository(message: "message"),
        );

        await sut.aditionalFecthPokemons();

        expect(store.state, StoreState.error);
        expect(store.error, equals("message"));
        expect(store.exception, isA<FailureRepository>());
      },
    );

    test(
      "Emit generic exceptin error in aditional fetch pokemons",
      () async {
        store.data = [];
        when(
          () => getPokemonsUseCase(
            limit: any(named: "limit"),
            offset: any(named: "offset"),
          ),
        ).thenThrow(
          Exception(),
        );

        await sut.aditionalFecthPokemons();

        expect(store.state, StoreState.error);
        expect(store.exception, isA<Exception>());
      },
    );
  });
}
