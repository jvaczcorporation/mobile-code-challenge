import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_snapfi/app/app_module.dart';
import 'package:pokedex_snapfi/app/app_widget.dart';

Future<void> main() async {
  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
