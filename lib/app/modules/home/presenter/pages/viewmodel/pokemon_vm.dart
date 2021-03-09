import 'package:triple_pokedex/app/modules/home/domain/entities/response/pokemon.dart';

class PokemonVM {
  List<PokemonEntityDomain> pokemons = <PokemonEntityDomain>[];
  String filter = '';
  List<PokemonEntityDomain> get pokemonFiltered => pokemons
      .where((e) => e.name.toUpperCase().contains(filter.toUpperCase()))
      .toList();

  PokemonVM({
    List<PokemonEntityDomain>? pokemons,
    String? filter,
  }) {
    this.pokemons = pokemons ?? <PokemonEntityDomain>[];
    this.filter = filter ?? '';
  }

  PokemonVM copyWith({
    List<PokemonEntityDomain>? pokemons,
    String? filter,
  }) {
    return PokemonVM(
      pokemons: pokemons ?? this.pokemons,
      filter: filter ?? this.filter,
    );
  }
}
