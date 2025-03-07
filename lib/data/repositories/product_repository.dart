import 'package:dartz/dartz.dart';

import '../../core/models/failure_model.dart';
import '../../domain/repositories/base_latest_products_repository.dart';
import '../models/home/latest_products/latest_products_model.dart';

class ProductRepository implements BaseLatestProductsRepository {
  final BaseLatestProductsRepository baseLatestProductsRepository;
  ProductRepository({required this.baseLatestProductsRepository});
  @override
  Future<Either<FailureModel, List<LatestProductsModel>>> getLatestProducts() {
    return baseLatestProductsRepository.getLatestProducts();
  }
}
