import 'dart:developer';

import 'package:circle/core/models/failure_model.dart';
import 'package:circle/data/datasource/remote/dio/dio_client.dart';
import 'package:circle/data/models/home/latest_products/product_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../domain/repositories/base_product_repository.dart';
import '../datasource/remote/exception/failure.dart';

class BaseProductRepositoryImpl implements BaseProductRepository {
  final DioClient dioClient;

  BaseProductRepositoryImpl({required this.dioClient});

  @override
  Future<Either<FailureModel, List<ProductModel>>> getLatestProducts() async {
    late Response response;
    try {
      response = await dioClient.get('home/latestProducts');
      // log('Success in HomeRepositories class method getCategories ${response.data['data']}');
      return right(
          ProductModel.getLatestProductsFromList(list: response.data['data']));
    } on ApiFailure catch (error) {
      log('Error in HomeRepositories class method getLatestProducts $error');
      return left(FailureModel.fromJson(response.data));
    }
  }

  @override
  Future<Either<FailureModel, List<ProductModel>>> getProduct({
    String? title,
    String? categoryId,
    String? subCategoryId,
  }) async {
    late Response response;
    try {
      response = await dioClient.get('home/products', queryParameters: {
        'title': title,
        'category_id': categoryId,
        'sub_category_id': subCategoryId,
      });
      log(response.data['data']);
      return right(
          ProductModel.getLatestProductsFromList(list: response.data['data']));
    } on ApiFailure catch (error) {
      log('Error in BaseProductRepositoryImpl class method getProduct $error');
      return left(FailureModel.fromJson(response.data));
    }
  }
}
