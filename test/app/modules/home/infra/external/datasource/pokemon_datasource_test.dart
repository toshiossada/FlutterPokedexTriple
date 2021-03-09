import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';
import 'package:triple_pokedex/app/modules/home/infra/external/datasource/pokemon_datasource.dart';

import '../../../../../../mock/custom_dio_mock.dart';
import '../../../../../../mock/responses/get_pokemon_response.dart'
    as mock_response;

void main() {
  PokemonDatasource? datasource;
  final client = CustomDioMock();

  setUp(() {
    datasource = PokemonDatasource(client);
  });

  group('Testes do DataSource para pokemon', () {
    test('''
          Dado um Id do Pokemon
          Deve ler o JSON de Retorno
          E Retornar um pokemon
    ''', () async {
      when(client.post(any)).thenAnswer((_) async =>
          Response(data: jsonDecode(mock_response.pokemon1), statusCode: 200));
      final result = datasource?.get(1);

      expect(result, completes);
    });
  });
}
