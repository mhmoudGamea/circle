import 'package:circle/data/models/home/categories/categories_model.dart';

import '../../../../domain/entity/home/latest_products/latest_products_entity.dart';

class LatestProductsModel extends LatestProductsEntity {
  final num id;
  final String title;
  final String image;
  final num categoryId;
  final CategoriesModel category;
  final num subCategoryId;
  final CategoriesModel subCategory;
  final String details;
  final num salesLimit;
  final double price;
  final String unit;
  final num weightUnit;
  final double priceWeightUnit;
  final bool isOffer;
  final num isActive;
  final String? offerType; // Nullable field
  final double offerValue;
  final String offerStartDate;
  final String offerEndDate;
  final double oldPrice;
  final bool isFavorite;

  LatestProductsModel({
    required this.id,
    required this.title,
    required this.image,
    required this.categoryId,
    required this.category,
    required this.subCategoryId,
    required this.subCategory,
    required this.details,
    required this.salesLimit,
    required this.price,
    required this.unit,
    required this.weightUnit,
    required this.priceWeightUnit,
    required this.isOffer,
    required this.isActive,
    required this.offerType,
    required this.offerValue,
    required this.offerStartDate,
    required this.offerEndDate,
    required this.oldPrice,
    required this.isFavorite,
  }) : super(
          latestProductsId: id,
          latestProductsTitle: title,
          latestProductsImage: image,
          latestProductsCategoryId: categoryId,
          latestProductsCategory: category,
          latestProductsSubCategoryId: subCategoryId,
          latestProductsSubCategory: subCategory,
          latestProductsDetails: details,
          latestProductsSalesLimit: salesLimit,
          latestProductsPrice: price,
          latestProductsUnit: unit,
          latestProductsWeightUnit: weightUnit,
          latestProductsPriceWeightUnit: priceWeightUnit,
          latestProductsIsOffer: isOffer,
          latestProductsIsActive: isActive,
          latestProductsOfferType: offerType,
          latestProductsOfferValue: offerValue,
          latestProductsOfferStartDate: offerStartDate,
          latestProductsOfferEndDate: offerEndDate,
          latestProductsOldPrice: oldPrice,
          latestProductsIsFavorite: isFavorite,
        );

  factory LatestProductsModel.fromJson(Map<String, dynamic> json) {
    return LatestProductsModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      categoryId: json['category_id'],
      category: CategoriesModel.fromJson(json: json['category']),
      subCategoryId: json['sub_category_id'],
      subCategory: CategoriesModel.fromJson(json: json['sub_category']),
      details: json['details'],
      salesLimit: json['sales_limit'],
      price: json['price'],
      unit: json['unit'],
      weightUnit: json['weight_unit'],
      priceWeightUnit: json['price_weight_unit'],
      isOffer: json['is_offer'],
      isActive: json['is_active'],
      offerType: json['offer_type'],
      offerValue: json['offer_value'],
      offerStartDate: json['offer_start_date'],
      offerEndDate: json['offer_end_date'],
      oldPrice: json['old_price'],
      isFavorite: json['is_favorite'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'category_id': categoryId,
      'category': category.toMap(),
      'sub_category_id': subCategoryId,
      'sub_category': subCategory.toMap(),
      'details': details,
      'sales_limit': salesLimit,
      'price': price,
      'unit': unit,
      'weight_unit': weightUnit,
      'price_weight_unit': priceWeightUnit,
      'is_offer': isOffer,
      'is_active': isActive,
      'offer_type': offerType,
      'offer_value': offerValue,
      'offer_start_date': offerStartDate,
      'offer_end_date': offerEndDate,
      'old_price': oldPrice,
      'is_favorite': isFavorite,
    };
  }

  static final dummyData = [
    LatestProductsModel(
      id: 86016,
      title: "كلوس اب انتعاش النعناع 50 مل",
      image:
          "https://drive.google.com/uc?export=view&id=1eSnE00dc1wd2jHA8uEOWGcqOcMdHgpQl",
      categoryId: 31,
      category: CategoriesModel(
          id: 31,
          image:
              "https://ecommerce.project-nami.xyz/storage/images/admins/categories/pcdBpYcNb41697886416.webp",
          title: "منتجات العناية الشخصية",
          subCategories: [
            CategoriesModel(
                id: 96,
                image:
                    "https://ecommerce.project-nami.xyz/storage/images/admins/categories/Xadlci2YQC1697063008.jpg",
                title: "مستلزمات الإستحمام و الصابون",
                subCategories: [],
                createdAt: "2023-10-12 01:23:28"),
            CategoriesModel(
                id: 97,
                image:
                    "https://ecommerce.project-nami.xyz/storage/images/admins/categories/51Z9eBdbjQ1697063038.jpg",
                title: "مستلزمات الحلاقة و إزالة الشعر",
                subCategories: [],
                createdAt: "2023-10-12 01:23:58"),
            CategoriesModel(
                id: 98,
                image:
                    "https://ecommerce.project-nami.xyz/storage/images/admins/categories/kQND9vtmEH1697063072.jpg",
                title: "الفوط الصحية",
                subCategories: [],
                createdAt: "2023-10-12 01:24:32"),
            CategoriesModel(
                id: 99,
                image:
                    "https://ecommerce.project-nami.xyz/storage/images/admins/categories/EjjbaE3qsQ1697063102.jpg",
                title: "منتجات العناية بالأسنان",
                subCategories: [],
                createdAt: "2023-10-12 01:25:02"),
            CategoriesModel(
                id: 100,
                image:
                    "https://ecommerce.project-nami.xyz/storage/images/admins/categories/nsuv0Rku1V1697063126.jpg",
                title: "منتجات العناية بالشعر",
                subCategories: [],
                createdAt: "2023-10-12 01:25:26"),
            CategoriesModel(
                id: 101,
                image:
                    "https://ecommerce.project-nami.xyz/storage/images/admins/categories/qtUQGtkbQP1697063144.jpg",
                title: "منتجات العناية بالبشرة",
                subCategories: [],
                createdAt: "2023-10-12 01:25:44"),
            CategoriesModel(
                id: 102,
                image:
                    "https://ecommerce.project-nami.xyz/storage/images/admins/categories/y9bXEpD3mk1697063167.jpg",
                title: "مزيلات العرق و العطور",
                subCategories: [],
                createdAt: "2023-10-12 01:26:07"),
            CategoriesModel(
                id: 201,
                image: "https://ecommerce.project-nami.xyz/storage",
                title: " منتجات العناية بالبشرة",
                subCategories: [],
                createdAt: "2024-02-09 12:30:13")
          ],
          createdAt: "2023-10-12 00:40:08"),
      subCategoryId: 99,
      subCategory: CategoriesModel(
          id: 99,
          image:
              "https://ecommerce.project-nami.xyz/storage/images/admins/categories/EjjbaE3qsQ1697063102.jpg",
          title: "منتجات العناية بالأسنان",
          subCategories: [],
          createdAt: "2023-10-12 01:25:02"),
      details: "6221048413438",
      salesLimit: 10,
      price: 24,
      unit: "قطعة",
      weightUnit: 1,
      priceWeightUnit: 24,
      isOffer: false,
      isActive: 1,
      offerType: null,
      offerValue: 0,
      offerStartDate: "1970-01-01",
      offerEndDate: "1970-01-01",
      oldPrice: 24,
      isFavorite: false,
    ),
    LatestProductsModel(
      id: 12345,
      title: "دجاج عضوي طبيعي",
      image:
          "https://drive.google.com/uc?export=view&id=1eSnE00dc1wd2jHA8uEOWGcqOcMdHgpQl",
      categoryId: 50,
      category: CategoriesModel(
        id: 50,
        image:
            "https://images.pexels.com/photos/2253870/pexels-photo-2253870.jpeg",
        title: "منتجات الدواجن",
        subCategories: [
          CategoriesModel(
            id: 150,
            image:
                "https://images.pexels.com/photos/6210746/pexels-photo-6210746.jpeg",
            title: "صدر الدجاج",
            subCategories: [],
            createdAt: "2025-01-01 10:00:00",
          ),
          CategoriesModel(
            id: 151,
            image:
                "https://images.pexels.com/photos/6210747/pexels-photo-6210747.jpeg",
            title: "ورك الدجاج",
            subCategories: [],
            createdAt: "2025-01-01 10:00:00",
          ),
          CategoriesModel(
            id: 152,
            image:
                "https://images.pexels.com/photos/6210748/pexels-photo-6210748.jpeg",
            title: "أجنحة الدجاج",
            subCategories: [],
            createdAt: "2025-01-01 10:00:00",
          ),
        ],
        createdAt: "2025-01-01 09:00:00",
      ),
      subCategoryId: 150,
      subCategory: CategoriesModel(
        id: 150,
        image:
            "https://images.pexels.com/photos/6210746/pexels-photo-6210746.jpeg",
        title: "صدر الدجاج",
        subCategories: [],
        createdAt: "2025-01-01 10:00:00",
      ),
      details: "دجاج عضوي طبيعي، خالي من المضادات الحيوية أو الهرمونات.",
      salesLimit: 5,
      price: 15.99,
      unit: "كجم",
      weightUnit: 1,
      priceWeightUnit: 15.99,
      isOffer: true,
      isActive: 1,
      offerType: "خصم",
      offerValue: 10,
      offerStartDate: "2025-02-01",
      offerEndDate: "2025-02-28",
      oldPrice: 17.99,
      isFavorite: true,
    )
  ];
}
