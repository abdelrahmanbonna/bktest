import 'package:http/http.dart' as http;

import '../../Domain/Entities/person.dart';

class PersonsDataSource {
  String url = "https://nbktest-52c6c-default-rtdb.firebaseio.com/Person";
  final http.Client _client;
  PersonsDataSource(this._client);

  Future<http.Response> getAllPersons() async {
    var baseUrl = Uri.parse("$url.json");
    return _client.get(baseUrl);
  }

  Future<http.Response> addPerson(Person person) {
    var baseUrl = Uri.parse("$url.json");
    return _client.post(
      baseUrl,
      body: person.toJson(),
    );
  }

  Future<http.Response> editPerson(Person person) {
    var baseUrl = Uri.parse("$url/${person.id}.json");

    return _client.patch(
      baseUrl,
      body: person.toJson(),
    );
  }

  Future<http.Response> deletePerson(Person person) {
    var baseUrl = Uri.parse("$url/${person.id}.json");

    return _client.delete(baseUrl);
  }
}
