import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;
  final int? statusCode;

  const Failure(this.errMessage,this.statusCode);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage,super.statusCode);

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer',dioError.response?.statusCode);

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer',dioError.response?.statusCode);

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer',dioError.response?.statusCode);

      case DioExceptionType.badResponse:
        print("BAD RESPONSE : ${dioError}");
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceled',444);

      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection',dioError.response?.statusCode);
        }
        return ServerFailure('Unexpected Error, Please try again!',dioError.response?.statusCode);
      default:
        return ServerFailure('Opps There was an Error, Please try again',dioError.response?.statusCode);
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      print("ERROR : ${response}");
      return ServerFailure(response['errors'].toString(),statusCode);
    } else if (statusCode == 404) {
      print("FUCKIN 404 $response");
      return ServerFailure(response['Message'],statusCode);
    } else if (statusCode == 500) {
      print("FUCKIN 500 $response");
      return ServerFailure('Internal Server error, Please try later',statusCode);
    } else {
      print("FUCKIN $response");
      return ServerFailure('Opps There was an Error, Please try again',statusCode);
    }
  }
}