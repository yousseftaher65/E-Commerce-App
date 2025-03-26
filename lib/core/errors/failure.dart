class Failure {
  final String? message;

  Failure(this.message);

  @override
  String toString() {
    return message ?? 'Unknown error occurred';
  }
}

class ServerFailure extends Failure {
  ServerFailure(super.message);
}

class NetworkFailure extends Failure {
  NetworkFailure(super.message);
}

