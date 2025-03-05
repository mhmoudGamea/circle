// import 'package:dio/dio.dart';
// import 'package:easy_localization/easy_localization.dart';

// class ApiErrorHandler {
//   static String handleError(e) {
//     String errorDescription = "";
//     if (e is Exception) {
//       if (e is DioException) {
//         if (e.type == DioExceptionType.unknown) {
//           //inter net connection
//           errorDescription = 'Check internet connection'.tr();
//         } else {
//           print("errorApiHandler=>>>>>>>${e.toString()}");
//           if (e.response != null) {
//             if (e.response!.statusCode == 500) {
//             } else if (e.response!.statusCode == 401) {
//               errorDescription = 'Unauthorized'.tr();
//             } else if (e.response!.statusCode == 404) {
//             } else if (e.type == DioExceptionType.connectionTimeout) {
//               errorDescription = 'Check internet connection'.tr();
//             } else if (e.type == DioExceptionType.receiveTimeout) {
//               errorDescription = 'Check internet connection'.tr();
//             } else if (e.type == DioExceptionType.sendTimeout) {
//               errorDescription = 'Check internet connection'.tr();
//             }
//           } else {
//             errorDescription = 'Check internet connection'.tr();
//           }

//           //print("error=>>>${e.response!.data['code']}-----${e.response!.data['data']}-----${e.response!.data['message']}");
//         }
//       }
//     } else {
//       print("error=>${e.toString()}");
//       errorDescription = '';
//     }
//     return errorDescription;
//   }
// }

import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;
  Failure(this.errorMessage);
}

class ApiFailure extends Failure {
  ApiFailure(super.errorMessage);

  factory ApiFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ApiFailure('Connection timed out, Please try again later');
      case DioExceptionType.sendTimeout:
        return ApiFailure('Send timed out, Please try again later');
      case DioExceptionType.receiveTimeout:
        return ApiFailure('Receive timed out, Please try again later');
      case DioExceptionType.badCertificate:
        return ApiFailure(
            'Bad certificate, Please check your certificate settings.');
      case DioExceptionType.badResponse:
        return ApiFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ApiFailure('Request to API was canceled.');
      case DioExceptionType.connectionError:
        if (dioException.message?.contains('SocketException') ?? false) {
          return ApiFailure(
              'No internet connection, Please check your internet connection.');
        }
        return ApiFailure('Unexpected error, please try again.');
      case DioExceptionType.unknown:
        return ApiFailure('Oops, there was an error, please try again later.');
    }
  }

  factory ApiFailure.fromResponse(int statusCode, Map<String, dynamic> json) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ApiFailure(json['error']['message']);
    } else if (statusCode == 404) {
      return ApiFailure('This page is not found, Please try later.');
    } else if (statusCode == 500) {
      return ApiFailure('Internal server error, Please try later.');
    } else {
      return ApiFailure('Oops, there was an error, please try again later.');
    }
  }
}
