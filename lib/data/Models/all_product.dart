import 'package:equatable/equatable.dart';
import 'package:qtec_test/data/Models/cart_item.dart';

class AllProduct extends Equatable{

  final List<CartItem> cartItems;

  AllProduct(this.cartItems);

  @override
  // TODO: implement props
  List<Object?> get props => [cartItems];

}