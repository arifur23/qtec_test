import 'products.dart';

class Data {
  Data({
    required this.categories,
    required this.products,
  });

  List<dynamic> categories;
  Products products;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    categories: List<dynamic>.from(json["categories"].map((x) => x)),
    products: Products.fromJson(json["products"]),
  );

  Map<String, dynamic> toJson() => {
    "categories": List<dynamic>.from(categories.map((x) => x)),
    "products": products.toJson(),
  };
}