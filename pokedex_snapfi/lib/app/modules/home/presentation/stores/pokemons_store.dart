import 'package:get/get.dart';
import 'package:pokedex_snapfi/app/commons/presentation/stores/state_store.dart';
import 'package:pokedex_snapfi/app/modules/home/domain/entities/pokemon_entity.dart';

class PokemonsStore extends StateStore<List<PokemonEntity>> {
  final Rx<int> _indexSelected = Rx<int>(0);
  int get indexSelected => _indexSelected.value;
  set indexSelected(int value) => _indexSelected.value = value;

  PokemonEntity get pokemonSelected => data![indexSelected];

  bool get anythigData => data != null && data!.isNotEmpty;
}
