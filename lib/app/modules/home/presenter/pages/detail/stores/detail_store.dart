import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx_triple/mobx_triple.dart';
import 'package:triple_pokedex/app/modules/home/domain/entities/response/pokemon.dart';
import 'package:triple_pokedex/app/modules/home/presenter/pages/viewmodel/pokemon_detail_vm.dart';
import 'package:triple_pokedex/app/shared/helpers/errors.dart';

part 'detail_store.g.dart';

@Injectable()
class DetailStore extends MobXStore<Failure, PokemonDetailVM> {
  DetailStore() : super(PokemonDetailVM());

  void setPage(PokemonEntityDomain value) {
    execute(() async => state.copyWith(pokemon: value, page: value.id));
  }
}
