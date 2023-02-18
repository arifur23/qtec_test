import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polygon_clipper/polygon_clipper.dart';
import 'package:qtec_test/data/Models/cart_item.dart';
import 'package:qtec_test/data/Models/result.dart';
import 'package:qtec_test/logic/CartBloc/cart_bloc.dart';

import '../../logic/SearchCubit/search_cubit.dart';
import '../../logic/SearchCubit/search_state.dart';

class ProductDetailScreen extends StatefulWidget {
  final Result product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {

  bool showCartButton = false;

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
            child: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 25,)
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: Text('Product Details', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black.withOpacity(.8)),),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search your desire product",
                          border: InputBorder.none,
                          suffixIcon: Align(
                            widthFactor: 1.0,
                            heightFactor: 1.0,
                            child: Icon(
                              Icons.search,
                              size: 35,
                            ),
                          ),
                        ),

                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                BlocBuilder<SearchCubit, ProductSearchState>(
                    builder: (context,state){
                      if(state is NotSearchingState){
                        return Column(
                          children: [
                            Container(
                                height: size.height * .34,
                                width: size.width ,
                                decoration: const BoxDecoration(
                                    color: Colors.green
                                ),
                                child: Image.network(widget.product.image, fit: BoxFit.cover,)
                            ),
                            const SizedBox(height: 20,),
                            Container(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                height: 50,
                                child:  Text('Some Title will be placed here', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black.withOpacity(.8)),)
                            ),
                            const SizedBox(height: 20,),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                children: [
                                  Text('Brand : ${widget.product.brand.name.name}', style: TextStyle(overflow: TextOverflow.ellipsis, fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black.withOpacity(.8)),),
                                  const SizedBox(width: 15,),
                                  Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(100)
                                    ),
                                  ),
                                  const SizedBox(width: 15,),
                                  Text('Distributor : Md Mobbarokk hos', style: TextStyle( overflow: TextOverflow.ellipsis, fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black.withOpacity(.8))),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20,),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              height: 150,
                              width: size.width - 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Buying Price', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black.withOpacity(.8))),
                                        Text('\$${widget.product.charge.currentCharge}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black.withOpacity(.8))),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Selling Price', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black.withOpacity(.8))),
                                        Text('\$${widget.product.charge.sellingPrice}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black.withOpacity(.8))),
                                      ],
                                    ),
                                    Container(
                                        width: size.width - 30,
                                        height: 1,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: List.generate(30, (index) {
                                            return Container(
                                              height: 1,
                                              width:  7,
                                              color: Colors.black.withOpacity(.6 ),
                                            );
                                          }),
                                        )
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Profit', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black.withOpacity(.8))),
                                        Text('\$${widget.product.charge.profit}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black.withOpacity(.8))),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 30,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Text('Details', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black.withOpacity(.8))),
                            ),
                            const SizedBox(height: 10,),
                            Container(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                height: 100,
                                width: size.width - 30,
                                child: Text("data dfjkjsjkf ljkfdskfkljdjk eklfjsdjfsadlkfjk jdfkjsdalkf"
                                    "dfsdjfkjdsfkdskfjklkjf djfkljsadkjfjads jdfdkfkd lkjdfjksdklfld"
                                    "data dfjkjsjkf ljkfdskfkljdjk eklfjsdjfsadlkfjk jdfkjsdalkf"
                                    "dfsdjfkjdsfkdskfjklkjf djfkljsadkjfjads jdfdkfkd lkjdfjksdklfld", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black.withOpacity(.8)))
                            ),
                          ],
                        );
                      }
                      if(state is SearchProductLoadedState){
                        return const Text('data Loaded');
                      }

                  return const Text('data');
                })
              ],
            ),
          ),

          BlocBuilder<CartBloc, CartState>(
              builder: (context, state){
                if(state is CartLoaded){
                  final isProductInCart = state.cart.items.contains(CartItem(product: widget.product, quantity: 1));
                  if(isProductInCart){
                    return Positioned(
                        bottom: 220,
                        left: 155,
                        child: Container(
                          height: 40,
                          width: 120,
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
                                  height: 30,
                                  width: 30,
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
                              const SizedBox(width: 5,),
                              const Text('5 pices'),
                              const SizedBox(width: 5,),
                              GestureDetector(
                                onTap: (){

                                },
                                child: Container(
                                  height: 30,
                                  width: 30,
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
                        )
                    );
                  }
                }
                return const Text('');
              }
          ),

          BlocBuilder<CartBloc, CartState>(
              builder: (context, state){
                if(state is CartLoaded){
                  final isProductInCart = state.cart.items.contains(CartItem(product: widget.product, quantity: 1));
                  if(!isProductInCart){
                    return Positioned(
                        bottom: 95,
                        left: (size.width / 2)- 60,
                        child: Container(
                            height: 120,
                            width: 120,
                            color: Colors.transparent,
                            child: Stack(
                              children: [
                                Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      context.read<CartBloc>().add(CartRequestForShowPanel(item: CartItem(product:widget.product, quantity: 1)));
                                    },
                                    child: Container(
                                      height: 100,
                                      width: 100,
                                      child: ClipPolygon(
                                        boxShadows: [
                                          PolygonBoxShadow(color: Colors.black, elevation: 01.0),
                                        ],
                                        sides: 6,
                                        borderRadius: 5.0,
                                        child: Container(
                                            decoration: const BoxDecoration(
                                                color: Color(0xff580edb)
                                            ),
                                            child: Center(
                                                child: Text('Buy it', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white.withOpacity(.8)))
                                            )
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                        )
                    );
                  }
                }
                if(state is CartLoaded){
                  final isProductInCart = state.cart.items.contains(CartItem(product: widget.product, quantity: 1));
                  if(isProductInCart){
                    return Positioned(
                        bottom: 95,
                        left: (size.width / 2)- 60,
                        child: Container(
                            height: 120,
                            width: 120,
                            color: Colors.transparent,
                            child: Stack(
                              children: [
                                Center(
                                  child: GestureDetector(
                                    onTap: (){

                                    },
                                    child: Container(
                                      height: 100,
                                      width: 100,
                                      child: ClipPolygon(
                                        boxShadows: [
                                          PolygonBoxShadow(color: Colors.black, elevation: 01.0),
                                        ],
                                        sides: 6,
                                        borderRadius: 5.0,
                                        child: Container(
                                            decoration: const BoxDecoration(
                                                color: Color(0xff580edb)
                                            ),
                                            child: Center(
                                                child: Column(
                                                  children: [
                                                    const SizedBox(height: 20,),
                                                    const Icon(Icons.add_shopping_cart, size: 20, color: Colors.white,),
                                                    const SizedBox(height: 5,),
                                                    Text('Cart', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white.withOpacity(.8))),
                                                  ],
                                                )
                                            )
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                    top: 15,
                                    left: 80,
                                    child: Opacity(
                                      opacity:  1,
                                      child: Container(
                                        height: 25,
                                        width: 25,
                                        decoration: BoxDecoration(
                                            color: const Color(0xffffcce4),
                                            borderRadius: BorderRadius.circular(100),
                                            border: Border.all(color: Colors.white, width: 2)
                                        ),
                                        child: const Center(
                                          child: Text('5'),
                                        ),
                                      ),
                                    )
                                )
                              ],
                            )
                        )
                    );
                  }

                }
                return const Text('daddta');
              }
          ),
        ],
      ),
    );
  }
}

