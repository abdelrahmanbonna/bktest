// ignore_for_file: unused_local_variable, unused_element

import 'dart:convert';

import 'package:bktest/Features/Persons/Data/DataSource/persons_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../Fixture/fixture.dart';
import 'test_persons_data_source.mocks.dart';

@GenerateNiceMocks([MockSpec<http.Client>()])
void main() {
  http.Client testClient = MockClient();
  PersonsDataSource dataSource = PersonsDataSource(testClient);
  // String url = "nbktest-52c6c-default-rtdb.firebaseio.com";

  void setUpMockHttpClientSuccess200() {
    when(testClient.get(
      Uri(),
    )).thenAnswer(
      (_) async => http.Response(fixture('persons.json'), 200),
    );
  }

  void setUpMockHttpClientFailure404() {
    when(testClient.get(
      Uri(),
    )).thenAnswer(
      (_) async => http.Response('Something went wrong', 404),
    );
  }

  group('Test Persons Data Source', () {
    final tPersonsList = json.decode(fixture('persons.json'));

    // test('GetAllPersons when 200', () async {
    //   setUpMockHttpClientSuccess200();

    //   var result = await dataSource.getAllPersons();

    //   expect(result.statusCode, 200);
    //   assert(result.body.isNotEmpty);
    //   expect(json.decode(result.body), tPersonsList);
    //   verifyNoMoreInteractions(testClient);
    // });

    // test('GetAllPersons when 404', () async {
    //   setUpMockHttpClientFailure404();

    //   var result = await dataSource.getAllPersons();

    //   expect(result.statusCode, 404);
    //   assert(result.body.isNotEmpty);
    //   expect(json.decode(result.body), 'Something went wrong');
    //   verifyNoMoreInteractions(testClient);
    // });
  });
}
