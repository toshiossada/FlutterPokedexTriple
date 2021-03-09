import 'package:dio/native_imp.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:triple_pokedex/app/modules/home/infra/data/datasources/pokemon_datasource_interface.dart';
import 'package:triple_pokedex/app/modules/home/infra/models/responses/pokemon_model.dart';
import 'package:triple_pokedex/app/shared/helpers/errors.dart';
// part 'pokemon_datasource.g.dart';

@Injectable()
class PokemonDatasource implements IPokemonDatasource {
  final DioForNative _client;

  PokemonDatasource(this._client);

  @override
  Future<PokemonModel> get(int id) async {
    final response = await _client.get("/pokemon/$id");

    if (response.statusCode == 200) {
      final result = PokemonModel.fromMap(response.data);

      return result;
    } else {
      throw DatasourceError(message: "Falha");
    }
  }
}
