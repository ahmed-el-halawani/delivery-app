import 'package:delivery_app/bages/show_stores.dart';
import 'package:delivery_app/models/category.dart';
import 'package:delivery_app/models/stores.dart';
import 'package:delivery_app/widget/my_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  List<Category> catsList;

  CategoryScreen(this.catsList);

  final List<int> catColors = [0xff808dde, 0xffd46960, 0xffe6bf73, 0xff68b5b0];
  int _catColorIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: categoryList(),
    );
  }

  Widget categoryList() {
    return Container(
      child: ListView.builder(
          itemCount: catsList.length,
          itemBuilder: (context, i) {
            _catColorIndex = (_catColorIndex < catColors.length - 1)
                ? _catColorIndex + 1
                : 0;
            return roundedCard(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (c) => (catsList[i].containedCatsList != null)
                        ? CategoryScreen(catsList[i].containedCatsList)
                        : ShowStores(catsList[i].catName),
                  ),
                );
              },
              color: Color(catColors[_catColorIndex]),
              category: catsList[i],
            );
          }),
    );
  }

  Card roundedCard(
      {@required Category category,
      Function onTap,
      Color color = Colors.white}) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: () {
          if (onTap != null) onTap();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(
              category.catName,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            trailing: (category.containedCatsList != null)
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(getCatItemsLength(category.catName)),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  )
                : Text(getCatItemsLength(category.catName)),
            leading: Image.asset(category.catIcon),
          ),
        ),
      ),
    );
  }

  String getCatItemsLength(catName) {
    int catLength = 0;
    storesName.forEach((element) {
      if (element.storeCategory.contains(catName)) {
        catLength += 1;
      }
    });
    return "$catLength";
  }
}
