import 'package:equatable/equatable.dart';
import 'package:qtec_test/data/Models/result.dart';

class CartItem extends Equatable {

  int? id;
  late Result product;
  late int quantity;
  CartItem({required this.product, required this.quantity});

  CartItem.fromJson(Map<String, dynamic> json) {
    product = json['product'];
    quantity = json['quantity'];
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, product, quantity];

}


class Cart extends Equatable{
  final List<CartItem> items;

  const Cart(this.items);

  @override
  // TODO: implement props
  List<Object?> get props => [items];
}

