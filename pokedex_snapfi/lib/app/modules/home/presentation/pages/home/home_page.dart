import 'package:flutter/material.dart';
import 'package:pokedex_snapfi/app/modules/home/presentation/pages/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pokedex_snapfi/app/commons/helpers/string_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeController>();

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
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: controller.store.data?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                final pokemon = controller.store.data![index];
                return GestureDetector(
                  onTap: () {
                    controller.store.indexSelected = index;
                    Modular.to.pushNamed("/details");
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 3,
                                offset: Offset(0, 1),
                                spreadRadius: 1,
                              )
                            ],
                            borderRadius: BorderRadius.circular(
                              8.0,
                            ),
                          ),
                          child: Column(
                            children: [
                              const Expanded(
                                child: SizedBox.shrink(),
                              ),
                              Container(
                                height: 44,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFEFEFEF),
                                  borderRadius: BorderRadius.horizontal(
                                    left: Radius.circular(8.0),
                                    right: Radius.circular(8.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned.fill(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.0,
                              vertical: 4.0,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: SizedBox.shrink(),
                                    ),
                                    Text(
                                      '#${pokemon.id.toString().padLeft(3, '0')}',
                                      style: TextStyle(
                                        fontSize: 8.0,
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Image.network(
                                    pokemon.urlImage,
                                  ),
                                ),
                                Text(
                                  pokemon.name.capitalize(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      );

  @override
  void initState() {
    controller.fetchPokemons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFDC0A2D),
        title: const Text(
          "Pokédex",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20.0,
          ),
        ),
        leading: Center(
          child: Image.asset(
            "assets/pokeball.png",
            height: 24.0,
            width: 24.0,
          ),
        ),
        elevation: 0,
      ),
      backgroundColor: Color(0xFFDC0A2D),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 4.0,
          vertical: 24.0,
        ),
        child: Obx(
          () {
            if (controller.store.hasError) {
              return const Center(
                child: Text("Error loading data!"),
              );
            }

            if (controller.store.isLoading) {
              return const Center(child: CircularProgressIndicator());
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
}
