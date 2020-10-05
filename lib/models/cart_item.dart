import 'package:delivery_app/models/models.dart';
import 'package:delivery_app/utils/utils.dart';
import 'package:delivery_app/widget/widgets.dart';

class CartItem {
  Product product;
  int productCount = 0;

  CartItem({this.product, this.productCount});
}
