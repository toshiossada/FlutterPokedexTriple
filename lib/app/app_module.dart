import 'package:flutter_modular/flutter_modular.dart';
import 'package:triple_pokedex/app/modules/home/home_module.dart';

import 'modules/splash/splash_module.dart';

class AppModule extends Module {
  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: SplashModule()),
    ModuleRoute('/home', module: HomeModule()),
  ];
}
