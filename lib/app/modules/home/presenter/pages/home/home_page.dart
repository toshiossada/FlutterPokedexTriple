import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:triple_pokedex/app/modules/home/presenter/pages/viewmodel/pokemon_vm.dart';
import 'package:triple_pokedex/app/modules/home/presenter/stores/home_store.dart';
import 'package:triple_pokedex/app/shared/components/rounded_text_field/rounded_text_field_widget.dart';
import 'package:triple_pokedex/app/shared/helpers/consts.dart' as Consts;
import 'package:triple_pokedex/app/shared/helpers/errors.dart';
import 'package:triple_pokedex/app/shared/helpers/utils.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  void initState() {
    super.initState();
    store.getPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .17,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xAA6e95fd),
                  Color(0xAA6fdefa),
                  Color(0xAAff96d1),
                  Color(0xAAF63BB),
                ],
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(child: SizedBox()),
                Text(
                  'Pokemon',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .024),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Container(
                    height: MediaQuery.of(context).size.height * .04,
                    child: RoundedTextFieldWidget(
                      prefixIcon: Icon(Icons.search),
                      showBorder: false,
                      backgroundColor: Colors.black.withOpacity(0.2),
                      hintText: 'Encontre um Pokémon',
                      onChanged: (v) {
                        store.store.setFilter(v!);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ScopedBuilder<HomeStore, Failure, PokemonVM>(
              store: store.store,
              onLoading: (_) => Center(child: CircularProgressIndicator()),
              onError: (_, error) => Utils.buildError('Nada encontrado'),
              onState: (_, state) {
                if (state.pokemons.length == 0)
                  return Center(
                    child: Container(
                      height: 40,
                      width: 40,
                      child: CircularProgressIndicator(),
                    ),
                  );
                return ListView.builder(
                  itemCount: state.pokemonFiltered.length,
                  itemBuilder: (_, index) {
                    var pokemon = state.pokemonFiltered[index];
                    var number = pokemon.id;

                    return ListTile(
                      leading: Hero(
                        tag: 'pokemon$number',
                        child: FadeInImage.assetNetwork(
                          fadeInDuration: Duration(seconds: 2),
                          fadeInCurve: Curves.bounceIn,
                          placeholder: 'assets/loading.gif',
                          image: pokemon.urlImage,
                        ),
                      ),
                      title: Text(
                        pokemon.name,
                        style: TextStyle(
                          fontSize: 19,
                          color: const Color(0xFF4F4F4F),
                        ),
                      ),
                      subtitle: Text(
                        '#${number.toString().padLeft(3, '0')}',
                        style: TextStyle(
                          fontSize: 15,
                          color: const Color(0xFFA4A4A4),
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: pokemon.types.map(
                          (e) {
                            var type = Consts.pokemonType
                                .firstWhere((w) => w.description == e);
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: type.color,
                                  borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).size.width * 0.07),
                                ),
                                width: MediaQuery.of(context).size.width * 0.07,
                                height:
                                    MediaQuery.of(context).size.width * 0.07,
                                child: type.icon,
                              ),
                            );
                          },
                        ).toList(),
                      ),
                      onTap: () {
                        Modular.to
                            .pushNamed('pokemon/$number', arguments: pokemon);
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
