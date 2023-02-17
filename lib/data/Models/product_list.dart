import 'data.dart';

class ProductList {
  ProductList({
    required this.status,
    required this.data,
  });

  String status;
  Data data;

  factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
    status: json["status"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
  };
}