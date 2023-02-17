import 'package:equatable/equatable.dart';
import 'package:qtec_test/data/Models/product_list.dart';

abstract class ProductState extends Equatable{

 ProductState();
@override
 List<Object?> get props => [];

}

 class ProductLoadingState extends ProductState {
  @override
  // TODO: implement props
  List<Object?> get props => [];

 }

 class ProductSearchingState extends ProductState{

 }

 class ProductLoadedState extends ProductState {

 final ProductList productList;

  ProductLoadedState({required this.productList});

  @override
  // TODO: implement props
  List<Object?> get props => [productList];
}

 class ProductLoadingErrorState extends ProductState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}