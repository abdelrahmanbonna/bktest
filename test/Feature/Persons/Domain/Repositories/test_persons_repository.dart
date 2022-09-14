
import 'package:bktest/Features/Persons/Domain/Repositories/persons_repository.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([MockSpec<TestPersonsRepository>()])
abstract class TestPersonsRepository implements PersonsRepo {}