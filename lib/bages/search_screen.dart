import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/models/models.dart';
import 'package:delivery_app/utils/utils.dart';
import 'package:delivery_app/widget/widgets.dart';

import 'category_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<SearchResult> resultList = [];
  String searchKey = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        t: TextEditingController(text: searchKey),
        onChange: (string) {
          setState(() {
            resultList = searchProcess(string);
            searchKey = string;
          });
        },
      ),
      body: StoresList(
        searchResult: resultList,
        searchKey: searchKey,
      ),
    );
  }

  Widget listTileContainer(int i) {
    List<Widget> x = List.generate(resultList[i].product.length, (index) {
      SearchResult store = resultList[i];
      print(store.product);
      return Text(
        store.product[index].productName,
        style: TextStyle(color: Colors.black87),
      );
    });

    List<Widget> list = [
      Text(resultList[i].store.storeName),
    ];
    list.addAll(x);

    return Column(
      children: list,
    );
  }

  List<SearchResult> searchProcess(String searchKey) {
    List<SearchResult> resultList = [];
    for (Stores s in storesName) {
      bool res = false;
      SearchResult searchResult = SearchResult();
      searchResult.product = [];

      if (s.storeName.contains(searchKey.trim())) {
        res = true;
        searchResult.store = s;
      }
      for (Product p in s.storeProduct) {
        if (p.productName.contains(searchKey)) {
          res = true;
          searchResult.store = s;
          searchResult.product.add(p);
        }
      }
      if (res) resultList.add(searchResult);
      print(resultList);
    }
    return resultList;
  }
}
