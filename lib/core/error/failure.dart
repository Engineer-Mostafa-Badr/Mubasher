import 'package:mubasher_app/core/error/failure_type.dart';

class Failure {
  final FailureType type;

  Failure(this.type);
}

class ServerFailure extends Failure {
  ServerFailure(super.type);
}
