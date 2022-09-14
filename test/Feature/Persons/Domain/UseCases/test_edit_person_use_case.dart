import 'package:bktest/Features/Persons/Domain/Entities/person.dart';
import 'package:bktest/Features/Persons/Domain/UseCases/edit_person_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../Repositories/test_persons_repository.dart';
import '../Repositories/test_persons_repository.mocks.dart';

void main() {
  // Setup
  EditPersonUseCase usecase;
  TestPersonsRepository mockPersonRepository;

  mockPersonRepository = MockTestPersonsRepository();
  usecase = EditPersonUseCase(mockPersonRepository);

  final tPerson2 = Person(
    id: '2',
    name: 'Ebraam',
    address: 'building 8, 9th neighborhood',
    email: 'ebraam@outlook.com',
  );


  // Test
  test(
    'should edit person',
    () async {
      // arrange
      when(mockPersonRepository.editPerson(tPerson2)).thenAnswer(
        (_) async => const Right(
          true,
        ),
      );
      // act
      final result = await usecase.call(tPerson2);
      // assert
      expect(
        result.isRight(),
        true,
      );

      expect(
        result.getOrElse(() => false),
        true,
      );
      verify(mockPersonRepository.editPerson(tPerson2));
      verifyNoMoreInteractions(mockPersonRepository);
    },
  );
}
