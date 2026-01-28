class Beauty {
  String? title;
  String? description;
  double? price;
  double? rating;
  String? warrantyInformation;
  String? shippingInformation;
  List<dynamic>? reviews;
  List<String>? images;
  Map<String, dynamic>? meta;

  Beauty({
    this.title,
    this.description,
    this.price,
    this.rating,
    this.warrantyInformation,
    this.shippingInformation,
    this.reviews,
    this.images,
    this.meta,
  });

  factory Beauty.fromjson(Map<String, dynamic> json) {
    return Beauty(
      title: json["title"] ?? "",
      description: json["description"] ?? "",
      price: (json["price"] as num?)?.toDouble() ?? 0.0,
      rating: (json["rating"] as num?)?.toDouble() ?? 0.0,
      warrantyInformation: json["warrantyInformation"] ?? "",
      shippingInformation: json["shippingInformation"] ?? "",
      images:
          (json["images"] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      reviews: json["reviews"] ?? [],
      meta: json["meta"] ?? {},
    );
  }
}
