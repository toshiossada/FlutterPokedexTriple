import 'package:flutter_modular/flutter_modular.dart';
import 'package:triple_pokedex/app/modules/splash/presenter/pages/splash_page.dart';

class SplashModule extends Module {
  // Provide all the routes for your module
  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => SplashPage()),
  ];
}
