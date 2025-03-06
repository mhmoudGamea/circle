import 'package:dartz/dartz.dart';

import '../../core/models/failure_model.dart';
import '../../domain/repositories/base_category_repository.dart';
import '../../domain/repositories/base_latest_products_repository.dart';
import '../models/home/categories/categories_model.dart';
import '../models/home/latest_products/latest_products_model.dart';
import 'base_category_repository_impl.dart';
import 'base_latest_products_repository_impl.dart';

class HomeRepository
    implements BaseCategoryRepository, BaseLatestProductsRepository {
  final BaseCategoryRepositoryImpl baseCategoryRepository;
  final BaseLatestProductsRepositoryImpl baseLatestProductsRepository;
  HomeRepository(
      {required this.baseCategoryRepository,
      required this.baseLatestProductsRepository});

  @override
  Future<Either<FailureModel, List<CategoriesModel>>> getCategories() async {
    return baseCategoryRepository.getCategories();
  }

  @override
  Future<Either<FailureModel, List<LatestProductsModel>>> getLatestProducts() {
    return baseLatestProductsRepository.getLatestProducts();
  }
}
