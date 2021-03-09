import 'package:triple_pokedex/app/shared/helpers/consts.dart' as Consts;
import 'package:triple_pokedex/app/shared/models/pokemon_type.dart';

class PokemonEntityDomain {
  final int id;
  final String name;
  final String color;
  final String description;
  final String sprite;
  final String mainType;
  final List<String> types;

  String get urlImage =>
      'https://pokeres.bastionbot.org/images/pokemon/$id.png';

  PokemonType get pokemonMainType =>
      Consts.pokemonType.firstWhere((w) => w.description == mainType);

  const PokemonEntityDomain({
    this.id = 0,
    this.name = '',
    this.color = '',
    this.description = '',
    this.sprite = '',
    this.mainType = '',
    this.types = const [],
  });
}
