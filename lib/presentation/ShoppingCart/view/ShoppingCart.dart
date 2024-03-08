import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../CartItem/view/CartItem.dart';

class ShoppingCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: Consumer<CartModel>(
        builder: (context, cart, child) {
          return ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) {
              return CartItemWidget(cartItem: cart.items[index]);
            },
          );
        },
      ),
    );
  }
}
