import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex_snapfi/app/commons/commons.dart';
import 'package:pokedex_snapfi/app/modules/home/home.dart';

import '../../../../../mocks/mocks.dart';

class DioSpy extends Mock implements Dio {}

void main() {
  late Dio dio;
  late PokemonDatasource sut;

  setUp(() {
    dio = DioSpy();
    sut = PokemonDatasourceImpl(
      dio: dio,
    );
  });

  group("getPokemonRemote", () {
    test(
      "Should call get pokemon data with success",
      () async {
        when(
          () => dio.get(any()),
        ).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(
              path: "path",
            ),
            statusCode: 200,
            data: Mocks.pokemonToJsonMock,
          ),
        );

        final result = await sut.getPokemonRemote(id: 1);

        expect(result, isA<PokemonModel>());
      },
    );
    test(
      "Should emit failure datasource remote",
      () async {
        when(
          () => dio.get(any()),
        ).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(
              path: "path",
            ),
            statusCode: 502,
            data: Mocks.pokemonToJsonMock,
          ),
        );

        final result = sut.getPokemonRemote(id: 1);

        expect(result, throwsA(isA<FailureDatasource>()));
      },
    );
  });
}
