import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../core/models/base_login_model.dart';
import '../../core/models/failure_model.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../models/login/login_model.dart';

class LoginRepository {
  final DioClient dioClient;

  LoginRepository({required this.dioClient});
  Future<Either<FailureModel, LoginModel>> loginUser(
      {required String phoneCode, required String phoneNumber}) async {
    Response? response;
    try {
      final formData =
          BaseLoginModel(phoneCode: phoneCode, phoneNumber: phoneNumber);
      response = await dioClient.post(
        'auth/login',
        formData: FormData.fromMap(formData.toMap()),
      );
      return Right(LoginModel.fromJson(response.data));
    } catch (error) {
      return Left(FailureModel.fromJson(response?.data));
    }
  }
}
