import 'package:flutter/material.dart';
import 'package:delivery_app/models/models.dart';
import 'package:delivery_app/utils/utils.dart';
import 'package:delivery_app/widget/widgets.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  PageController _mController = PageController();
  int _index = 0;

  Widget test(index) => Center(
        child: Container(
          child: Text(index.toString()),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Center(
          child: PageView(
        controller: _mController,
        onPageChanged: (index) {
          setState(() {
            _index = index;
          });
        },
        children: [
          test(1),
          test(2),
          test(3),
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xffF0EBE6),
        currentIndex: _index,
        onTap: (index) {
          setState(() {
            _mController.animateToPage(index,
                duration: Duration(milliseconds: 300), curve: Curves.linear);
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
      ),
    );
  }
}
