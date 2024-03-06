// import 'dart:convert';

// import 'package:screening/Models/product_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class CartRepository {
//   List<Product> cartItems = [];
//   // Add a product to the cart and return the updated cart items list
//   List<Product> add(Product product) {
//     cartItems.add(product);
//     return cartItems;
//   }
//  Future<void> loadCartItems() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String cartItemsString = prefs.getString(cartKey) ?? '[]';
//     List<dynamic> cartItemsJson = jsonDecode(cartItemsString);
//     cartItems = cartItemsJson.map((item) => Product.fromJson(item)).toList();
//   }
//   // Remove a product from the cart by its index and return the updated cart items list
//   List<Product> removeAt(int index) {
//     if (index >= 0 && index < cartItems.length) {
//       cartItems.removeAt(index);
//     }
//     return cartItems;
//   }

//   // Remove a specific product from the cart and return the updated cart items list
//   List<Product> remove(Product product) {
//     cartItems.remove(product);
//     return cartItems;
//   }

//   int increaseQuantity(
//     int index,
//   ) {
//     if (index >= 0 && index < cartItems.length) {
//       cartItems[index].quantity += 1;
//       return cartItems[index].quantity;
//     }
//     return -1;
//   }

//   void decreaseQuantity(int index) {
//     if (index >= 0 && index < cartItems.length) {
//       if (cartItems[index].quantity > 1) {
//         cartItems[index].quantity -= 1;
//       } else {
//         cartItems.removeAt(index);
//       }
//     }
//   }

//   int get itemCount => cartItems.length;

//   double get totalPrice {
//     double total = 0.0;
//     for (var product in cartItems) {
//       total += double.parse(product.price);
//     }
//     return total;
//   }

//   List<Product> clear() {
//     cartItems.clear();
//     return cartItems;
//   }
// }
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:screening/Models/product_model.dart';

class CartRepository {
  List<Product> cartItems = [];

  static const String cartKey = 'cart_items';

  Future<List<Product>> loadCartItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String cartItemsString = prefs.getString(cartKey) ?? '[]';
    List<dynamic> cartItemsJson = jsonDecode(cartItemsString);
    cartItems = cartItemsJson.map((item) => Product.fromJson(item)).toList();
    return cartItems;
  }

  Future<void> saveCartItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String cartItemsString = jsonEncode(cartItems);
    prefs.setString(cartKey, cartItemsString);
  }

  Future<List<Product>> add(Product product) async {
    await loadCartItems();
    cartItems.add(product);
    await saveCartItems();

    return cartItems;
  }

  Future<List<Product>> removeAt(int index) async {
    await loadCartItems();
    if (index >= 0 && index < cartItems.length) {
      cartItems.removeAt(index);
      await saveCartItems();
    }
    return cartItems;
  }

  Future<List<Product>> remove(Product product) async {
    await loadCartItems();
    cartItems.remove(product);
    await saveCartItems();
    return cartItems;
  }

  Future<int> increaseQuantity(int index) async {
    await loadCartItems();
    if (index >= 0 && index < cartItems.length) {
      cartItems[index].quantity += 1;
      await saveCartItems();
      return cartItems[index].quantity;
    }
    return -1;
  }

  Future<int> decreaseQuantity(int index) async {
    await loadCartItems();
    if (index >= 0 && index < cartItems.length) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity -= 1;
      } else {
        cartItems.removeAt(index);
      }
      await saveCartItems();
      return cartItems[index].quantity;
    }
    return -1;
  }

  int get itemCount => cartItems.length;

  double get totalPrice {
    double total = 0.0;
    for (var product in cartItems) {
      total += double.parse(product.price) * product.quantity;
    }
    return total;
  }

  Future<void> clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(cartKey);
    cartItems.clear();
  }
}
