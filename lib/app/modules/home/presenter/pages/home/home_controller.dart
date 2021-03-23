import 'package:flutter_modular/flutter_modular.dart';
import 'package:triple_pokedex/app/modules/home/domain/usecases/interfaces/get_all_pokemon_interface.dart';
import 'package:triple_pokedex/app/modules/home/presenter/stores/home_store.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController {
  final IGetAllPokemon _getAllPokemon;
  final HomeStore store;

  HomeController(this._getAllPokemon, this.store);

  Future<void> getPokemons() async {
    var result = await _getAllPokemon();

    store.setPokemons(result);
  }
}
