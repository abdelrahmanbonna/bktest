import 'dart:convert';

import 'package:bktest/Features/Persons/Data/DataSource/persons_data_source.dart';
import 'package:bktest/Features/Persons/Domain/Entities/person.dart';
import 'package:bktest/Core/UseCases/use_case.dart';
import 'package:bktest/Core/Errors/failure.dart';
import 'package:bktest/Features/Persons/Domain/Repositories/persons_repository.dart';
import 'package:dartz/dartz.dart';

class PersonsRepositoryImpl implements PersonsRepo {
  PersonsDataSource source;
  PersonsRepositoryImpl(this.source);
  @override
  Future<Either<Failure, bool>> addPersons(Person person) async {
    var result = await source.addPerson(person);
    if (result.statusCode == 200) {
      return const Right(true);
    } else {
      return Left(ServerFailure('Server Failed to Add ${person.name}'));
    }
  }

  @override
  Future<Either<Failure, bool>> deletePerson(Person person) async {
    var result = await source.deletePerson(person);
    if (result.statusCode == 200) {
      return const Right(true);
    } else {
      return Left(ServerFailure('Server Failed to delete ${person.name}'));
    }
  }

  @override
  Future<Either<Failure, bool>> editPerson(Person editedPerson) async {
    var result = await source.editPerson(editedPerson);
    if (result.statusCode == 200) {
      return const Right(true);
    } else {
      return Left(ServerFailure('Server Failed to edit ${editedPerson.name}'));
    }
  }

  @override
  Future<Either<Failure, List<Person>>> getAllPersons(NoParams params) async {
    var result = await source.getAllPersons();
    if (result.statusCode == 200) {
      var data = json.decode(result.body);
      return Right((data as Iterable).map((e) => Person.fromMap(e)).toList());
    } else {
      return Left(ServerFailure('Server Failed to get persons'));
    }
  }
}
