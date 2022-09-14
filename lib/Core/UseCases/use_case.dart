import 'package:dartz/dartz.dart';

import '../Errors/failure.dart';


abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {}