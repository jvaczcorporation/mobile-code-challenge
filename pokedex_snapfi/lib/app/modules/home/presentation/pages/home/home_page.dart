import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pokedex_snapfi/app/commons/commons.dart';
import 'package:pokedex_snapfi/app/modules/home/home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeController>();
  final _scrollController = ScrollController();

  @override
  void initState() {
    controller.initialFetchPokemons();

    // Setup the listener
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        bool isBottom = _scrollController.position.pixels != 0;
        if (isBottom) {
          if (controller.store.state == StoreState.completed) {
            controller.aditionalFecthPokemons();
          }
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.red,
        title: const Text(
          "Pokédex",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24.0,
          ),
        ),
        leading: Center(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 24,
            ),
            child: Image.asset(
              "assets/pokeball.png",
              height: 24.0,
              width: 24.0,
            ),
          ),
        ),
        elevation: 0,
      ),
      backgroundColor: AppTheme.red,
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Obx(
          () {
            if (controller.store.hasError) {
              return const Center(
                child: Text(
                  "Error loading data!",
                ),
              );
            }

            if (controller.store.isLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            }

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (!controller.store.anythigData)
                    const Text(
                      "No data loaded!",
                    ),
                  if (controller.store.anythigData) _buildListPokemons,
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  get _buildListPokemons => Expanded(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 8.0,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              8.0,
            ),
          ),
          child: GridView.builder(
            controller: _scrollController,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: controller.store.data?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              final pokemon = controller.store.data![index];
              return CardPokemon(
                pokemon: pokemon,
                onTap: () {
                  controller.store.indexSelected = index;
                  Modular.to.pushNamed("/details");
                },
              );
            },
          ),
        ),
      );
}
