import 'package:bktest/Features/Persons/Domain/Entities/person.dart';
import 'package:bktest/Features/Persons/Domain/UseCases/delete_person_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../Repositories/test_persons_repository.dart';
import '../Repositories/test_persons_repository.mocks.dart';

void main() {
  // Setup
  DeletePersonUseCase usecase;
  TestPersonsRepository mockPersonRepository;

  mockPersonRepository = MockTestPersonsRepository();
  usecase = DeletePersonUseCase(mockPersonRepository);

  final tPerson1 = Person(
    id: '1',
    name: 'Abdelrahman',
    address: 'building 17, 9th neighborhood',
    email: 'abdelrahmanbonna@outlook.com',
  );

  // Test
  test(
    'should add person',
    () async {
      // arrange
      when(mockPersonRepository.deletePerson(tPerson1)).thenAnswer(
        (_) async => const Right(
          true,
        ),
      );
      // act
      final result = await usecase.call(tPerson1);
      // assert
      expect(
        result.isRight(),
        true,
      );
      expect(
        result.getOrElse(() => false),
        true,
      );
      verify(mockPersonRepository.deletePerson(tPerson1));
      verifyNoMoreInteractions(mockPersonRepository);
    },
  );
}
