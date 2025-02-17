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

class _DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  final controller = Modular.get<DetailsController>();

  late final AnimationController _animationController = AnimationController(
    duration: const Duration(
      milliseconds: 1000,
    ),
    vsync: this,
  )..forward();

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(0.5, 0.0),
    end: const Offset(0.0, 0.0),
  ).animate(
    CurvedAnimation(
      parent: _animationController,
      curve: Curves.decelerate,
    ),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
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
                    child: Text(
                      "Error loading data!",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24.0,
                      ),
                    ),
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
                height: 48,
              ),
              TypesSection(
                pokemon: pokemon,
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
        top: MediaQuery.of(context).size.height * 0.11,
        child: Align(
          alignment: Alignment.topCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonNavigator(
                visible: controller.store.indexSelected > 0,
                icon: Icons.arrow_back_ios_new_rounded,
                onPressed: () {
                  _animationController.reset();
                  controller.previousPokemon();
                  _animationController.forward();
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: SlideTransition(
                  position: _offsetAnimation,
                  child: Image.network(
                    pokemon.urlImage,
                    height: 200,
                  ),
                ),
              ),
              ButtonNavigator(
                visible: controller.store.indexSelected + 1 !=
                    controller.store.data!.length,
                icon: Icons.arrow_forward_ios_rounded,
                onPressed: () {
                  _animationController.reset();
                  controller.nextPokemon();
                  _animationController.forward();
                },
              )
            ],
          ),
        ),
      );
}
