import 'package:bktest/Core/Errors/failure.dart';
import 'package:bktest/Features/Persons/Domain/UseCases/add_person_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../../Data/DataSource/persons_data_source.dart';
import '../../../Data/Repositories/persons_repository_imp.dart';
import '../../../Domain/Entities/person.dart';

class AddPersonState extends ChangeNotifier {
  late PersonsDataSource _source;
  late PersonsRepositoryImpl _repositoryImpl;
  late AddPersonUseCase _addPersonUseCase;

  Failure? error;

  AddPersonState() {
    _source = PersonsDataSource(http.Client());
    _repositoryImpl = PersonsRepositoryImpl(_source);
    _addPersonUseCase = AddPersonUseCase(_repositoryImpl);
  }

  Future<void> addPerson(Person person) async {
    var result = await _addPersonUseCase.call(person);
    result.fold(
      (l) {
        error = l;
        notifyListeners();
      },
      (r) {
        error = null;
        notifyListeners();
      },
    );
  }
}

final addPersonProvider = ChangeNotifierProvider<AddPersonState>((ref) {
  return AddPersonState();
});
