import 'package:dartz/dartz.dart';

import '../../core/models/failure_model.dart';
import '../../domain/repositories/base_category_repository.dart';
import '../models/home/categories/categories_model.dart';
import 'base_category_repository_impl.dart';

class CategoriesRepository implements BaseCategoryRepository {
  final BaseCategoryRepositoryImpl baseCategoryRepository;
  CategoriesRepository({required this.baseCategoryRepository});
  @override
  Future<Either<FailureModel, List<CategoriesModel>>> getCategories() {
    return baseCategoryRepository.getCategories();
  }
}
