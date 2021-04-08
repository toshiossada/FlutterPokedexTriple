import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:triple_pokedex/app/modules/home/presenter/pages/viewmodel/pokemon_detail_vm.dart';
import 'package:triple_pokedex/app/shared/helpers/consts.dart' as Consts;
import 'package:triple_pokedex/app/shared/helpers/errors.dart';
import 'package:triple_pokedex/app/shared/helpers/utils.dart';
import '../controllers/detail_controller.dart';
import '../stores/detail_store.dart';
import 'components/pokemon_icons_widget.dart';

class DetailPage extends StatefulWidget {
  final String title;
  const DetailPage({
    this.title = "Detail",
  }) : super();

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends ModularState<DetailPage, DetailController> {
  @override
  void initState() {
    controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedBuilder<DetailStore, Failure, PokemonDetailVM>(
      store: controller.detailStore,
      onLoading: (_) => Container(),
      onError: (_, error) => Utils.buildError('Erro'),
      onState: (_, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor:
                controller.detailStore.state.pokemon.pokemonMainType.color,
          ),
          body: Stack(
            children: [
              Container(
                color:
                    controller.detailStore.state.pokemon.pokemonMainType.color,
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.3),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(
                          MediaQuery.of(context).size.width * 0.1),
                      topLeft: Radius.circular(
                          MediaQuery.of(context).size.width * 0.1),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 65),
                        Text(
                          controller.detailStore.state.pokemon.name,
                          style: TextStyle(fontSize: 40),
                        ),
                        SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: controller.detailStore.state.pokemon.types
                              .map<Widget>(
                            (e) {
                              var type = Consts.pokemonType
                                  .firstWhere((w) => w.description == e);
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                child: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: type.color,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(7),
                                    child: Row(
                                      children: [
                                        SizedBox(width: 5),
                                        type.icon,
                                        SizedBox(width: 10),
                                        Text(
                                          type.descriptionTranslate
                                              .toUpperCase(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ).toList(),
                        ),
                        SizedBox(height: 30),
                        Text(controller.detailStore.state.pokemon.description),
                        SizedBox(height: 52),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 130,
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: controller.detailStore.state.pokemon
                                    .pokemonMainType.color,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 15,
                                ),
                                child: Center(
                                  child: Text(
                                    'ESTATISTICA',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                            Container(
                              width: 130,
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 25),
                                child: Center(
                                  child: Text(
                                    'EVOLUÇÃO',
                                    style: TextStyle(
                                        color: controller.detailStore.state
                                            .pokemon.pokemonMainType.color,
                                        fontSize: 14),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 33),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.09),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.1,
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: PokemonIconsWidget(
                    pageController: controller.pageController,
                    count: controller.store.state.pokemons.length,
                    pokemons: controller.store.state.pokemons,
                    onPageChanged: controller.setPage,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
