import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:triple_pokedex/app/modules/home/presenter/pages/detail/stores/detail_store.dart';
import 'package:triple_pokedex/app/modules/home/presenter/stores/home_store.dart';

import '../stores/detail_store.dart';

part 'detail_controller.g.dart';

@Injectable()
class DetailController {
  final int id;
  final DetailStore detailStore;
  final HomeStore store;
  PageController pageController = PageController();

  DetailController(@Param this.id, this.store, this.detailStore) {
    pageController = PageController(initialPage: id - 1, viewportFraction: 0.5);
  }

  void init() {
    setPage(id - 1);
    pageController = PageController(initialPage: id - 1, viewportFraction: 0.5);
  }

  void setPage(int value) {
    var pokemon = store.state.pokemons[value];
    detailStore.setPage(pokemon);
  }
}
