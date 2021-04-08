import 'package:flutter/material.dart';
import 'package:triple_pokedex/app/modules/home/domain/entities/response/pokemon.dart';

class PokemonIconsWidget extends StatelessWidget {
  final PageController? pageController;
  final int count;
  final List<PokemonEntityDomain>? pokemons;
  final Function(int)? onPageChanged;

  PokemonIconsWidget({
    @required this.pageController,
    this.count = 0,
    @required this.pokemons,
    this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView.builder(
        controller: pageController,
        onPageChanged: onPageChanged,
        itemCount: count,
        itemBuilder: (_, index) {
          var pokemon = pokemons?[index] ?? PokemonEntityDomain();

          return Hero(
            tag: 'pokemon${pokemon.id}',
            child: FadeInImage.assetNetwork(
              fadeInDuration: Duration(seconds: 2),
              fadeInCurve: Curves.bounceIn,
              placeholder: 'assets/loading.gif',
              image: pokemon.urlImage,
              fit: BoxFit.fitHeight,
              height: 20,
            ),
          );
        },
      ),
    );
  }
}
