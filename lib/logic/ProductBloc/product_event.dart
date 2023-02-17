import 'package:equatable/equatable.dart';
import 'package:qtec_test/data/Models/cart_item.dart';
import 'package:qtec_test/data/Models/result.dart';

abstract class ProductEvent extends Equatable {}

class InitialProductsEvent extends ProductEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SearchingProductEvent extends ProductEvent{

  final String query;

  SearchingProductEvent(this.query);

  @override
  // TODO: implement props
  List<Object?> get props => [query];

}

class SearchProductEvent extends ProductEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

// class SearchProductsEvent extends ProductEvent {
//   @override
//   // TODO: implement props
//   List<Object?> get props => [];
// }
//
// class AddProductEvent extends ProductEvent {
//
//   AddProductEvent(this.product);
//
//   final Result product;
//
//   @override
//   // TODO: implement props
//   List<Object?> get props => [product];
// }
//
// class RemoveProductEvent extends ProductEvent{
//
//   final Result product;
//
//   RemoveProductEvent(this.product);
//
//   @override
//   // TODO: implement props
//   List<Object?> get props => [product];
//
// }
//
// class BuyProductEvent extends ProductEvent{
//
//
//   final Result product;
//
//   BuyProductEvent(this.product);
//
//   @override
//   // TODO: implement props
//   List<Object?> get props => [product];
//
// }
//
// class ErrorProductsEvent extends ProductEvent {
//   @override
//   // TODO: implement props
//   List<Object?> get props => [];
// }