import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex_snapfi/app/modules/home/domain/enums/stats.dart';
import 'package:pokedex_snapfi/app/modules/home/domain/enums/types.dart';

part 'pokemon_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PokemonModel {
  final int id;
  final String name;
  final int weight;
  final int height;
  final List<BaseStatPokemonModel> stats;
  final List<InfoAbilityPokemonModel> abilities;
  final List<InfoTypePokemonModel> types;

  const PokemonModel({
    required this.id,
    required this.name,
    required this.weight,
    required this.height,
    required this.stats,
    required this.abilities,
    required this.types,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonModelFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class BaseStatPokemonModel {
  @JsonKey(name: "base_stat")
  final int baseStat;
  final StatPokemonModel stat;

  const BaseStatPokemonModel({
    required this.baseStat,
    required this.stat,
  });

  factory BaseStatPokemonModel.fromJson(Map<String, dynamic> json) =>
      _$BaseStatPokemonModelFromJson(json);

  Map<String, dynamic> toJson() => _$BaseStatPokemonModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class StatPokemonModel {
  final Stats name;

  const StatPokemonModel({
    required this.name,
  });

  factory StatPokemonModel.fromJson(Map<String, dynamic> json) =>
      _$StatPokemonModelFromJson(json);

  Map<String, dynamic> toJson() => _$StatPokemonModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class InfoAbilityPokemonModel {
  final AbilityPokemonModel ability;
  final int slot;

  const InfoAbilityPokemonModel({
    required this.ability,
    required this.slot,
  });

  factory InfoAbilityPokemonModel.fromJson(Map<String, dynamic> json) =>
      _$InfoAbilityPokemonModelFromJson(json);

  Map<String, dynamic> toJson() => _$InfoAbilityPokemonModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AbilityPokemonModel {
  final String name;

  const AbilityPokemonModel({
    required this.name,
  });

  factory AbilityPokemonModel.fromJson(Map<String, dynamic> json) =>
      _$AbilityPokemonModelFromJson(json);

  Map<String, dynamic> toJson() => _$AbilityPokemonModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class InfoTypePokemonModel {
  final TypePokemonModel type;
  final int slot;

  const InfoTypePokemonModel({
    required this.type,
    required this.slot,
  });

  factory InfoTypePokemonModel.fromJson(Map<String, dynamic> json) =>
      _$InfoTypePokemonModelFromJson(json);

  Map<String, dynamic> toJson() => _$InfoTypePokemonModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class TypePokemonModel {
  final Types name;

  const TypePokemonModel({
    required this.name,
  });

  factory TypePokemonModel.fromJson(Map<String, dynamic> json) =>
      _$TypePokemonModelFromJson(json);

  Map<String, dynamic> toJson() => _$TypePokemonModelToJson(this);
}
