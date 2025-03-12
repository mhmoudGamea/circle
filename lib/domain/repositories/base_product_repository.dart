import 'package:circle/data/models/home/latest_products/product_model.dart';
import 'package:dartz/dartz.dart';

import '../../core/models/failure_model.dart';

abstract class BaseProductRepository {
  Future<Either<FailureModel, List<ProductModel>>> getLatestProducts();

  Future<Either<FailureModel, List<ProductModel>>> getProduct(
      {String? title, String? categoryId, String? subCategoryId});
}
