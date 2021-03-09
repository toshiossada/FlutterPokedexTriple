import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PokemonType {
  final String description;
  final String descriptionTranslate;
  final String hexCode;
  Color get color =>
      Color(int.parse('FF${hexCode.replaceAll('#', '')}', radix: 16));
  Widget get icon => SvgPicture.asset(
        'assets/types/${description.toLowerCase()}.svg',
        fit: BoxFit.scaleDown,
      );

  const PokemonType({
    this.description = '',
    this.hexCode = '',
    this.descriptionTranslate = '',
  });
}
