abstract class Failure {
  String message;
  Failure(this.message);
}

// General failures
class ServerFailure extends Failure {
  ServerFailure(super.message);
}
