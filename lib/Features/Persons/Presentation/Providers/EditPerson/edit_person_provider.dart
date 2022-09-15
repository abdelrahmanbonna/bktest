import 'package:bktest/Core/Errors/failure.dart';
import 'package:bktest/Features/Persons/Domain/Entities/person.dart';
import 'package:bktest/Features/Persons/Domain/UseCases/edit_person_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../../Data/DataSource/persons_data_source.dart';
import '../../../Data/Repositories/persons_repository_imp.dart';

class EditPersonState extends ChangeNotifier {
  late PersonsDataSource _source;
  late PersonsRepositoryImpl _repositoryImpl;
  late EditPersonUseCase _editPersonUseCase;
  Person _person = Person.empty();
  Failure? error;

  EditPersonState() {
    _source = PersonsDataSource(http.Client());
    _repositoryImpl = PersonsRepositoryImpl(_source);
    _editPersonUseCase = EditPersonUseCase(_repositoryImpl);
  }

  setPerson(Person person) {
    _person = person;
    notifyListeners();
  }

  Person get person => _person;

  setPersonName(String name) {
    _person.name = name;
    notifyListeners();
  }

  setPersonAddress(String addres) {
    _person.address = addres;
    notifyListeners();
  }

  setPersonEmail(String email) {
    _person.email = email;
    notifyListeners();
  }

  Future<void> editPerson(Person person) async {
    _person = person.copyWith(
        name: _person.name, address: _person.address, email: _person.email);
    var resault = await _editPersonUseCase.call(_person);
    resault.fold(
      (l) {
        error = l;
      },
      (r) {
        error = null;
      },
    );
    _person = Person.empty();
    notifyListeners();
  }
}

final editPersonProvider = ChangeNotifierProvider<EditPersonState>((ref) {
  return EditPersonState();
});
