import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qtec_test/data/apiRepository.dart';
import 'package:qtec_test/logic/ProductBloc/product_event.dart';
import 'package:qtec_test/logic/ProductBloc/product_state.dart';

import '../../data/Models/product_list.dart';
import '../../data/Models/result.dart';



class ProductsBloc extends Bloc<ProductEvent, ProductState> {

  final ApiRepository apiRepository;


  bool showCart = false;
  bool showManageProduct = false;

  ProductsBloc({required this.apiRepository}) : super(ProductLoadingState()){

    on<InitialProductsEvent>(_onLoadingProduct);
    on<SearchingProductEvent>(_onSearchingProduct);
  }

  Future<void> _onSearchingProduct(SearchingProductEvent event, Emitter<ProductState> emit) async{
    emit(ProductLoadingState());
    final String query;
    try{
      final productList = await apiRepository.getProduct('rice') as ProductList;
      print(productList.data.products.results.length.toString());
      emit(ProductLoadedState(productList: productList));
    }catch(e){
      emit(ProductLoadingErrorState());
    }
  }

  Future<void> _onLoadingProduct( InitialProductsEvent event, Emitter<ProductState> emit ) async{
    emit(ProductLoadingState());
    try{
      final productList = await apiRepository.getProduct('rice') as ProductList;
      print(productList.data.products.results.length.toString());
      emit(ProductLoadedState(productList: productList));
    }catch(e){
      print(e.toString());
      emit(ProductLoadingErrorState());
    }
  }

}