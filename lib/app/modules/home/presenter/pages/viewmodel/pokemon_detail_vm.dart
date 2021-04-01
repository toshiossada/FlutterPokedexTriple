import 'package:triple_pokedex/app/modules/home/domain/entities/response/pokemon.dart';

class PokemonDetailVM {
  PokemonEntityDomain pokemon = PokemonEntityDomain();
  int page = 1;
  PokemonDetailVM({
    PokemonEntityDomain? pokemon,
    int? page,
  }) {
    this.pokemon = pokemon ?? PokemonEntityDomain();
    this.page = page ?? 0;
  }

  PokemonDetailVM copyWith({
    int? page,
    PokemonEntityDomain? pokemon,
  }) {
    return PokemonDetailVM(
      page: page ?? this.page,
      pokemon: pokemon ?? this.pokemon,
    );
  }
}
