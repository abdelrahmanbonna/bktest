import 'package:bktest/Core/Errors/failure.dart';
import 'package:bktest/Core/UseCases/use_case.dart';
import 'package:bktest/Features/Persons/Domain/Repositories/persons_repository.dart';
import 'package:dartz/dartz.dart';

import '../Entities/person.dart';

class AddPersonUseCase extends UseCase<bool, Person> {
  PersonsRepo repo;
  AddPersonUseCase(this.repo);

  @override
  Future<Either<Failure, bool>> call(Person params) {
    return repo.addPersons(params);
  }
}