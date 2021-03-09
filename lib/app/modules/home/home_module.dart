import 'package:triple_pokedex/app/shared/helpers/consts.dart' as config;
import 'package:dio/dio.dart';
import 'package:triple_pokedex/app/shared/helpers/custom_dio/custom_dio.dart';
import 'domain/usecases/get_all_pokemon.dart';
import 'infra/data/repositories/pokemon_repository.dart';
import 'infra/external/datasource/pokemon_datasource.dart';
import 'presenter/pages/detail/detail_controller.dart';
import 'presenter/pages/detail/detail_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'presenter/pages/home/home_controller.dart';
import 'presenter/pages/home/home_page.dart';
import 'presenter/stores/home_store.dart';

class HomeModule extends Module {
  // Provide a list of dependencies to inject into your project
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => DetailController(i.args!.data, i())),
    Bind.lazySingleton((i) => HomeController(i(), i())),
    Bind.lazySingleton((i) => HomeStore()),
    Bind.lazySingleton((i) => PokemonDatasource(i())),
    Bind.lazySingleton((i) => PokemonRepository(i())),
    Bind.lazySingleton((i) => PokemonRepository(i())),
    Bind.lazySingleton((i) => GetAllPokemon(i())),
    Bind.lazySingleton((i) => CustomDio(i())),
    Bind.lazySingleton((i) => BaseOptions(
          baseUrl: config.baseUrlLogin,
          connectTimeout: 5000,
        )),
  ];

  // Provide all the routes for your module
  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
    ChildRoute('pokemon/:id', child: (_, args) => DetailPage()),
  ];
}
