import 'package:delivery_app/models/models.dart';
import 'package:delivery_app/utils/utils.dart';
import 'package:delivery_app/widget/widgets.dart';

class SearchResult {
  Stores store;
  List<Product> product;

  SearchResult({this.store, this.product = const []});
}
