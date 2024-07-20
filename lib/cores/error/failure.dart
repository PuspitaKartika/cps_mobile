import 'package:equatable/equatable.dart';

import '../utils/constant/error_message.dart';

enum FailureType {
  noConnection,
  timeoutConnection,
  serverError,
  localError,
  unknownError
}

class Failure extends Equatable {
  const Failure({
    required this.type,
    required this.message,
    required this.apiStatus,
    this.data,
  });

  final FailureType type;
  final String message;
  final int apiStatus;
  final dynamic data; // if an error should pass any data, put it here

  @override
  List<Object> get props => [type, message, apiStatus, data];
}

// General Failures
class ServerFailure extends Failure {
  const ServerFailure()
      : super(
          type: FailureType.serverError,
          message: SERVER_ERROR,
          apiStatus: 500,
        );

  @override
  List<Object> get props => [message];
}

// No Connection
class NoConnection extends Failure {
  const NoConnection()
      : super(
          type: FailureType.noConnection,
          message: ERR_INTERNET_DISCONNECTED,
          apiStatus: 12163,
        );

  @override
  List<Object> get props => [];
}

// Local Failures
class LocalFailure extends Failure {
  @override
  const LocalFailure()
      : super(
          type: FailureType.localError,
          message: LOCAL_ERROR,
          apiStatus: 0,
        );

  @override
  List<Object> get props => [message];
}
