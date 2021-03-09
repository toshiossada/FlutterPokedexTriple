import 'package:dartz/dartz.dart';
import 'package:triple_pokedex/app/modules/home/domain/entities/response/pokemon.dart';
import 'package:triple_pokedex/app/shared/helpers/errors.dart';

abstract class IPokemonRepository {
  Future<Either<Failure, PokemonEntityDomain>> get(int id);
}
