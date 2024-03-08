import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Product {
  final int id;
  final String title;
  final double price;
  final String image;

  Product({required this.id, required this.title, required this.price, required this.image});
}

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}

class CartModel extends ChangeNotifier {
  List<CartItem> items = [];

  void addToCart(Product product) {
    var existingItem = items.firstWhere((item) => item.product.id == product.id, 
    orElse: () => CartItem(product: product));
    if (existingItem.quantity == 0) {
      items.add(existingItem);
    }
    existingItem.quantity++;
    notifyListeners();
  }

  void removeFromCart(CartItem item) {
    item.quantity--;
    if (item.quantity == 0) {
      items.remove(item);
    }
    notifyListeners();
  }
}


class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;

  CartItemWidget({required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(cartItem.product.title),
      subtitle: Text('Quantity: ${cartItem.quantity}'),
      trailing: ElevatedButton(
        onPressed: () {
          context.read<CartModel>().removeFromCart(cartItem);
        },
        child: Text('Remove'),
      ),
    );
  }
}