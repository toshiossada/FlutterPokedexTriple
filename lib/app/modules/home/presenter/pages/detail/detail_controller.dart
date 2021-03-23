import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx_triple/mobx_triple.dart';
import 'package:triple_pokedex/app/modules/home/domain/entities/response/pokemon.dart';
import 'package:triple_pokedex/app/modules/home/presenter/pages/viewmodel/pokemon_detail_vm.dart';
import 'package:triple_pokedex/app/modules/home/presenter/stores/home_store.dart';
import 'package:triple_pokedex/app/shared/helpers/errors.dart';

part 'detail_controller.g.dart';

@Injectable()
class DetailController extends MobXStore<Failure, PokemonDetailVM> {
  final PokemonEntityDomain pokemon;
  final HomeStore store;

  DetailController(@Data this.pokemon, this.store)
      : super(PokemonDetailVM(pokemon: pokemon));

  void setPage(int value) {
    var pokemon = store.state.pokemons[value];

    execute(() async => state.copyWith(pokemon: pokemon, page: value));
  }
}
