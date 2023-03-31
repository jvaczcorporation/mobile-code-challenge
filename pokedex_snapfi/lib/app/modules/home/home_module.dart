import 'package:pokedex_snapfi/app/modules/home/data/repositories/pokemon_repository_impl.dart';
import 'package:pokedex_snapfi/app/modules/home/domain/use_cases/get_pokemons_use_case.dart';
import 'package:pokedex_snapfi/app/modules/home/infra/remote/pokemon_datasource_impl.dart';
import 'package:pokedex_snapfi/app/modules/home/presentation/pages/details/details_controller.dart';
import 'package:pokedex_snapfi/app/modules/home/presentation/pages/details/details_page.dart';
import 'package:pokedex_snapfi/app/modules/home/presentation/pages/home/home_controller.dart';
import 'package:pokedex_snapfi/app/modules/home/presentation/pages/home/home_page.dart';
import 'package:pokedex_snapfi/app/modules/home/presentation/stores/pokemons_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory(
          (i) => PokemonDatasourceImpl(
            dio: i(),
          ),
        ),
        Bind.factory(
          (i) => PokemonRepositoryImpl(
            datasource: i(),
          ),
        ),
        Bind.factory(
          (i) => GetPokemonsUseCaseImpl(
            repository: i(),
          ),
        ),
        Bind.singleton(
          (i) => PokemonsStore(),
        ),
        Bind.factory(
          (i) => HomeController(
            store: i(),
            getPokemonsUseCase: i(),
          ),
        ),
        Bind.factory(
          (i) => DetailsController(
            store: i(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const HomePage(),
          transition: TransitionType.noTransition,
        ),
        ChildRoute(
          '/details',
          child: (context, args) => const DetailPage(),
          transition: TransitionType.noTransition,
        ),
      ];
}
