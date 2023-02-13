import 'dart:convert';
import 'package:http/http.dart' as http ;
import '../Models/product_list.dart';


class Networking {

  Future<ProductList> getProduct(String search) async {
     final response = await http.get(Uri.tryParse('https://panel.supplyline.network/api/product/search-suggestions/?limit=10&offset=10&search=$search')!);

     if(response.statusCode == 200){
         var result = jsonDecode(response.body);

         print(ProductList.fromJson(result).data.products.results[0].image);

         return ProductList.fromJson(result);

     }else {
       // If the server did not return a 200 OK response,
       // then throw an exception.
       throw Exception('Failed to load album');
     }
  }

  Future<Album> fetchAlbum() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Album.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}