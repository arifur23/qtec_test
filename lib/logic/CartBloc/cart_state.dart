part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();
}

class CartLoading extends CartState {
  @override
  List<Object> get props => [];
}

class CartRequestForShowPanelState extends CartState{
  final CartItem item;

  const CartRequestForShowPanelState({required this.item});

  @override
  List<Object> get props => [item];

}

class CartLoaded extends CartState{

  final Cart cart;

  const CartLoaded({required this.cart});

  @override
  List<Object> get props => [cart];
}

class CartError extends CartState{
  @override
  List<Object> get props => [];
}