import 'package:dartz/dartz.dart';

import '../../core/models/failure_model.dart';
import '../../data/models/home/categories/categories_model.dart';

abstract class BaseCategoryRepository {
  Future<Either<FailureModel, List<CategoriesModel>>> getCategories();
}
