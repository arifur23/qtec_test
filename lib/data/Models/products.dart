import 'result.dart';

class Products {
  Products({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  late int count;
  late String next;
  late String previous;
  late List<Result> results;

  Products.fromJson(Map<String, dynamic> json) {
    count = json["count"];
    next = json["next"];
    previous = json["previous"];
    results = List<Result>.from(json["results"].map((x) => Result.fromJson(x)));
  }

  Map<String, dynamic> toJson() => {
    "count": count,
    "next": next,
    "previous": previous,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}