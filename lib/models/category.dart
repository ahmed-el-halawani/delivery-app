import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/models/models.dart';
import 'package:delivery_app/utils/utils.dart';
import 'package:delivery_app/widget/widgets.dart';

class Category {
  String catId;
  String catName;
  String catIcon;
  List<Category> containedCatsList;

  Category(
      {this.catId,
      this.catName,
      this.catIcon,
      this.containedCatsList,
      catsMap});

  factory Category.fromJson(QueryDocumentSnapshot json) => Category(
        catName: json.get("catName"),
        catIcon: json.get("catIcon") ?? ImageKey.deffultUserImage,
      );

  Map<String, dynamic> toMap(String id) =>
      {"catName": catName, "catIcon": catIcon, "catId": id};
}

final List<Category> cats = [
  Category(
    catName: "other",
    catIcon: ImageKey.other,
    containedCatsList: [
      Category(
        catName: "supermarket",
        catIcon: ImageKey.market,
      ),
      Category(
        catName: "food",
        catIcon: ImageKey.food,
      ),
      Category(
        catName: "snacks",
        catIcon: ImageKey.snacks,
      ),
      Category(
        catName: "gifts",
        catIcon: ImageKey.gifs,
      ),
      Category(
        catName: "pharmacy",
        catIcon: ImageKey.pharmacy,
      ),
    ],
  ),
  Category(
    catName: "supermarket",
    catIcon: ImageKey.market,
  ),
  Category(
    catName: "food",
    catIcon: ImageKey.food,
  ),
  Category(
    catName: "snacks",
    catIcon: ImageKey.snacks,
  ),
  Category(
    catName: "gifts",
    catIcon: ImageKey.gifs,
  ),
  Category(
    catName: "pharmacy",
    catIcon: ImageKey.pharmacy,
  ),
];
