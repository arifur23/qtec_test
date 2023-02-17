import 'dart:convert';
import 'package:http/http.dart' as http ;
import 'package:qtec_test/data/Models/cart_item.dart';

import 'Models/product_list.dart';


class ApiRepository {

  String search = '';

  Future<ProductList>? getProduct(String? search) async {
     final response = await http.get(Uri.tryParse('https://panel.supplyline.network/api/product/search-suggestions/?limit=10&offset=10&search=$search')!);

     if(response.statusCode == 200){
         var result = jsonDecode(response.body);
         return ProductList.fromJson(result);

     }else {
       // If the server did not return a 200 OK response,
       // then throw an exception.
       throw Exception('Failed to load album');
     }
  }
   final _delay = const Duration(milliseconds: 800);

  final _items = <CartItem>[];

  Future<List<CartItem>> loadCartItems() => Future.delayed(_delay, () => _items);

  void addItemToCart(CartItem item) => _items.add(item);
  void removeItemFromCart(CartItem item) => _items.remove(item);

}

