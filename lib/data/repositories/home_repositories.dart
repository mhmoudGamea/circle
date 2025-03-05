import 'dart:developer';

import 'package:circle/data/datasource/remote/exception/failure.dart';
import 'package:circle/data/models/home/latest_products/latest_products_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../core/models/failure_model.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../models/home/categories/categories_model.dart';

class HomeRepositories {
  final DioClient dioClient;
  HomeRepositories({required this.dioClient});

  Future<Either<FailureModel, List<CategoriesModel>>> getCategories() async {
    late Response response;
    try {
      response = await dioClient.get('home/categories');
      // log('Success in HomeRepositories class method getCategories ${response.data['data']}');
      return right(
          CategoriesModel.getCategoriesFromList(list: response.data['data']));
    } on ApiFailure catch (error) {
      log('Error in HomeRepositories class method getCategories ${error.errorMessage}');
      return left(FailureModel.fromJson(response.data));
    }
  }

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
