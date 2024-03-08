import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_ui/presentation/CartItem/view/CartItem.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.title),
      subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
      leading: Image.network(
        product.image,
        width: 50,
        height: 50,
      ),
      trailing: ElevatedButton(
        onPressed: () {
          context.read<CartModel>().addToCart(product);
        },
        child: Text('Add to Cart'),
      ),
    );
  }
}