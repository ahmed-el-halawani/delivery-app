import 'package:flutter/cupertino.dart';
import 'package:delivery_app/models/models.dart';
import 'package:delivery_app/utils/utils.dart';
import 'package:delivery_app/widget/widgets.dart';

class Stores {
  String storeName;
  String storeLocation;
  String storeLatLng;
  List<String> storeCategory = ["other"];
  String storeImage;
  String storeRate;
  List<Product> storeProduct = [];
  List<String> storeSections = ["all"];

  Stores({
    @required this.storeName,
    this.storeLocation,
    this.storeLatLng,
    this.storeImage,
    storeCategory,
    this.storeRate,
    storeProduct,
    storeSections,
  }) {
    if (storeCategory != null) this.storeCategory.addAll(storeCategory);
    if (storeSections != null) this.storeSections.addAll(storeSections);
    if (storeProduct != null) this.storeProduct.addAll(storeProduct);
  }
}

final List<Stores> storesName = [
  Stores(
      storeProduct: carrfour,
      storeName: "carrefour",
      storeLocation: "egypt",
      storeImage: StoreImageKey.carrefour,
      storeCategory: ["supermarket"],
      storeSections: ["vegetables", "fruits"]),
  Stores(
      storeProduct: l1,
      storeSections: ["vegetables", "fruits"],
      storeName: "Fast Food",
      storeLocation: "egypt",
      storeImage: StoreImageKey.food2,
      storeCategory: ["food"]),
  Stores(
    storeProduct: l2,
    storeName: "grogery",
    storeLocation: "egypt",
    storeImage: StoreImageKey.food3,
    storeCategory: ["supermarket", "snacks"],
  ),
  Stores(
    storeProduct: productList,
    storeName: "snacks",
    storeLocation: "egypt",
    storeImage: StoreImageKey.snacks1,
    storeCategory: ["snacks"],
  ),
  Stores(
    storeProduct: productList,
    storeName: "swaggy",
    storeLocation: "egypt",
    storeImage: StoreImageKey.snacks2,
    storeCategory: ["snacks"],
  ),
  Stores(
    storeName: "scronshy",
    storeLocation: "egypt",
    storeImage: StoreImageKey.snacks3,
    storeCategory: ["snacks"],
  ),
];
