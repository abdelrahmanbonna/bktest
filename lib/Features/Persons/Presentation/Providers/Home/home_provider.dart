import 'package:bktest/Core/Errors/failure.dart';
import 'package:bktest/Core/UseCases/use_case.dart';
import 'package:bktest/Features/Persons/Data/DataSource/persons_data_source.dart';
import 'package:bktest/Features/Persons/Data/Repositories/persons_repository_imp.dart';
import 'package:bktest/Features/Persons/Domain/Entities/person.dart';
import 'package:bktest/Features/Persons/Domain/UseCases/delete_person_use_case.dart';
import 'package:bktest/Features/Persons/Domain/UseCases/get_all_persons_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class HomeState extends ChangeNotifier {
  late PersonsDataSource _source;
  late PersonsRepositoryImpl _repositoryImpl;
  late GetAllPersonsUseCase _getAllPersonsUseCase;
  late DeletePersonUseCase _deletePersonUseCase;

  final List<Person> listOfPersons = [];

  Failure? error;

  HomeState() {
    _source = PersonsDataSource(http.Client());
    _repositoryImpl = PersonsRepositoryImpl(_source);
    _getAllPersonsUseCase = GetAllPersonsUseCase(_repositoryImpl);
    _deletePersonUseCase = DeletePersonUseCase(_repositoryImpl);
  }

  Future<void> getAllPersons() async {
    var response = await _getAllPersonsUseCase.call(NoParams());
    response.fold(
      (fail) {
        error = fail;
        notifyListeners();
      },
      (list) {
        listOfPersons.clear();
        listOfPersons.addAll(list);
        error = null;
        notifyListeners();
      },
    );
  }

  Future<void> deletePerson(Person person) async {
    var response = await _deletePersonUseCase.call(person);
    response.fold(
      (fail) {
        error = fail;
        notifyListeners();
      },
      (value) {
        error = null;
        getAllPersons();
      },
    );
  }
}

final homeProvider = ChangeNotifierProvider<HomeState>((ref) {
  return HomeState();
});
