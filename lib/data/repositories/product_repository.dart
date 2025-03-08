import 'package:circle/data/models/home/categories/categories_model.dart';
import 'package:circle/domain/repositories/base_category_repository.dart';
import 'package:dartz/dartz.dart';

import '../../core/models/failure_model.dart';
import '../../domain/repositories/base_latest_products_repository.dart';
import '../models/home/latest_products/latest_products_model.dart';

class ProductRepository
    implements BaseCategoryRepository, BaseLatestProductsRepository {
  final BaseCategoryRepository baseCategoryRepository;
  final BaseLatestProductsRepository baseLatestProductsRepository;
  ProductRepository({
    required this.baseCategoryRepository,
    required this.baseLatestProductsRepository,
  });

  @override
  Future<Either<FailureModel, List<CategoriesModel>>> getCategories() {
    return baseCategoryRepository.getCategories();
  }

  @override
  Future<Either<FailureModel, List<LatestProductsModel>>> getLatestProducts() {
    return baseLatestProductsRepository.getLatestProducts();
  }
}
