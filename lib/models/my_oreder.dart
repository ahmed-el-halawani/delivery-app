import 'package:delivery_app/models/models.dart';
import 'package:delivery_app/utils/utils.dart';
import 'package:delivery_app/widget/widgets.dart';

class MyOrder {
  MyOrder._();

  static MyOrder myOrder = MyOrder._();
  List<CartItem> cartItemList = [];
  DateTime checkOutDate;
  bool isCheckOut = false;
  bool isDeliver = false;

  getTotalPrice() {
    double totalPrice = 0.0;
    cartItemList.forEach((element) {
      totalPrice += element.product.productPrice * element.productCount;
    });
    return totalPrice;
  }

  addProduct(Product p) {
    if (isProductInCart(p)) {
      var cartItem = getCartItem(p);
      cartItem.productCount += 1;
    } else {
      print("added for first time");
      cartItemList.add(CartItem(product: p, productCount: 1));
    }
  }

  removeProduct(Product p) {
    if (isProductInCart(p)) {
      for (CartItem element in getCartItems()) {
        if (element.product.productName == p.productName) {
          if (element.productCount > 1) {
            element.productCount -= 1;
          } else {
            cartItemList.remove(element);
            break;
          }
        }
        ;
      }
      ;
    } else {
      print("notHere");
    }
  }

  CartItem getCartItem(Product p) {
    for (CartItem c in getCartItems()) {
      if (c.product.productName == p.productName) {
        return c;
      }
    }
    return null;
  }

  List<CartItem> getCartItems() {
    return cartItemList;
  }

  bool isProductInCart(Product p) {
    for (CartItem c in getCartItems()) {
      if (c.product.productName == p.productName) {
        return true;
      }
    }
    return false;
  }

  removeOrder() {
    cartItemList.clear();
    checkOutDate = null;
    isCheckOut = false;
    isDeliver = false;
  }
}
