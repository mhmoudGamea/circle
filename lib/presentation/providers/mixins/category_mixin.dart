import 'package:circle/data/repositories/category_repository.dart';
import 'package:circle/injection.dart';
import 'package:flutter/material.dart';

mixin CategoryMixin on ChangeNotifier {
  final CategoriesRepository componentsRepository =
      getIt<CategoriesRepository>();
}
