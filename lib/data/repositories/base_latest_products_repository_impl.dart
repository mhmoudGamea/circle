import 'dart:developer';

import 'package:circle/core/models/failure_model.dart';
import 'package:circle/data/datasource/remote/dio/dio_client.dart';
import 'package:circle/data/models/home/latest_products/latest_products_model.dart';
import 'package:circle/domain/repositories/base_latest_products_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../datasource/remote/exception/failure.dart';

class BaseLatestProductsRepositoryImpl implements BaseLatestProductsRepository {
  final DioClient dioClient;

  BaseLatestProductsRepositoryImpl({required this.dioClient});
  @override
  Future<Either<FailureModel, List<LatestProductsModel>>>
      getLatestProducts() async {
    late Response response;
    try {
      response = await dioClient.get('home/latestProducts');
      // log('Success in HomeRepositories class method getCategories ${response.data['data']}');
      return right(LatestProductsModel.getLatestProductsFromList(
          list: response.data['data']));
    } on ApiFailure catch (error) {
      log('Error in HomeRepositories class method getLatestProducts $error');
      return left(FailureModel.fromJson(response.data));
    }
  }
}
