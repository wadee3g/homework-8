class Beauty {
  String? title;
  String? description;
  double? price;
  double? rating;
  String? warrantyInformation;
  String? shippingInformation;
  List<Map>? reviews;
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
      price: json["price"] ?? 0,
      rating: json["rating"] ?? 0,
      warrantyInformation: json["warrantyInformation"] ?? "",
      shippingInformation: json["shippingInformation"] ?? "",
      images: json["images"] ?? [],
      reviews: json["reviews"] ?? [],
      meta: json["meta"] ?? {}
     );
  }
}
