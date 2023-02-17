import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pagination/flutter_pagination.dart';
import 'package:flutter_pagination/widgets/button_styles.dart';
import 'package:qtec_test/data/Models/cart_item.dart';
import 'package:qtec_test/data/apiRepository.dart';
import 'package:qtec_test/logic/CartBloc/cart_bloc.dart';
import 'package:qtec_test/logic/ProductBloc/product_bloc.dart';
import 'package:qtec_test/logic/ProductBloc/product_state.dart';
import '../../logic/ProductBloc/product_event.dart';
import 'screens.dart';

class ProductSearchScreen extends StatefulWidget {
  const ProductSearchScreen({Key? key}) : super(key: key);

  @override
  State<ProductSearchScreen> createState() => _ProductSearchScreenState();
}

class _ProductSearchScreenState extends State<ProductSearchScreen> {

  ApiRepository networking = ApiRepository();
  late TextEditingController controller;

  bool showItemCounter = false;
  bool showOutOfStock = false;

  int currentPage = 1;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
            child: Column(
              children: [
                const SizedBox(height: 10,),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextField(
                      controller: controller,
                      onSubmitted: (text) {
                        context.read<ProductsBloc>().add(
                            SearchingProductEvent('rice'));
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: Align(
                          widthFactor: 1.0,
                          heightFactor: 1.0,
                          child: GestureDetector(
                            onTap: () {
                              context.read<ProductsBloc>()
                                  .add(SearchingProductEvent(controller.text));
                            },
                            child: const Icon(
                              Icons.search,
                              size: 35,
                            ),
                          ),
                        ),
                      ),

                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                BlocBuilder<ProductsBloc, ProductState>(
                    builder: (context, state) {
                      if (state is ProductLoadingState) {
                        return Container(
                            height: size.height - 300,
                            width: size.width - 50,
                            child: const Center(
                                child: CircularProgressIndicator()));
                      }
                      if (state is ProductLoadedState) {
                        return ProductsGrid(size, state, context);
                      }
                      if(state is ProductLoadingErrorState)
                      {
                        return Container(
                            height: size.height,
                            width: size.width - 100,
                            child: const Center(child: Text('Somethings Wrong')));
                      }
                      return Container(
                          height: size.height,
                          width: size.width - 100,
                          child: const Center(child: Text('')));
                    }
                ),

                const SizedBox(height: 30,),
                Pagination(
                  paginateButtonStyles: PaginateButtonStyles(),
                  prevButtonStyles: PaginateSkipButton(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20))),
                  nextButtonStyles: PaginateSkipButton(
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  onPageChange: (number) {
                    setState(() {
                      currentPage = number;
                    });
                  },
                  useGroup: false,
                  totalPage: 100,
                  show: 2,
                  currentPage: currentPage,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  GridView ProductsGrid(Size size, ProductLoadedState state, BuildContext context) {
    return GridView.count(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      scrollDirection: Axis.vertical,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      childAspectRatio: size.width / (size.height - 200),
      children: List.generate(state.productList.data
          .products.results.length, (index) {
        var products = state.productList.data.products
            .results;
        return Container(
          height: size.height * .35,
          width: size.width * .5,
          child: Stack(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (
                          _) => const ProductDetailScreen()));
                },
                child: Container(
                  height: (size.height * .35) - 25,
                  width: (size.width * .5),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 30,),
                      Container(
                        height: size.height * .14,
                        width: size.width * .25,
                        color: Colors.yellow,
                      ),
                      const SizedBox(height: 20,),
                      Container(
                          height: 50,
                          width: size.width * .4,
                          child: Text(
                              products[index].productName,
                              style: TextStyle(
                                  fontWeight: FontWeight
                                      .bold,
                                  fontSize: 25,
                                  color: Colors.black
                                      .withOpacity(.8)))
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets
                                .symmetric(horizontal: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text('buy',
                                      style: TextStyle(
                                          fontWeight: FontWeight
                                              .w400,
                                          fontSize: 12,
                                          color: Colors
                                              .black
                                              .withOpacity(
                                              .5)),),
                                    const SizedBox(
                                      width: 10,),
                                    const Text('\$ 20.00',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Color(0xffda2079)
                                        )
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('\$ 22.00',
                                        style: TextStyle(
                                            decoration: TextDecoration.lineThrough,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Colors.black.withOpacity(.7))
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets
                                .symmetric(horizontal: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text('sell',
                                        style: TextStyle(
                                            fontWeight: FontWeight
                                                .w400,
                                            fontSize: 12,
                                            color: Colors
                                                .black
                                                .withOpacity(
                                                .5))),
                                    const SizedBox(
                                      width: 10,),
                                    Text('\$ 20.00',
                                        style: TextStyle(
                                            fontWeight: FontWeight
                                                .bold,
                                            fontSize: 15,
                                            color: Colors
                                                .black
                                                .withOpacity(
                                                .7))),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('lav',
                                        style: TextStyle(
                                            fontWeight: FontWeight
                                                .w400,
                                            fontSize: 12,
                                            color: Colors
                                                .black
                                                .withOpacity(
                                                .5))),
                                    const SizedBox(
                                      width: 5,),
                                    Text('\$ 22.00',
                                        style: TextStyle(
                                            fontWeight: FontWeight
                                                .bold,
                                            fontSize: 15,
                                            color: Colors
                                                .black
                                                .withOpacity(
                                                .7)))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),

              BlocBuilder<CartBloc, CartState>(
                  builder: (context, state){
                    if(state is CartLoaded){
                      final isProductInCart = state.cart.items.contains(CartItem(product: products[index], quantity: 1));
                      if(isProductInCart ){
                        return Positioned(
                            bottom: 5,
                            left: 20,
                            child: Opacity(
                              opacity: 1,
                              child: Container(
                                height: 50,
                                width: 160,
                                decoration: BoxDecoration(
                                    color: const Color(0xffffcce4),
                                    borderRadius: BorderRadius
                                        .circular(30)
                                ),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {

                                      },
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius
                                              .circular(100),
                                          color: const Color(
                                              0xffffbfdd),
                                        ),
                                        child: Center(
                                            child: Icon(
                                              Icons.remove, size: 25,
                                              color: Colors.white
                                                  .withOpacity(.9),)
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 20,),
                                    const Text('5 pices'),
                                    const SizedBox(width: 12,),
                                    GestureDetector(
                                      onTap: (){

                                      },
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                100),
                                            color: const Color(0xff6210e1)
                                        ),
                                        child: Center(
                                            child: Icon(Icons.add, size: 25,
                                              color: Colors.white.withOpacity(
                                                  .9),)
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                        );
                      }
                      else{
                        return Positioned(
                          bottom: 10,
                          left: 80,
                          child: GestureDetector(
                            onTap: (){

                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      100),
                                  color: const Color(0xff6210e1)
                              ),
                              child: Center(
                                  child: Icon(Icons.add, size: 25,
                                    color: Colors.white.withOpacity(
                                        .9),)
                              ),
                            ),
                          ),
                        );
                      }
                    }
                    if(state is CartLoading){
                      return Positioned(
                          bottom: 10,
                          left: 80,
                          child: Text('jjkk')
                      );
                    }
                    return Text('data');
                  }
              ),

              Positioned(
                  top: 6,
                  right: 6,
                  child: BlocBuilder<ProductsBloc, ProductState>(
                    builder: (context, state){
                      return Opacity(
                        opacity:  products[index].stock > 0 ? 0 : 1,
                        child: Container(
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                              color: const Color(0xffffcccc),
                              borderRadius: BorderRadius
                                  .circular(10)
                          ),
                          child: const Center(
                              child: Text('Out ')),
                        ),
                      );
                    },
                  )
              ),

            ],
          ),
        );
      }
      ),
    );
  }

}