// @dart=2.0
import 'package:flutter/material.dart';
import 'package:triple_pokedex/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/app_widget.dart';

void main() => runApp(ModularApp(module: AppModule(), child: AppWidget()));
