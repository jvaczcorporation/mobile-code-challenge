// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonModel _$PokemonModelFromJson(Map<String, dynamic> json) => PokemonModel(
      id: json['id'] as int,
      name: json['name'] as String,
      weight: json['weight'] as int,
      height: json['height'] as int,
      stats: (json['stats'] as List<dynamic>)
          .map((e) => BaseStatPokemonModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      abilities: (json['abilities'] as List<dynamic>)
          .map((e) =>
              InfoAbilityPokemonModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      types: (json['types'] as List<dynamic>)
          .map((e) => InfoTypePokemonModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonModelToJson(PokemonModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'weight': instance.weight,
      'height': instance.height,
      'stats': instance.stats.map((e) => e.toJson()).toList(),
      'abilities': instance.abilities.map((e) => e.toJson()).toList(),
      'types': instance.types.map((e) => e.toJson()).toList(),
    };

BaseStatPokemonModel _$BaseStatPokemonModelFromJson(
        Map<String, dynamic> json) =>
    BaseStatPokemonModel(
      baseStat: json['base_stat'] as int,
      stat: StatPokemonModel.fromJson(json['stat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BaseStatPokemonModelToJson(
        BaseStatPokemonModel instance) =>
    <String, dynamic>{
      'base_stat': instance.baseStat,
      'stat': instance.stat.toJson(),
    };

StatPokemonModel _$StatPokemonModelFromJson(Map<String, dynamic> json) =>
    StatPokemonModel(
      name: $enumDecode(_$StatsEnumMap, json['name']),
    );

Map<String, dynamic> _$StatPokemonModelToJson(StatPokemonModel instance) =>
    <String, dynamic>{
      'name': _$StatsEnumMap[instance.name]!,
    };

const _$StatsEnumMap = {
  Stats.hp: 'hp',
  Stats.attack: 'attack',
  Stats.defense: 'defense',
  Stats.specialAttack: 'special-attack',
  Stats.specialDefense: 'special-defense',
  Stats.speed: 'speed',
};

InfoAbilityPokemonModel _$InfoAbilityPokemonModelFromJson(
        Map<String, dynamic> json) =>
    InfoAbilityPokemonModel(
      ability:
          AbilityPokemonModel.fromJson(json['ability'] as Map<String, dynamic>),
      slot: json['slot'] as int,
    );

Map<String, dynamic> _$InfoAbilityPokemonModelToJson(
        InfoAbilityPokemonModel instance) =>
    <String, dynamic>{
      'ability': instance.ability.toJson(),
      'slot': instance.slot,
    };

AbilityPokemonModel _$AbilityPokemonModelFromJson(Map<String, dynamic> json) =>
    AbilityPokemonModel(
      name: json['name'] as String,
    );

Map<String, dynamic> _$AbilityPokemonModelToJson(
        AbilityPokemonModel instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

InfoTypePokemonModel _$InfoTypePokemonModelFromJson(
        Map<String, dynamic> json) =>
    InfoTypePokemonModel(
      type: TypePokemonModel.fromJson(json['type'] as Map<String, dynamic>),
      slot: json['slot'] as int,
    );

Map<String, dynamic> _$InfoTypePokemonModelToJson(
        InfoTypePokemonModel instance) =>
    <String, dynamic>{
      'type': instance.type.toJson(),
      'slot': instance.slot,
    };

TypePokemonModel _$TypePokemonModelFromJson(Map<String, dynamic> json) =>
    TypePokemonModel(
      name: $enumDecode(_$TypesEnumMap, json['name']),
    );

Map<String, dynamic> _$TypePokemonModelToJson(TypePokemonModel instance) =>
    <String, dynamic>{
      'name': _$TypesEnumMap[instance.name]!,
    };

const _$TypesEnumMap = {
  Types.normal: 'normal',
  Types.fighting: 'fighting',
  Types.flying: 'flying',
  Types.ground: 'ground',
  Types.poison: 'poison',
  Types.rock: 'rock',
  Types.bug: 'bug',
  Types.ghost: 'ghost',
  Types.steel: 'steel',
  Types.fire: 'fire',
  Types.water: 'water',
  Types.grass: 'grass',
  Types.electric: 'electric',
  Types.psychic: 'psychic',
  Types.ice: 'ice',
  Types.dragon: 'dragon',
  Types.dark: 'dark',
  Types.fairy: 'fairy',
};
