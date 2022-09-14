import 'package:bktest/Core/Errors/failure.dart';
import 'package:bktest/Core/UseCases/use_case.dart';
import 'package:bktest/Features/Persons/Domain/Entities/person.dart';
import 'package:bktest/Features/Persons/Domain/Repositories/persons_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllPersonsUseCase extends UseCase<List<Person>, NoParams> {
  PersonsRepo repo;
  GetAllPersonsUseCase(this.repo);
  @override
  Future<Either<Failure, List<Person>>> call(NoParams params) {
    return repo.getAllPersons(params);
  }
}
