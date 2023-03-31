import 'package:flutter/material.dart';

enum Types {
  normal(color: Color(0xFFAAA67F)),
  fighting(color: Color(0xFFC12239)),
  flying(color: Color(0xFFA891EC)),
  ground(color: Color(0xFFDEC16B)),
  poison(color: Color(0xFFA43E9E)),
  rock(color: Color(0xFFB69E31)),
  bug(color: Color(0xFFA7B723)),
  ghost(color: Color(0xFF70559B)),
  steel(color: Color(0xFFB7B9D0)),
  fire(color: Color(0xFFF57D31)),
  water(color: Color(0xFF6493EB)),
  grass(color: Color(0xFF74CB48)),
  electric(color: Color(0xFFF9CF30)),
  psychic(color: Color(0xFFFB5584)),
  ice(color: Color(0xFF9AD6DF)),
  dragon(color: Color(0xFF7037FF)),
  dark(color: Color(0xFF75574C)),
  fairy(color: Color(0xFFE69EAC));

  const Types({required this.color});

  final Color color;
}
