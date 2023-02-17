import 'package:equatable/equatable.dart';

import '../../data/Models/cart_item.dart';
import '../../data/Models/product_list.dart';

abstract class ProductSearchState extends Equatable{

  late Cart cart;


}

class SearchingProductState extends ProductSearchState{

  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class SearchProductLoadedState extends ProductSearchState{
  final ProductList? productList;

  SearchProductLoadedState( {required this.productList});

  @override
  // TODO: implement props
  List<Object?> get props => [productList];
}

class NotSearchingState extends ProductSearchState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ErrorSearchProduct extends ProductSearchState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}