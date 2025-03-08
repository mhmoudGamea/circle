class LatestProductsEntity {
  final String latestProductsTitle;
  final String latestProductsImage;
  final num latestProductsPrice;
  final bool latestProductsIsOffer;
  final num latestProductsOldPrice;
  final bool latestProductsIsFavorite;

  LatestProductsEntity({
    required this.latestProductsTitle,
    required this.latestProductsImage,
    required this.latestProductsPrice,
    required this.latestProductsIsOffer,
    required this.latestProductsOldPrice,
    required this.latestProductsIsFavorite,
  });
}
