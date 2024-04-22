import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../global_widgets/HomeScreenWidgets.dart';
import '../../../Model/myModel.dart';
import '../../FavoritesScreen/view/FavoritesScreen.dart';
import '../../MyScreen/controller/MyScreenController.dart';
import '../../ProductScreen/view/ProductScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SampleApi sampleApiobj = SampleApi();
  @override
  void initState() {
    fetchdata();
    super.initState();
  }

  Future<void> fetchdata() async {
    await Provider.of<MyScreenController>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final MyControllerobj = Provider.of<MyScreenController>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FavouriteScreen(),
                      ));
                },
                icon: Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 30,
                )),
            IconButton(
                ///////////GOES TO cart
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyCart(
                          image: "",
                          price: "".toString(),
                          title: "",
                        ),
                      ));
                },
                icon: Icon(
                  Icons.shopping_cart,
                  size: 30,
                  color: Colors.blue,
                ))
          ],
          title: Text(
            "Lets shop",
            style: TextStyle(
                fontWeight: FontWeight.w800, color: Colors.blue),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
              itemCount: MyControllerobj.sampleApiobj.products?.length,
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 270,
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 5,
              ),
              itemBuilder: (context, index) => HomeScreenWidget(
                    //CART TITLE IS FOR THE CARTPAGE
                    Carttitle:
                        MyControllerobj.sampleApiobj.products?[index].title ??
                            "",
                    Cartprice: MyControllerobj
                            .sampleApiobj.products?[index].price
                            .toString() ??
                        "",
                    Cartimage: MyControllerobj
                            .sampleApiobj.products?[index].thumbnail ??
                        "",
                    productName:
                        MyControllerobj.sampleApiobj.products?[index].title ??
                            "",
                    company:
                        MyControllerobj.sampleApiobj.products?[index].brand ??
                            "",
                    image: MyControllerobj
                            .sampleApiobj.products?[index].thumbnail ??
                        "",
                    price: MyControllerobj.sampleApiobj.products?[index].price
                            .toString() ??
                        "",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductScreen(
                              rating: MyControllerobj
                                      .sampleApiobj.products?[index].rating
                                      .toString() ??
                                  "",
                              title: MyControllerobj
                                      .sampleApiobj.products?[index].title ??
                                  "",
                              price: MyControllerobj
                                      .sampleApiobj.products?[index].price
                                      .toString() ??
                                  "",
                              brand: MyControllerobj
                                      .sampleApiobj.products?[index].brand ??
                                  "",
                              description: MyControllerobj.sampleApiobj
                                      .products?[index].description ??
                                  "",
                              image: MyControllerobj.sampleApiobj
                                      .products?[index].thumbnail ??
                                  "",
                            ),
                          ));
                    },
                  )),
        ),
      ),
    );
  }
}
