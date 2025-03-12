import 'package:circle/data/models/home/categories/categories_model.dart';

import '../../../../domain/entity/home/latest_products/latest_products_entity.dart';

class ProductModel extends LatestProductsEntity {
  final num id;
  final String title;
  final String image;
  final num? categoryId;
  final CategoriesModel category;
  final num subCategoryId;
  final CategoriesModel subCategory;
  final String details;
  final num salesLimit;
  final num price;
  final String unit;
  final num weightUnit;
  final num priceWeightUnit;
  final bool isOffer;
  final num isActive;
  final String? offerType; // Nullable field
  final num offerValue;
  final String offerStartDate;
  final String offerEndDate;
  final num oldPrice;
  final bool isFavorite;

  ProductModel({
    required this.id,
    required this.title,
    required this.image,
    this.categoryId,
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
          latestProductsTitle: title,
          latestProductsImage: image,
          latestProductsPrice: price,
          latestProductsIsOffer: isOffer,
          latestProductsOldPrice: oldPrice,
          latestProductsIsFavorite: isFavorite,
        );

  static List<ProductModel> getLatestProductsFromList(
      {required List<dynamic> list}) {
    List<ProductModel> newList = [];
    for (var element in list) {
      newList.add(ProductModel.fromJson(json: element));
    }
    return newList;
  }

  factory ProductModel.fromJson({required Map<String, dynamic> json}) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      categoryId: json['category_id'] ?? 0,
      category: json['category'] != null
          ? CategoriesModel.fromJson(json: json['category'])
          : CategoriesModel.fromJson(json: {}),
      subCategoryId: json['sub_category_id'],
      subCategory: json['sub_category'] != null
          ? CategoriesModel.fromJson(json: json['sub_category'])
          : CategoriesModel.fromJson(json: {}),
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

  static List<ProductModel> dummyLatestProducts() {
    return List.filled(
      8,
      ProductModel(
        id: 1,
        title: 'دجاج عضوي طبيعي',
        image:
            'https://ecommerce.project-nami.xyz/storage/images/admins/categories/9HmKb49fJ71697883590.png',
        category: CategoriesModel.dummyCategory()[0],
        subCategory: CategoriesModel.dummyCategory()[1],
        details: 'تفاصيل المنتج',
        salesLimit: 10,
        price: 20,
        unit: 'كيلو',
        weightUnit: 1,
        priceWeightUnit: 1,
        isOffer: true,
        isActive: 0,
        offerType: 'percentage',
        offerValue: 10,
        offerStartDate: '2023-01-01',
        offerEndDate: '2023-01-01',
        oldPrice: 10,
        isFavorite: false,
        subCategoryId: 0,
      ),
    );
  }
}
