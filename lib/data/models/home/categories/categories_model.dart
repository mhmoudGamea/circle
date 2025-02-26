import 'package:circle/domain/entity/home/categories/categories_entity.dart';

class CategoriesModel extends CategoriesEntity {
  final num id;
  final String image;
  final String title;
  final List<CategoriesModel> subCategories;
  final String createdAt;

  CategoriesModel({
    required this.id,
    required this.image,
    required this.title,
    required this.subCategories,
    required this.createdAt,
  }) : super(
          categoryId: id,
          categoryImage: image,
          categoryTitle: title,
          categoryItems: subCategories,
          date: createdAt,
        );

  factory CategoriesModel.fromJson({required Map<String, dynamic> json}) {
    return CategoriesModel(
      id: json['id'],
      image: json['image'],
      title: json['title'],
      subCategories: (json['sub_categories']
              as List) // i make it as List because List<dynamic> is not a subtype of List<CategoriesModel> error
          .map((item) => CategoriesModel.fromJson(json: item))
          .toList(),
      createdAt: json['created_at'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'title': title,
      'sub_categories': subCategories.map((item) => item.toMap()).toList(),
      'created_at': createdAt,
    };
  }

  //TODO: just a dummy data don't forget to remove it

  static final categoriesData = {
    "id": 43,
    "image":
        "https://ecommerce.project-nami.xyz/storage/images/admins/categories/isTBt7JOiV1697882525.png",
    "title": "الألبان و الجبن",
    "sub_categories": [
      {
        "id": 50,
        "image":
            "https://ecommerce.project-nami.xyz/storage/images/admins/categories/HVN52bbCyA1697061227.jpg",
        "title": "اللبن",
        "sub_categories": [],
        "created_at": "2023-10-12 00:53:47"
      },
      {
        "id": 51,
        "image":
            "https://ecommerce.project-nami.xyz/storage/images/admins/categories/n6l6cnOwz51697061242.jpg",
        "title": "الزبادي",
        "sub_categories": [],
        "created_at": "2023-10-12 00:54:02"
      },
      {
        "id": 52,
        "image":
            "https://ecommerce.project-nami.xyz/storage/images/admins/categories/6TudIc4GMz1697061266.jpg",
        "title": "البيض",
        "sub_categories": [],
        "created_at": "2023-10-12 00:54:26"
      },
      {
        "id": 53,
        "image":
            "https://ecommerce.project-nami.xyz/storage/images/admins/categories/r9ieYg7WQC1697061286.jpg",
        "title": "الجبن المعلبة",
        "sub_categories": [],
        "created_at": "2023-10-12 00:54:46"
      },
      {
        "id": 54,
        "image":
            "https://ecommerce.project-nami.xyz/storage/images/admins/categories/c0Ys2GJxNm1697061304.jpg",
        "title": "الجبن بالوزن",
        "sub_categories": [],
        "created_at": "2023-10-12 00:55:04"
      },
      {
        "id": 55,
        "image":
            "https://ecommerce.project-nami.xyz/storage/images/admins/categories/uA0sB4GQjJ1697061349.jpg",
        "title": "الزبدة و السمنة",
        "sub_categories": [],
        "created_at": "2023-10-12 00:55:49"
      },
      {
        "id": 143,
        "image":
            "https://ecommerce.project-nami.xyz/storage/images/admins/categories/uA0sB4GQjJ1697061349.jpg",
        "title": "الكريمة و القشطة",
        "sub_categories": [],
        "created_at": "2023-12-22 23:59:17"
      },
      {
        "id": 145,
        "image":
            "https://ecommerce.project-nami.xyz/storage/images/admins/categories/uA0sB4GQjJ1697061349.jpg",
        "title": "الجبنة المثلثات",
        "sub_categories": [],
        "created_at": "2023-12-23 00:10:26"
      },
      {
        "id": 216,
        "image":
            "https://ecommerce.project-nami.xyz/storage/images/admins/categories/uA0sB4GQjJ1697061349.jpg",
        "title": "الجبن المثلثات",
        "sub_categories": [],
        "created_at": "2024-06-15 12:00:54"
      }
    ],
    "created_at": "2023-10-12 00:48:23"
  };

  static final categoriesModel = CategoriesModel.fromJson(json: categoriesData);
}
