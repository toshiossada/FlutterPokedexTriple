import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:triple_pokedex/app/modules/home/domain/entities/response/pokemon.dart';
import 'package:triple_pokedex/app/modules/home/domain/errors/errors.dart';
import 'package:triple_pokedex/app/modules/home/domain/repositories/pokemon_repository_interface.dart';
import 'package:triple_pokedex/app/modules/home/presenter/pages/viewmodel/pokemon_vm.dart';
import 'package:triple_pokedex/app/shared/helpers/errors.dart';

import 'interfaces/get_all_pokemon_interface.dart';

// part 'get_all_pokemon.g.dart';

@Injectable()
class GetAllPokemon implements IGetAllPokemon {
  final IPokemonRepository _pokemonRepository;

  GetAllPokemon(this._pokemonRepository);
  @override
  Future<Either<FailureGetPokemons, PokemonVM>> call() async {
    var list = <Future<Either<Failure, PokemonEntityDomain>>>[];

    var pokemons = <Either<Failure, PokemonEntityDomain>>[];
    for (var i = 0; i < 151; i++) {
      list.add(_pokemonRepository.get(i + 1));
      if (i % 50 == 0) {
        pokemons.addAll(await Future.wait(list));
        list = <Future<Either<Failure, PokemonEntityDomain>>>[];
      }
    }
    if (list.isNotEmpty) pokemons.addAll(await Future.wait(list));

    var result = <PokemonEntityDomain>[];
    for (var item in pokemons) {
      if (item.isLeft()) {
        return Left(FailureGetPokemons(message: "Falha ao processar pokemon!"));
      }
      item.fold(
        (l) => Left(l),
        (r) => result.add(r),
      );
    }

    return Right(PokemonVM(pokemons: result));
  }
}
