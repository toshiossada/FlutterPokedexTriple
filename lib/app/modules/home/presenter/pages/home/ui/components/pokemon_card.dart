import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:triple_pokedex/app/modules/home/domain/entities/response/pokemon.dart';
import 'package:triple_pokedex/app/shared/helpers/consts.dart' as Consts;

class PokemonCard extends StatelessWidget {
  final int number;
  final PokemonEntityDomain? pokemon;

  const PokemonCard({
    this.number = 0,
    this.pokemon,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Hero(
        tag: 'pokemon$number',
        child: FadeInImage.assetNetwork(
          fadeInDuration: Duration(seconds: 2),
          fadeInCurve: Curves.bounceIn,
          placeholder: 'assets/loading.gif',
          image: pokemon?.urlImage ?? '',
        ),
      ),
      title: Text(
        pokemon?.name ?? '',
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
        children: pokemon?.types.map(
              (e) {
                var type =
                    Consts.pokemonType.firstWhere((w) => w.description == e);
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Container(
                    decoration: BoxDecoration(
                      color: type.color,
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width * 0.07),
                    ),
                    width: MediaQuery.of(context).size.width * 0.07,
                    height: MediaQuery.of(context).size.width * 0.07,
                    child: type.icon,
                  ),
                );
              },
            ).toList() ??
            [],
      ),
      onTap: () {
        Modular.to.pushNamed('pokemon/$number');
      },
    );
  }
}
