import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_ui/presentation/CartItem/view/CartItem.dart';
import 'package:shopping_ui/presentation/ProductList/view/ProductList.dart';

void main() {
  runApp(const CartApp());
}

class CartApp extends StatelessWidget {
  const CartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shopping Cart',
        theme: ThemeData(primarySwatch: Colors.orange),
        home: ChangeNotifierProvider(
          create: (context) => CartModel(),
          child: ProductList(),
        ));
  }
}
