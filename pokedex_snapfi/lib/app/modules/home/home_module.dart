import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_snapfi/app/modules/home/home.dart';

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
