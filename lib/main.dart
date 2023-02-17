import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qtec_test/data/apiRepository.dart';
import 'package:qtec_test/logic/CartBloc/cart_bloc.dart';

import 'logic/ProductBloc/product_bloc.dart';
import 'logic/ProductBloc/product_event.dart';
import 'logic/SearchCubit/search_cubit.dart';
import 'presentation/Screens/screens.dart';


void main() {

  runApp(App(apiRepository: ApiRepository(),));
}

class App extends StatelessWidget {
  final ApiRepository apiRepository;

  const App({super.key, required this.apiRepository});

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (_) => CartBloc(apiRepository: apiRepository
              )..add(CartStarted())
          ),
          BlocProvider(create: (_) => ProductsBloc(apiRepository: apiRepository
          )..add(InitialProductsEvent())
          ),
          BlocProvider(create: (_) => SearchCubit()),

        ],
        child: MaterialApp(
          theme: ThemeData(
              scaffoldBackgroundColor: const Color(0xfff7f2ff)
          ),
          home: const ProductSearchScreen(),
        )
    );
  }
}
