import 'package:get/get.dart';
import 'package:pokedex_snapfi/app/commons/commons.dart';
import 'package:pokedex_snapfi/app/modules/home/home.dart';

class PokemonsStore extends StateStore<List<PokemonEntity>> {
  final Rx<int> _indexSelected = Rx<int>(0);
  int get indexSelected => _indexSelected.value;
  set indexSelected(int value) => _indexSelected.value = value;

  PokemonEntity get pokemonSelected => data![indexSelected];

  bool get anythigData => data != null && data!.isNotEmpty;
}
