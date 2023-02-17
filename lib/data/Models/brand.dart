import 'result.dart';

class Brand {
  Brand({
    required this.name,
    required this.image,
    this.headerImage,
    required this.slug,
  });

  late Name name;
  late String image;
  late dynamic headerImage;
  late Slug slug;

  Brand.fromJson(Map<String, dynamic> json) {
     name = nameValues.map[json["name"]]!;
     image = json["image"];
     headerImage = json["header_image"];
     slug = slugValues.map[json["slug"]]!;
   }

  Map<String, dynamic> toJson() => {
    "name": nameValues.reverse[name],
    "image": image,
    "header_image": headerImage,
    "slug": slugValues.reverse[slug],
  };
}