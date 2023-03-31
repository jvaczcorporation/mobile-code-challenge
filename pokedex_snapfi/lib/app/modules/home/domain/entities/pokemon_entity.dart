import 'package:equatable/equatable.dart';
import 'package:pokedex_snapfi/app/modules/home/domain/enums/stats.dart';
import 'package:pokedex_snapfi/app/modules/home/domain/enums/types.dart';

class PokemonEntity extends Equatable {
  final int id;
  final String name;
  final int weight;
  final int height;
  final List<BaseStatPokemonEntity> stats;
  final List<InfoAbilityPokemonEntity> abilities;
  final List<InfoTypePokemonEntity> types;

  const PokemonEntity({
    required this.id,
    required this.name,
    required this.weight,
    required this.height,
    required this.stats,
    required this.abilities,
    required this.types,
  });

  String get urlImage =>
      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png";

  @override
  List<Object?> get props => [
        id,
        name,
        weight,
        height,
        stats,
        abilities,
        types,
      ];
}

class BaseStatPokemonEntity extends Equatable {
  final int baseStat;
  final StatPokemonEntity stat;

  const BaseStatPokemonEntity({
    required this.baseStat,
    required this.stat,
  });

  @override
  List<Object?> get props => [
        baseStat,
        stat,
      ];
}

class StatPokemonEntity extends Equatable {
  final Stats name;

  const StatPokemonEntity({
    required this.name,
  });

  @override
  List<Object?> get props => [
        name,
      ];
}

class InfoAbilityPokemonEntity extends Equatable {
  final AbilityPokemonEntity ability;
  final int slot;

  const InfoAbilityPokemonEntity({
    required this.ability,
    required this.slot,
  });

  @override
  List<Object?> get props => [
        ability,
        slot,
      ];
}

class AbilityPokemonEntity extends Equatable {
  final String name;

  const AbilityPokemonEntity({
    required this.name,
  });

  @override
  List<Object?> get props => [
        name,
      ];
}

class InfoTypePokemonEntity extends Equatable {
  final TypePokemonEntity type;
  final int slot;

  const InfoTypePokemonEntity({
    required this.type,
    required this.slot,
  });

  @override
  List<Object?> get props => [
        type,
        slot,
      ];
}

class TypePokemonEntity extends Equatable {
  final Types name;

  const TypePokemonEntity({
    required this.name,
  });

  @override
  List<Object?> get props => [
        name,
      ];
}
