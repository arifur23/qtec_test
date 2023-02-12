import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:polygon_clipper/polygon_border.dart';
import 'package:polygon_clipper/polygon_clipper.dart';
import 'package:qtec_test/main.dart';

import '../Constances/constances.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

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
                Container(
                    height: size.height * .34,
                    width: size.width ,
                    decoration: const BoxDecoration(
                        color: Colors.green
                    ),
                    child: const Center(child: Text('dfjj'))
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
                      Text('Brand : Pringels', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black.withOpacity(.8)),),
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
                      Text('Distributor : Md Mobbarokk hos', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black.withOpacity(.8))),
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
                            Text('Buing Price', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black.withOpacity(.8))),
                            Text('\$220', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black.withOpacity(.8))),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Buing Price', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black.withOpacity(.8))),
                            Text('\$250', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black.withOpacity(.8))),
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
                            Text('Buing Price', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black.withOpacity(.8))),
                            Text('Buing Price', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black.withOpacity(.8))),
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
            ),
          ),
          Positioned(
            bottom: 100,
            left: (size.width / 2)- 55,
            child: GestureDetector(
              onTap: (){
                setState(() {
                  showCartButton = !showCartButton;
                });
              },
              child: Container(
                height: 100,
                width: 100,
                child: ClipPolygon(
                  child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xff580edb)
                      ),
                      child: Center(
                        child: Container(
                          child: Center(
                              child: showCartButton ? Text('Buy it', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white.withOpacity(.8)),)
                            : Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Column(
                                  children: [
                                    Icon(Icons.add_shopping_cart, size: 25, color: Colors.white.withOpacity(.8),),
                                    const SizedBox(height: 5,),
                                    Text('Cart', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white.withOpacity(.8)),)
                                  ],
                                ),
                            )
                          ),
                        )
                      )
                  ),
                  boxShadows: [
                    PolygonBoxShadow(color: Colors.black, elevation: 01.0),
                  ],
                  sides: 6,
                  borderRadius: 5.0,
                ),
              ),
            )
          ),
          Positioned(
              bottom: 170,
              left: (size.width / 2) + 15,
              child: Opacity(
                opacity: showCartButton ? 0 : 1,
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
      ),
    );
  }
}

