import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx_triple/mobx_triple.dart';
import 'package:triple_pokedex/app/modules/home/domain/errors/errors.dart';
import 'package:triple_pokedex/app/modules/home/presenter/pages/viewmodel/pokemon_vm.dart';
import 'package:triple_pokedex/app/shared/helpers/errors.dart';

// part 'home_store.g.dart';

@Injectable()
class HomeStore extends MobXStore<Failure, PokemonVM> {
  // @computed
  // List<PokemonEntityDomain> get pokemonFiltered =>
  //     pokemons.where((e) => e.name.contains(filter)).toList();

  HomeStore() : super(PokemonVM());

  void setFilter(String value) {
    var newState = state.copyWith(filter: value);
    execute(() async => newState);
  }

  void setPokemons(Either<FailureGetPokemons, PokemonVM> value) {
    executeEither(() async => value, delay: Duration(milliseconds: 500));
  }
}
