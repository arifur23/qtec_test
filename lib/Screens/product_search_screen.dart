import 'package:flutter/material.dart';
import 'package:qtec_test/Constances/networking.dart';
import 'package:qtec_test/Screens/product_detail_screen1.dart';
import 'screens.dart';

class ProductSearchScreen extends StatefulWidget {
  const ProductSearchScreen({Key? key}) : super(key: key);

  @override
  State<ProductSearchScreen> createState() => _ProductSearchScreenState();
}

class _ProductSearchScreenState extends State<ProductSearchScreen> {

  Networking networking = Networking();

  bool showItemCounter = false;
  bool showOutOfStock = false;

  @override
  void initState() {
    networking.getProduct('rice');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextField(
                      decoration: InputDecoration(
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
                const SizedBox(height: 30,),
                GridView.count(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  // Create a grid with 2 columns. If you change the scrollDirection to
                  // horizontal, this produces 2 rows.
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  childAspectRatio: size.width/ (size.height - 180),
                  mainAxisSpacing: 15,
                  // Generate 100 widgets that display their index in the List.
                  children: List.generate(8, (index) {
                    return Container(
                      height: size.height * .35,
                      width: size.width * .5,
                      child: Stack(
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (_)=> ProductDetailScreen() ));
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
                                      child: Text('SomeData SomeData SomeData', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15,color: Colors.black.withOpacity(.7)),)
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children:  [
                                                Text('buy', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: Colors.black.withOpacity(.5)),),
                                                const SizedBox(width: 10,),
                                                const Text('\$ 20.00', style: TextStyle( fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xffda2079))),
                                              ],
                                            ),
                                            Row(
                                              children:  [
                                                Text('\$ 22.00', style: TextStyle(decoration: TextDecoration.lineThrough, fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black.withOpacity(.7)))
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 10,),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text('sell' , style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: Colors.black.withOpacity(.5))),
                                                const SizedBox(width: 10,),
                                                Text('\$ 20.00', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black.withOpacity(.7))),
                                              ],
                                            ),
                                            Row(
                                              children:  [
                                                Text('lav', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: Colors.black.withOpacity(.5))),
                                                const SizedBox(width: 5,),
                                                Text('\$ 22.00', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black.withOpacity(.7)))
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
                          Positioned(
                              bottom: 5,
                              left: 20,
                              child: Opacity(
                                opacity: showItemCounter ? 1 : 0,
                                child: Container(
                                  height: 50,
                                  width: 160,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffffcce4),
                                    borderRadius: BorderRadius.circular(30)
                                  ),
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: (){

                                        },
                                        child: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(100),
                                            color: const Color(0xffffbfdd),
                                          ),
                                          child: Center(
                                              child: Icon(Icons.remove,size: 25 , color: Colors.white.withOpacity(.9),)
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 20,),
                                      const Text('5 pices')
                                    ],
                                  ),
                                ),
                              )
                          ),
                          Positioned(
                            top: 6,
                              right: 6,
                              child: Opacity(
                                opacity: showOutOfStock ? 1 : 0,
                                child: Container(
                                  height: 30,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffffcccc),
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: const Center(child: Text('Out ')),
                                ),
                              )
                          ),

                          Positioned(
                            bottom: 10,
                            left: showItemCounter ? 138 : 80,
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  showItemCounter = !showItemCounter;
                                });
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: const Color(0xff6210e1)
                                ),
                                child: Center(
                                  child: Icon(Icons.add,size: 25 , color: Colors.white.withOpacity(.9),)
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}


// Container(
// height: size.height * .35,
// width: size.width * .33,
//
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(15),
// color: Colors.red,
// ),
// child: Column(
// children: [
// const SizedBox(height: 10,),
// Container(
// height: size.height * .15,
// width: size.width * .3,
// color: Colors.yellow,
// ),
// const SizedBox(height: 10,),
// Container(
// height: 50,
// width: size.width * .4,
// child: const Text('SomeData SomeData SomeData')
// ),
// Column(
// children: [
// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 8.0),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Row(
// children: const [
// Text('buy'),
// SizedBox(width: 20,),
// Text('\$ 20.00'),
// ],
// ),
// Row(
// children: const [
// Text('\$ 22.00')
// ],
// )
// ],
// ),
// ),
// const SizedBox(height: 15,),
// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 8.0),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Row(
// children: const [
// Text('buy'),
//
// Text('\$ 20.00'),
// ],
// ),
// Row(
// children: const [
// Text('\$ 22.00')
// ],
// )
// ],
// ),
// ),
// ],
// )
// ],
// ),
// ),