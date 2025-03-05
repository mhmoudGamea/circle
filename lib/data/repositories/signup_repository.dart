import 'package:circle/core/models/base_sigup_model.dart';
import 'package:circle/core/models/failure_model.dart';
import 'package:circle/data/models/signup/signup_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../datasource/remote/dio/dio_client.dart';

class SignupRepository {
  final DioClient dioClient;

  SignupRepository({required this.dioClient});

  Future<Either<FailureModel, SignupModel>> signupUser(
      {required BaseSignupModel baseSignupModel}) async {
    late Response response;
    try {
      response = await dioClient.post(
        'auth/register',
        formData: FormData.fromMap(baseSignupModel.toMap()),
      );
      return Right(SignupModel.fromJson(response.data));
    } catch (error) {
      return Left(FailureModel.fromJson(response.data));
    }
  }
}
