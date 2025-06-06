import 'dart:developer';

import 'package:circle/data/datasource/remote/dio/dio_client.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../core/models/failure_model.dart';
import '../../domain/repositories/base_category_repository.dart';
import '../datasource/remote/exception/failure.dart';
import '../models/home/categories/categories_model.dart';

class BaseCategoryRepositoryImpl implements BaseCategoryRepository {
  final DioClient dioClient;

  BaseCategoryRepositoryImpl({required this.dioClient});

  @override
  Future<Either<FailureModel, List<CategoriesModel>>> getCategories() async {
    late Response response;
    try {
      response = await dioClient.get('home/categories');
      // log('Success in HomeRepositories class method getCategories ${response.data['data']}');
      return right(
          CategoriesModel.getCategoriesFromList(list: response.data['data']));
    } on ApiFailure catch (error) {
      log('Error in ComponentsRepository class method getCategories ${error.errorMessage}');
      return left(FailureModel.fromJson(response.data));
    }
  }
}
