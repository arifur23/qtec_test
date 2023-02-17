part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
}

class CartStarted extends CartEvent{

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CartRequestForShowPanel extends CartEvent{
  final CartItem item;

  const CartRequestForShowPanel(this.item);


  @override
  // TODO: implement props
  List<Object?> get props => [item];

}

class CartItemAdded extends CartEvent{

  final CartItem item;

  const CartItemAdded(this.item);


  @override
  // TODO: implement props
  List<Object?> get props => [item];
}

class CartItemRemoved extends CartEvent{

  final CartItem item;

  CartItemRemoved(this.item);

  @override
  // TODO: implement props
  List<Object?> get props => [item];
}


