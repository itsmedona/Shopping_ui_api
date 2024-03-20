import 'package:flutter/material.dart';
import 'package:shopping_ui/presentation/CartItem/view/CartItem.dart';

class CartModel extends ChangeNotifier {
  List<CartItem> items = [];

  void addItem(CartItem item) {
    items.add(item);
    notifyListeners();
  }

  void editItem(CartItem editedItem) {
    for (int i = 0; i < items.length; i++) {
      if (items[i].id == editedItem.id) {
        items[i] = editedItem;
        notifyListeners();
        break;
      }
    }
  }

  void addToCart(Product product) {
    var existingItem = items.firstWhere(
      (item) => item.product.id == product.id,
      orElse: () => CartItem(product: product),
    );

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
