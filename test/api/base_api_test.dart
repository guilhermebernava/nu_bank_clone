import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:nu_bank_clone/api/base_api.dart';
import 'package:nu_bank_clone/api/entities/base_api_props.dart';
import 'package:nu_bank_clone/core/extensions/either_extension.dart';

void main() {
  final mockBaseApi = BaseApi(
    BaseApiProps(
      apiUrl: 'https://pokeapi.co/api/v2',
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      },
    ),
  );

  test('Test Api Get SUCESS', () async {
    final response = await mockBaseApi.apiGet('/pokemon/1');
    assert(response.isRight(), true);
    final value = response.right();

    final map = jsonDecode(value);
    final name = map['name'];
    expect(name, 'bulbasaur');
  });

  test('Test Api Get ERROR', () async {
    final response = await mockBaseApi.apiGet('/pokemo');
    assert(response.isLeft(), true);

    final value = response.left();
    expect(value.endpoint, '${mockBaseApi.props.apiUrl}/pokemo');
  });
}
