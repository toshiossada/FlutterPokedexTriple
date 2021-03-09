import 'package:triple_pokedex/app/modules/home/infra/models/responses/pokemon_model.dart';

abstract class IPokemonDatasource {
  Future<PokemonModel> get(int id);
}
