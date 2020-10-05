import 'package:flutter/material.dart';
import 'package:delivery_app/models/models.dart';
import 'package:delivery_app/utils/utils.dart';
import 'package:delivery_app/widget/widgets.dart';

import '../widget/stores_list.dart';

class ShowStores extends StatefulWidget {
  String _catName;

  ShowStores(this._catName);

  @override
  _ShowStoresState createState() => _ShowStoresState();
}

class _ShowStoresState extends State<ShowStores> {
  int _index;

  Widget test(index) => Center(
        child: Container(
          child: Text(index),
        ),
      );

  @override
  void initState() {
    super.initState();
    _index = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: StoresList(
        searchResult: storesList(),
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  List<SearchResult> storesList() {
    List<SearchResult> searchResult = [];
    storesName.forEach((Stores store) {
      store.storeCategory.forEach((element) {
        if (element == widget._catName) {
          searchResult.add(SearchResult(store: store, product: []));
        }
      });
    });
    return searchResult;
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Color(0xffF0EBE6),
      currentIndex: _index,
      onTap: (index) {
        setState(() {
          _index = index;
        });
      },
      items: [
        BottomNavigationBarItem(
            title: Text("Menu"),
            icon: Icon(
              Icons.menu,
            )),
        BottomNavigationBarItem(title: Text("Home"), icon: Icon(Icons.home)),
        BottomNavigationBarItem(
            title: Text("Map"), icon: Icon(Icons.my_location)),
      ],
    );
  }
}
