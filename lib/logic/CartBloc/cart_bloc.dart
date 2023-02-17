import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qtec_test/data/Models/cart_item.dart';
import 'package:qtec_test/data/apiRepository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc({required this.apiRepository}) : super(CartLoading()) {
      on<CartStarted>(_onStarted);
      on<CartItemAdded>(_onItemAdded);
      on<CartItemRemoved>(_onItemRemoved);
      on<CartRequestForShowPanel>(_onCartRequestForShowPanel);
  }

  final ApiRepository apiRepository;

  Future<void> _onCartRequestForShowPanel( CartRequestForShowPanel cartRequestForShowPanel, Emitter<CartState> emit) async {
    final state = this.state;
    if(state is CartLoaded){
      try{
        emit(CartRequestForShowPanelState(item: cartRequestForShowPanel.item));
        apiRepository.addItemToCart(cartRequestForShowPanel.item);
        emit(CartLoaded(cart: Cart([...state.cart.items, cartRequestForShowPanel.item])));
      }catch(e){
        emit(CartError());
      }
    }
  }

  Future<void> _onItemRemoved(CartItemRemoved cartItemRemoved, Emitter<CartState> emit) async{
    final state = this.state;
    if(state is CartLoaded){
      try{
        apiRepository.removeItemFromCart(cartItemRemoved.item);
        emit(CartLoaded(cart: Cart(
            [...state.cart.items]..remove(cartItemRemoved.item)
        )));
      }catch(e){
        emit(CartError());
      }
    }
  }

  Future<void> _onItemAdded(CartItemAdded cartItemAdded, Emitter<CartState> emit) async{
    final state = this.state;
    if(state is CartLoaded){
      try{
        apiRepository.addItemToCart(cartItemAdded.item);
        emit(CartLoaded(cart: Cart([...state.cart.items, cartItemAdded.item])));
      }catch(e){
        emit(CartError());
      }
    }
  }

  Future<void> _onStarted(CartStarted cartStarted, Emitter<CartState> emit) async{
    emit(CartLoading());
    if(state is CartLoading){
      try{
        print('Cart Loaded');
        final  cart = await apiRepository.loadCartItems();
        emit(CartLoaded(cart : Cart([...cart])));
      }catch(e){
        print('Errror in cart loading');
        emit(CartError());
      }
    }
  }
}

