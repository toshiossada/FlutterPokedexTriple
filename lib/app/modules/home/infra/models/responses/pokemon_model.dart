import 'dart:convert';

class PokemonModel {
  final int id;
  final String name;
  final String color;
  final String description;
  final String sprite;
  final String mainType;
  final List<String> types;

  const PokemonModel({
    this.id = 0,
    this.name = '',
    this.color = '',
    this.description = '',
    this.sprite = '',
    this.mainType = '',
    this.types = const [],
  });

  factory PokemonModel.fromMap(Map<String, dynamic>? json) {
    if (json == null) return PokemonModel();

    var types = json['types']
            ?.map<String>((e) => e['type']['name'] as String)
            ?.toList() ??
        <String>[];

    return PokemonModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      color: json['color'] ?? '',
      description: json['description'] ?? '',
      sprite: json['sprites']['front_default'] ?? '',
      mainType: json['types']?.firstWhere((e) => e['slot'] == 1)['type']
              ['name'] ??
          '',
      types: types ?? [],
    );
  }

  factory PokemonModel.fromJson(String source) =>
      PokemonModel.fromMap(json.decode(source));
}
