import 'package:dartz/dartz.dart';

import '../../core/models/failure_model.dart';
import '../../domain/repositories/base_category_repository.dart';
import '../../domain/repositories/base_product_repository.dart';
import '../models/home/categories/categories_model.dart';
import '../models/home/latest_products/product_model.dart';

class ProductRepository
    implements BaseCategoryRepository, BaseProductRepository {
  final BaseCategoryRepository baseCategoryRepository;
  final BaseProductRepository baseProductsRepository;
  ProductRepository({
    required this.baseCategoryRepository,
    required this.baseProductsRepository,
  });

  @override
  Future<Either<FailureModel, List<CategoriesModel>>> getCategories() {
    return baseCategoryRepository.getCategories();
  }

  @override
  Future<Either<FailureModel, List<ProductModel>>> getLatestProducts() {
    return baseProductsRepository.getLatestProducts();
  }

  @override
  Future<Either<FailureModel, List<ProductModel>>> getProduct(
      {String? title, String? categoryId, String? subCategoryId}) {
    return baseProductsRepository.getProduct(
        title: title, categoryId: categoryId, subCategoryId: subCategoryId);
  }
}
