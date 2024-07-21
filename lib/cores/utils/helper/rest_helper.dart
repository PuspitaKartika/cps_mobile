import 'package:dio/dio.dart';

import '../../error/failure.dart';
import '../constant/error_message.dart';

class RestHelper {
  static Failure catchFailure({required DioException error}) {
    try {
      var response = error.response;
      switch (response?.statusCode) {
        case 400:
          return Failure(
            type: FailureType.serverError,
            apiStatus: response?.statusCode ?? 400,
            message: response?.data["message"] ?? BAD_REQUEST,
            data: response?.data,
          );
        case 401:
          return Failure(
            type: FailureType.serverError,
            apiStatus: response?.statusCode ?? 401,
            message: response?.data["message"] ?? UNAUTHORIZED,
            data: response?.data,
          );
        case 403:
          return Failure(
            type: FailureType.serverError,
            apiStatus: response?.statusCode ?? 403,
            message: response?.data["message"] ?? FORBIDDEN,
            data: response?.data,
          );
        case 404:
          return Failure(
            type: FailureType.serverError,
            apiStatus: response?.statusCode ?? 404,
            message: response?.data["message"] ?? NOT_FOUND,
            data: response?.data,
          );
        case 405:
          return Failure(
            type: FailureType.serverError,
            apiStatus: response?.statusCode ?? 405,
            message: response?.data["message"] ?? METHOD_NOT_ALLOWED,
            data: response?.data,
          );
        case 500:
          return Failure(
            type: FailureType.serverError,
            apiStatus: response?.statusCode ?? 500,
            message: response?.data["message"] ?? SERVER_ERROR,
            data: response?.data,
          );
        case 501:
          return Failure(
            type: FailureType.serverError,
            apiStatus: response?.statusCode ?? 501,
            message: response?.data["message"] ?? NOT_IMPLEMENTED,
            data: response?.data,
          );
        case 502:
          return Failure(
            type: FailureType.serverError,
            apiStatus: response?.statusCode ?? 502,
            message: response?.data["message"] ?? BAD_GATEWAY,
            data: response?.data,
          );
        case 503:
          return Failure(
            type: FailureType.serverError,
            apiStatus: response?.statusCode ?? 503,
            message: response?.data["message"] ?? SERVER_UNAVAILABLE,
            data: response?.data,
          );
        case 504:
          return Failure(
            type: FailureType.serverError,
            apiStatus: response?.statusCode ?? 504,
            message: response?.data["message"] ?? GATEWAY_TIMEOUT,
            data: response?.data,
          );
        default:
          return Failure(
            type: FailureType.serverError,
            apiStatus: response?.statusCode ?? 0,
            message: response?.data["message"] ?? response?.statusMessage,
            data: response?.data,
          );
      }
    } catch (e, _) {
      return Failure(
        type: FailureType.serverError,
        apiStatus: 0,
        message: "Data Error. We're fixing it right now. Kindly retry later.",
        data: {"data": error.message},
      );
    }
  }

  static Failure throwServerError(Response response) {
    return Failure(
      type: FailureType.serverError,
      apiStatus: response.statusCode ?? 0,
      message: ERROR_OCCURED,
    );
  }

  static Failure throwLocalError({dynamic error, required StackTrace stack}) {
    return const Failure(
      type: FailureType.localError,
      message: LOCAL_ERROR,
      apiStatus: 0,
    );
  }

  static Failure throwFailure(Failure error, {StackTrace? stack}) {
    return Failure(type: error.type, message: error.message, apiStatus: 0);
  }
}
