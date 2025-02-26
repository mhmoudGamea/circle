class CategoriesEntity {
  final num categoryId;
  final String categoryImage;
  final String categoryTitle;
  final List<CategoriesEntity> categoryItems;
  final String date;

  CategoriesEntity({
    required this.categoryId,
    required this.categoryImage,
    required this.categoryTitle,
    required this.categoryItems,
    required this.date,
  });
}
