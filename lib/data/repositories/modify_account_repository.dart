import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../core/models/failure_model.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../models/profile/modify_account_model.dart';

class ModifyAccountRepository {
  final DioClient dioClient;
  ModifyAccountRepository({required this.dioClient});

  Future<Either<FailureModel, bool>> updateUserData(
      {required ModifyAccountModel modifyAccountModel}) async {
    late Response response;
    try {
      response = await dioClient.post('profile/updateProfile',
          formData: FormData.fromMap(modifyAccountModel.toMap()));
      log('Success in ModifyAccountRepository class method updateUserData');
      return right(true);
    } catch (error) {
      log('Error in ModifyAccountRepository class method updateUserData $error');
      return left(FailureModel.fromJson(response.data));
    }
  }
}
