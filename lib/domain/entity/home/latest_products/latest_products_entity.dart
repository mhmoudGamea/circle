import '../../../../data/models/home/categories/categories_model.dart';

class LatestProductsEntity {
  final num latestProductsId;
  final String latestProductsTitle;
  final String latestProductsImage;
  final num latestProductsCategoryId;
  final CategoriesModel latestProductsCategory;
  final num latestProductsSubCategoryId;
  final CategoriesModel latestProductsSubCategory;
  final String latestProductsDetails;
  final num latestProductsSalesLimit;
  final double latestProductsPrice;
  final String latestProductsUnit;
  final num latestProductsWeightUnit;
  final double latestProductsPriceWeightUnit;
  final bool latestProductsIsOffer;
  final num latestProductsIsActive;
  final String? latestProductsOfferType; // Nullable field
  final double latestProductsOfferValue;
  final String latestProductsOfferStartDate;
  final String latestProductsOfferEndDate;
  final double latestProductsOldPrice;
  final bool latestProductsIsFavorite;

  LatestProductsEntity({
    required this.latestProductsId,
    required this.latestProductsTitle,
    required this.latestProductsImage,
    required this.latestProductsCategoryId,
    required this.latestProductsCategory,
    required this.latestProductsSubCategoryId,
    required this.latestProductsSubCategory,
    required this.latestProductsDetails,
    required this.latestProductsSalesLimit,
    required this.latestProductsPrice,
    required this.latestProductsUnit,
    required this.latestProductsWeightUnit,
    required this.latestProductsPriceWeightUnit,
    required this.latestProductsIsOffer,
    required this.latestProductsIsActive,
    this.latestProductsOfferType,
    required this.latestProductsOfferValue,
    required this.latestProductsOfferStartDate,
    required this.latestProductsOfferEndDate,
    required this.latestProductsOldPrice,
    required this.latestProductsIsFavorite,
  });
}
