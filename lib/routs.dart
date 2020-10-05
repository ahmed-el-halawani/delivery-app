import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'bages/cart_screen.dart';
import 'bages/home.dart';
import 'bages/login_screen.dart';
import 'bages/new_category.dart';
import 'bages/new_product.dart';
import 'bages/register_screen.dart';
import 'main.dart';

class Router {
  static Route routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => SwitchScreen());
      case "/home":
        return MaterialPageRoute(builder: (context) => Home());
      case "/signIn":
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case "/signUp":
        return MaterialPageRoute(builder: (context) => RegisterScreen());
      case "/cart":
        return MaterialPageRoute(builder: (context) => CartScreen());
      case "/newProduct":
        return MaterialPageRoute(builder: (context) => NewProduct());
      case "/newCategory":
        return MaterialPageRoute(builder: (context) => NewCategory());
//      return MaterialPageRoute(
//          builder: (context)=>Home()
//      );case "/":
//      return MaterialPageRoute(
//          builder: (context)=>Home()
//      );

    }
  }
}
