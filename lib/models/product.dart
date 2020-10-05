import 'package:delivery_app/models/models.dart';
import 'package:delivery_app/utils/utils.dart';
import 'package:delivery_app/widget/widgets.dart';

class Product {
  String productName;
  String productImage;
  String productStore;
  List<String> productSectionName = ["all"];
  double productPrice;

  Product(
      {this.productName,
      productImage,
      productSectionName = "",
      this.productPrice = 0.0,
      this.productStore}) {
    this.productSectionName.add(productSectionName);
    this.productImage = (productImage != null)
        ? productImage
        : ProductImage.defaultProductImage;
//    this.productPrice = double.parse(productPrice);
  }

  factory Product.fromJson(json) => Product(
      productName: json["productName"],
      productImage: json["productImage"],
      productSectionName: json["productSectionName"],
      productPrice: json["productPrice"]);

  Map<String, dynamic> toMap() => {
        "productName": productName,
        "productImage": productImage,
        "productSectionName": productSectionName,
//    "productPrice":productPrice
      };
}

List<Product> productList = [
  Product(
      productName: "carot",
      productImage: ProductImage.carot,
      productPrice: 20.0,
      productSectionName: "vegetables",
      productStore: "carrefour"),
  Product(
      productName: "tomato",
      productImage: ProductImage.tomato,
      productPrice: 14.0,
      productSectionName: "vegetables",
      productStore: "carrefour"),
  Product(
      productName: "banana",
      productImage: ProductImage.banana,
      productPrice: 25.0,
      productSectionName: "fruits",
      productStore: "carrefour"),
  Product(
      productName: "mango",
      productImage: ProductImage.mango,
      productPrice: 30.0,
      productSectionName: "fruits",
      productStore: "carrefour"),
  Product(
      productName: "strawberry",
      productImage: ProductImage.mango,
      productPrice: 30.0,
      productSectionName: "fruits",
      productStore: "carrefour"),
  Product(
      productName: "watermelon",
      productImage: ProductImage.mango,
      productPrice: 30.0,
      productSectionName: "fruits",
      productStore: "carrefour"),
];

List<Product> carrfour = [
  Product(
      productName: "carot",
      productImage: ProductImage.carot,
      productPrice: 20.0,
      productSectionName: "vegetables",
      productStore: "carrefour"),
  Product(
      productName: "tomato",
      productImage: ProductImage.tomato,
      productPrice: 14.0,
      productSectionName: "vegetables",
      productStore: "carrefour"),
  Product(
      productName: "banana",
      productImage: ProductImage.banana,
      productPrice: 25.0,
      productSectionName: "fruits",
      productStore: "carrefour"),
  Product(
      productName: "mango",
      productImage: ProductImage.mango,
      productPrice: 30.0,
      productSectionName: "fruits",
      productStore: "carrefour"),
  Product(
      productName: "strawberry",
      productImage: ProductImage.mango,
      productPrice: 30.0,
      productSectionName: "fruits",
      productStore: "carrefour"),
  Product(
      productName: "watermelon",
      productImage: ProductImage.mango,
      productPrice: 30.0,
      productSectionName: "fruits",
      productStore: "carrefour"),
];
List<Product> l1 = [
  Product(
      productName: "carot",
      productImage: ProductImage.carot,
      productPrice: 20.0,
      productSectionName: "vegetables",
      productStore: "carrefour"),
  Product(
      productName: "tomato",
      productImage: ProductImage.tomato,
      productPrice: 14.0,
      productSectionName: "vegetables",
      productStore: "carrefour"),
  Product(
      productName: "banana",
      productImage: ProductImage.banana,
      productPrice: 25.0,
      productSectionName: "fruits",
      productStore: "carrefour"),
  Product(
      productName: "mango",
      productImage: ProductImage.mango,
      productPrice: 30.0,
      productSectionName: "fruits",
      productStore: "carrefour"),
];
List<Product> l2 = [
  Product(
      productName: "carot",
      productImage: ProductImage.carot,
      productPrice: 20.0,
      productSectionName: "vegetables",
      productStore: "carrefour"),
  Product(
      productName: "tomato",
      productImage: ProductImage.tomato,
      productPrice: 14.0,
      productSectionName: "vegetables",
      productStore: "carrefour"),
  Product(
      productName: "strawberry",
      productImage: ProductImage.mango,
      productPrice: 30.0,
      productSectionName: "fruits",
      productStore: "carrefour"),
  Product(
      productName: "watermelon",
      productImage: ProductImage.mango,
      productPrice: 30.0,
      productSectionName: "fruits",
      productStore: "carrefour"),
];
