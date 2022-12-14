import 'package:bktest/Core/UseCases/use_case.dart';
import 'package:bktest/Features/Persons/Domain/Entities/person.dart';
import 'package:bktest/Features/Persons/Domain/UseCases/get_all_persons_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../Repositories/test_persons_repository.dart';
import '../Repositories/test_persons_repository.mocks.dart';

void main() {
  // Setup
  GetAllPersonsUseCase usecase;
  TestPersonsRepository mockPersonRepository;

  mockPersonRepository = MockTestPersonsRepository();
  usecase = GetAllPersonsUseCase(mockPersonRepository);

  final tPerson1 = Person(
    id: '1',
    name: 'Abdelrahman',
    address: 'building 17, 9th neighborhood',
    email: 'abdelrahmanbonna@outlook.com',
  );

  final tPerson2 = Person(
    id: '2',
    name: 'Ebraam',
    address: 'building 8, 9th neighborhood',
    email: 'ebraam@outlook.com',
  );

  final params = NoParams();

  // Test
  test(
    'should get All persons from the repository',
    () async {
      // arrange
      when(mockPersonRepository.getAllPersons(params)).thenAnswer(
        (_) async => Right(
          [tPerson1, tPerson2],
        ),
      );
      // act
      final result = await usecase.call(params);
      // assert
      expect(
        result.isRight(),
        true,
      );

      expect(
        result.getOrElse(() => []),
        [tPerson1, tPerson2],
      );
      verify(mockPersonRepository.getAllPersons(params));
      verifyNoMoreInteractions(mockPersonRepository);
    },
  );
}
