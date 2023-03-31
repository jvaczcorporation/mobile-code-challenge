import 'package:json_annotation/json_annotation.dart';

enum Stats {
  hp(abbr: "HP"),
  attack(abbr: "ATK"),
  defense(abbr: "DEF"),
  @JsonValue("special-attack")
  specialAttack(abbr: "SATK"),
  @JsonValue("special-defense")
  specialDefense(abbr: "SDEF"),
  speed(abbr: "SPD");

  const Stats({required this.abbr});

  final String abbr;
}
