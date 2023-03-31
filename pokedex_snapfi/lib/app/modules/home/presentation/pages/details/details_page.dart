import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pokedex_snapfi/app/commons/commons.dart';
import 'package:pokedex_snapfi/app/modules/home/home.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final controller = Modular.get<DetailsController>();

  @override
  void initState() {
    super.initState();
  }

  Color get color =>
      controller.store.pokemonSelected.types.first.type.name.color;

  PokemonEntity get pokemon => controller.store.pokemonSelected;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return Scaffold(
          backgroundColor: color,
          body: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Builder(
              builder: (context) {
                if (controller.store.hasError) {
                  return const Center(
                    child: Text("Error loading data!"),
                  );
                }

                if (controller.store.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                return Stack(
                  children: [
                    Column(
                      children: [
                        HeaderDetails(
                          pokemon: pokemon,
                        ),
                        _buildContent
                      ],
                    ),
                    _buildImagePokemon
                  ],
                );
              },
            ),
          ),
        );
      }),
    );
  }

  Widget get _buildContent => Expanded(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: AppTheme.boxShadowContainer,
            borderRadius: BorderRadius.circular(
              8.0,
            ),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 56,
              ),
              AboutSection(
                pokemon: pokemon,
                color: color,
              ),
              BaseStats(
                stats: pokemon.stats,
                color: color,
              ),
            ],
          ),
        ),
      );

  Widget get _buildImagePokemon => Positioned.fill(
        top: MediaQuery.of(context).size.height * 0.1,
        child: Align(
          alignment: Alignment.topCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonNavigator(
                visible: controller.store.indexSelected > 0,
                icon: Icons.arrow_back_ios_new_rounded,
                onPressed: controller.previousPokemon,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Image.network(
                  pokemon.urlImage,
                  height: 200,
                ),
              ),
              ButtonNavigator(
                visible: controller.store.indexSelected + 1 !=
                    controller.store.data!.length,
                icon: Icons.arrow_forward_ios_rounded,
                onPressed: controller.nextPokemon,
              )
            ],
          ),
        ),
      );
}
