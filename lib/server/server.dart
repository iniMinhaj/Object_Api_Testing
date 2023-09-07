import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class Server {
  getRequest({required String endPoint}) async {
    final dio = Dio();

    try {
      return dio.get(endPoint);
    } on DioException catch (e) {
      if (e.response != null) {
        final statusCode = e.response!.statusCode;
        final errorMessage = 'Error $statusCode';
        return Left(errorMessage);
      } else {
        // Error occurred before the request was completed
        const errorMessage = 'No Internet';
        // Return the error message as Left
        return const Left(errorMessage);
      }
    } catch (e) {
      // Handle other types of errors
      final errorMessage = 'Error: $e';

      // Return the error message as Left
      return Left(errorMessage);
    }
  }
}
