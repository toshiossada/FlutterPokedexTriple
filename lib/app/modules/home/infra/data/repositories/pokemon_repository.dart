import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:triple_pokedex/app/modules/home/domain/entities/response/pokemon.dart';
import 'package:triple_pokedex/app/modules/home/domain/errors/errors.dart';
import 'package:triple_pokedex/app/modules/home/domain/repositories/pokemon_repository_interface.dart';
import 'package:triple_pokedex/app/modules/home/infra/data/datasources/pokemon_datasource_interface.dart';
import 'package:triple_pokedex/app/shared/helpers/errors.dart';

part 'pokemon_repository.g.dart';

@Injectable()
class PokemonRepository implements IPokemonRepository {
  final IPokemonDatasource _pokemonDatasource;

  PokemonRepository(this._pokemonDatasource);

  @override
  Future<Either<Failure, PokemonEntityDomain>> get(int id) async {
    try {
      var listPokemon = await _pokemonDatasource.get(id);
      var result = PokemonEntityDomain(
        id: listPokemon.id,
        name: listPokemon.name.toUpperCase(),
        color: listPokemon.color,
        description: listPokemon.description,
        sprite: listPokemon.sprite,
        mainType: listPokemon.mainType,
        types: listPokemon.types,
      );

      return Right(result);
    } on Failure catch (err) {
      return Left(err);
    } on DioError catch (e) {
      if (e.error is DioFailure)
        return Left(
            FailureGetPokemons(message: (e.error as DioFailure).message));
      else
        return Left(FailureGetPokemons(
            message: 'Falha ao faer requisição ao servidor'));
    } on Exception catch (e) {
      return Left(FailureGetPokemons(message: e.toString()));
    }
  }
}
