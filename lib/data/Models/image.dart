class Image {
  Image({
    required this.id,
    required this.image,
    required this.isPrimary,
    required this.product,
  });

  late int id;
  late String image;
  late bool isPrimary;
  late int product;

  Image.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    isPrimary = json['isPrimary'];
    product = json['product'];
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "is_primary": isPrimary,
    "product": product,
  };
}