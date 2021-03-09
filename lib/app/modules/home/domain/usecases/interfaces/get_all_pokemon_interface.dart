import 'package:dartz/dartz.dart';
import 'package:triple_pokedex/app/modules/home/domain/errors/errors.dart';
import 'package:triple_pokedex/app/modules/home/presenter/pages/viewmodel/pokemon_vm.dart';

abstract class IGetAllPokemon {
  Future<Either<FailureGetPokemons, PokemonVM>> call();
}
