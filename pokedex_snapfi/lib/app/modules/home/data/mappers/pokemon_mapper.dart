import 'package:pokedex_snapfi/app/modules/home/home.dart';

class PokemonMapper {
  static PokemonEntity toEntity(PokemonModel model) => PokemonEntity(
        id: model.id,
        name: model.name,
        height: model.height,
        weight: model.weight,
        stats: model.stats
            .map((item) => BaseStatPokemonMapper.toEntity(item))
            .toList(),
        abilities: model.abilities
            .map((item) => InfoAbilityPokemonMapper.toEntity(item))
            .toList(),
        types: model.types
            .map((item) => InfoTypePokemonMapper.toEntity(item))
            .toList(),
      );
}

class BaseStatPokemonMapper {
  static BaseStatPokemonEntity toEntity(BaseStatPokemonModel model) =>
      BaseStatPokemonEntity(
        baseStat: model.baseStat,
        stat: StatPokemonMapper.toEntity(
          model.stat,
        ),
      );
}

class StatPokemonMapper {
  static StatPokemonEntity toEntity(StatPokemonModel model) =>
      StatPokemonEntity(
        name: model.name,
      );
}

class InfoAbilityPokemonMapper {
  static InfoAbilityPokemonEntity toEntity(InfoAbilityPokemonModel model) =>
      InfoAbilityPokemonEntity(
        ability: AbilityPokemonMapper.toEntity(model.ability),
        slot: model.slot,
      );
}

class AbilityPokemonMapper {
  static AbilityPokemonEntity toEntity(AbilityPokemonModel model) =>
      AbilityPokemonEntity(
        name: model.name,
      );
}

class InfoTypePokemonMapper {
  static InfoTypePokemonEntity toEntity(InfoTypePokemonModel model) =>
      InfoTypePokemonEntity(
        type: TypePokemonMapper.toEntity(model.type),
        slot: model.slot,
      );
}

class TypePokemonMapper {
  static TypePokemonEntity toEntity(TypePokemonModel model) =>
      TypePokemonEntity(
        name: model.name,
      );
}
