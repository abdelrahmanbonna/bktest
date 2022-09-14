import 'package:bktest/Core/UseCases/use_case.dart';
import 'package:bktest/Features/Persons/Domain/Entities/person.dart';
import 'package:dartz/dartz.dart';

import '../../../../Core/Errors/failure.dart';

abstract class PersonsRepo {
   Future<Either<Failure, List<Person>>> getAllPersons(NoParams params); 
   Future<Either<Failure, bool>> addPersons(Person person); 
   Future<Either<Failure, bool>> deletePerson(Person person); 
   Future<Either<Failure, bool>> editPerson(Person editedPerson); 
}