abstract class Failure {
  final String message;

  Failure(this.message);
}

class ValidationFailure extends Failure {
  final List<String> errors;

  ValidationFailure({
    required String message,
    required this.errors,
  }) : super(message);
}

class ServerFailure extends Failure {
  ServerFailure({required String message}) : super(message);
}

class CacheFailure extends Failure {
  CacheFailure(super.message);
}

class NetworkFailure extends Failure {
  NetworkFailure({required String message}) : super(message);
}

class UnknownFailure extends Failure {
  UnknownFailure({required String message}) : super(message);
}
