class City {
  final int id;
  final String title;
  final int deliveryCost;
  final int regionId;

  City({
    required this.id,
    required this.title,
    required this.deliveryCost,
    required this.regionId,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'],
      title: json['title'],
      deliveryCost: json['delivery_cost'],
      regionId: json['region_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'delivery_cost': deliveryCost,
      'region_id': regionId,
    };
  }
}
