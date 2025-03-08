import 'package:circle/domain/entity/home/categories/categories_entity.dart';

class CategoriesModel extends CategoriesEntity {
  final num? id;
  final String? image;
  final String? title;
  final List<CategoriesModel>? subCategories;
  final String? createdAt;

  CategoriesModel({
    this.id,
    this.image,
    this.title,
    this.subCategories,
    this.createdAt,
  }) : super(
          categoryId: id,
          categoryImage: image,
          categoryTitle: title,
          categoryItems: subCategories,
          date: createdAt,
        );

  static List<CategoriesModel> getCategoriesFromList(
      {required List<dynamic> list}) {
    List<CategoriesModel> newList = [];
    for (var element in list) {
      newList.add(CategoriesModel.fromJson(json: element));
    }
    return newList;
  }

  factory CategoriesModel.fromJson({required Map<String, dynamic> json}) {
    return CategoriesModel(
      id: json['id'] ?? 0,
      image: json['image'] ?? '',
      title: json['title'] ?? '',
      subCategories: json['sub_categories'] != null
          ? (json['sub_categories']
                  as List) // i make it as List because List<dynamic> is not a subtype of List<CategoriesModel> error
              .map((item) => CategoriesModel.fromJson(json: item))
              .toList()
          : [],
      createdAt: json['created_at'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'title': title,
      'sub_categories': subCategories!.map((item) => item.toMap()).toList(),
      'created_at': createdAt,
    };
  }

  // Dummy Category Data
  static List<CategoriesModel> dummyCategory() {
    return List.filled(
      5,
      CategoriesModel(
        image:
            'https://ecommerce.project-nami.xyz/storage/images/admins/categories/9HmKb49fJ71697883590.png',
        title: 'Loading...',
      ),
    );
  }

  // Dummy SubCategory Data
  static List<CategoriesModel> dummySubCategory() {
    return List.filled(
      2,
      CategoriesModel(
        title: 'Loading...',
      ),
    );
  }
}
