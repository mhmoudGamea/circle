class CategoriesEntity {
  final num? categoryId;
  final String? categoryImage;
  final String? categoryTitle;
  final List<CategoriesEntity>? categoryItems;
  final String? date;

  CategoriesEntity({
    this.categoryId,
    this.categoryImage,
    this.categoryTitle,
    this.categoryItems,
    this.date,
  });
}
