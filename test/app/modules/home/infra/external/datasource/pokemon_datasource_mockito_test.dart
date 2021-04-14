import 'dart:convert';

import 'package:dio/native_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:dio/dio.dart';
import 'package:triple_pokedex/app/modules/home/infra/external/datasource/pokemon_datasource.dart';

import 'package:mockito/mockito.dart';
import '../../../../../../mock/responses/get_pokemon_response.dart'
    as mock_response;
import 'pokemon_datasource_mockito_test.mocks.dart';

@GenerateMocks([DioForNative])
void main() {
  PokemonDatasource? datasource;
  final client = MockDioForNative();

  setUp(() {
    datasource = PokemonDatasource(client);
  });

  group('Testes do DataSource para pokemon', () {
    test('''
          Dado um Id do Pokemon
          Deve ler o JSON de Retorno
          E Retornar um pokemon
    ''', () async {
      int id = 1;
      var mockReturn = Future(() => Response(
            data: jsonDecode(mock_response.pokemon1),
            statusCode: 200,
            requestOptions: RequestOptions(path: '/'),
          ));

      when(client.get(any)).thenAnswer((_) => mockReturn);

      final _ = datasource!.get(id);

      expect(mockReturn, completes);
    });
  });
}
