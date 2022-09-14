import 'package:bktest/Core/Errors/failure.dart';
import 'package:bktest/Core/UseCases/use_case.dart';
import 'package:bktest/Features/Persons/Domain/Repositories/persons_repository.dart';
import 'package:dartz/dartz.dart';

import '../Entities/person.dart';

class DeletePersonUseCase extends UseCase<bool, Person> {
  PersonsRepo repo;
  DeletePersonUseCase(this.repo);

  @override
  Future<Either<Failure, bool>> call(Person params) {
    return repo.deletePerson(params);
  }
}
