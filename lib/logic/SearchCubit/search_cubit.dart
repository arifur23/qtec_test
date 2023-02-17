import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qtec_test/data/apiRepository.dart';
import 'package:qtec_test/logic/SearchCubit/search_state.dart';

class SearchCubit extends Cubit<ProductSearchState>{
  SearchCubit() : super(NotSearchingState());

  ApiRepository apiRepository = ApiRepository();

  void fetchProduct(String? query)async{
    if(query != null){
      final productList = await apiRepository.getProduct(query);
      emit(SearchProductLoadedState(productList: productList));
    }
    if(query == null){
      emit(NotSearchingState());
    }
    else{
      emit(ErrorSearchProduct());
    }
  }

}