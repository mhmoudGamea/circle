import 'package:dartz/dartz.dart';

import '../../core/models/failure_model.dart';
import '../../data/models/home/latest_products/latest_products_model.dart';

abstract class BaseLatestProductsRepository {
  Future<Either<FailureModel, List<LatestProductsModel>>> getLatestProducts();
}
