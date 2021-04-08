import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:triple_pokedex/app/modules/home/presenter/pages/viewmodel/pokemon_vm.dart';
import 'package:triple_pokedex/app/modules/home/presenter/stores/home_store.dart';
import 'package:triple_pokedex/app/shared/components/rounded_text_field/rounded_text_field_widget.dart';
import 'package:triple_pokedex/app/shared/helpers/errors.dart';
import 'package:triple_pokedex/app/shared/helpers/utils.dart';
import '../controllers/home_controller.dart';
import 'components/pokemon_card.dart';

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
    controller.getPokemons();
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
                        controller.store.setFilter(v!);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ScopedBuilder<HomeStore, Failure, PokemonVM>(
              store: controller.store,
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

                    return PokemonCard(
                      number: number,
                      pokemon: pokemon,
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
