import 'package:delivery_app/bages/product_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/models/models.dart';
import 'package:delivery_app/utils/utils.dart';
import 'package:delivery_app/widget/widgets.dart';

import 'chick_out.dart';

class StoreScreen extends StatefulWidget {
  final Stores store;
  String searchKey;

  StoreScreen({this.store, this.searchKey = ""});

  @override
  _StoreScreenState createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation anim1;
  MyOrder order = MyOrder.myOrder;
  bool clicked = true;
  List<String> sections;
  int chipSelectedIndex = 0;
  String filterBy = "all";

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    anim1 = Tween(end: 0.0, begin: 10.0).animate(
        CurvedAnimation(curve: Curves.easeIn, parent: _animationController));
    sections = widget.store.storeSections;
  }

  getProductList() {
    if (widget.searchKey == "") {
      return widget.store.storeProduct;
    } else {
      List<Product> list = [];
      for (Product p in widget.store.storeProduct) {
        if (p.productName.contains(widget.searchKey.trim())) {
          list.add(p);
        }
      }
      return list;
    }
  }

  ListView _buildChips() {
    List<Widget> chipList = [];
    for (int i = 0; i < sections.length; i++) {
      print(i);
      String section = sections[i];
      chipList.add(Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          child: ChoiceChip(
            selected: chipSelectedIndex == i,
            label: Text(
              section.allCaps(),
              style: TextStyle(color: Colors.white),
            ),
            padding: EdgeInsets.symmetric(horizontal: 9),
            elevation: 2,
            pressElevation: 4,
            shadowColor: Colors.teal,
            backgroundColor: Colors.black54,
            selectedColor: Colors.blue,
            onSelected: (bool selected) {
              setState(() {
                chipSelectedIndex = i;
                filterBy = section;
                widget.searchKey = "";
              });
            },
          )));
    }
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: chipList.length,
      itemBuilder: (context, i) => chipList[i],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (MyOrder.myOrder.getTotalPrice() > 0 && clicked) {
      startAnimation();
      clicked = false;
    }
    if (MyOrder.myOrder.getTotalPrice() == 0 && !clicked) {
      endAnimation();
      clicked = true;
    }
    return WillPopScope(
      onWillPop: (MyOrder.myOrder.cartItemList.isNotEmpty)
          ? _onPackPressed
          : _notPackPressed,
      child: Scaffold(
        appBar: MyAppBar(
          t: TextEditingController(text: widget.searchKey),
          onChange: (string) {
            setState(() {
              chipSelectedIndex = 0;
              widget.searchKey = string;
            });
          },
          bottom: _filter(),
        ),
        body: Stack(
          children: [
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1),
              itemCount: _ProductList().length,
              itemBuilder: (context, int i) {
                return _buildCard(
                    _ProductList()[i],
                    MyOrder.myOrder.isProductInCart(_ProductList()[i]),
                    context);
              },
            ),
            Positioned(
              bottom: 0,
              child: Container(
                  margin: EdgeInsets.only(bottom: 20),
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  child: AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) => Transform(
                            transform: Matrix4.translationValues(
                                0.0, anim1.value * 10.0, 0.0),
                            child: RaisedButton(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 20),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40)),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ChickOut(),
                                ));
                              },
                              child: Text(
                                  "Total Price ${MyOrder.myOrder.getTotalPrice()} \$"),
                            ),
                          ))),
            )
          ],
        ),
      ),
    );
  }

  List<Product> _ProductList() {
    if (widget.searchKey.isNotEmpty) {
      return getProductList();
    }
    List<Product> pro = [];
    for (Product p in widget.store.storeProduct) {
      if (p.productSectionName.contains(filterBy.trim())) {
        print(p.productName);
        pro.add(p);
      }
    }
    return pro;
  }

  Widget _filter() {
    return Container(
      height: 40,
      child: _buildChips(),
    );
  }

  Widget _buildCard(Product p, bool added, context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
      child: InkWell(
        child: Container(
          padding: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3.0,
                    blurRadius: 5.0)
              ],
              color: Colors.white),
          child: Column(children: [
            Expanded(
              child: Stack(alignment: Alignment.center, children: [
                Column(
                  children: [
                    Expanded(
                      child: Hero(
                          tag: p.productName,
                          child: Container(
                              height: 100.0,
                              width: 100.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(p.productImage),
                                      fit: BoxFit.contain)))),
                    ),
                    SizedBox(height: 7.0),
                    Text("${p.productPrice}",
                        style: TextStyle(
                            color: Color(0xFFCC8053),
                            fontFamily: 'Varela',
                            fontSize: 14.0)),
                    Text(p.productName,
                        style: TextStyle(
                            color: Color(0xFF575E67),
                            fontFamily: 'Varela',
                            fontSize: 14.0)),
                  ],
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(15.0)),
                    onTap: () {
                      Navigator.of(context).push(PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 400),
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  ProductDetails(p),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            var tw = Tween(begin: 0.0, end: 1.0);
                            Animation<double> anim = animation.drive(tw);
                            var op = Opacity(
                              opacity: anim.value,
                              child: child,
                            );
                            return op;
                          }
//                          builder: (context)=>ProductDetails(p),
                          ));
                    },
                    child: Container(),
                  ),
                ),
              ]),
            ),
            Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(color: Color(0xFFEBEBEB), height: 1.0)),
            Padding(
              padding: EdgeInsets.only(left: 5.0, right: 5.0),
              child: (!added)
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          MyOrder.myOrder.addProduct(p);
                          startAnimation();
                        });
                      },
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.shopping_basket,
                                color: Color(0xFFD17E50), size: 20.0),
                            Text('Add to cart',
                                style: TextStyle(
                                    fontFamily: 'Varela',
                                    color: Color(0xFFD17E50),
                                    fontSize: 16.0))
                          ]),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                MyOrder.myOrder.removeProduct(p);
                                if (MyOrder.myOrder.getTotalPrice() == 0.0) {
                                  endAnimation();
                                }
                              });
                            },
                            child: Icon(Icons.remove_circle_outline,
                                color: Color(0xFFD17E50), size: 20.0),
                          ),
                          Text("${MyOrder.myOrder.getCartItem(p).productCount}",
                              style: TextStyle(
                                  fontFamily: 'Varela',
                                  color: Color(0xFFD17E50),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0)),
                          InkWell(
                            onTap: () {
                              setState(() {
                                MyOrder.myOrder.addProduct(p);
                              });
                            },
                            child: Icon(Icons.add_circle_outline,
                                color: Color(0xFFD17E50), size: 20.0),
                          ),
                        ]),
            ),
          ]),
        ),
      ),
    );
  }

  Future<bool> _notPackPressed() async {
    return true;
  }

  Future<bool> _onPackPressed() async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: MyColors.backGroundColor,
        title: Text(
            "if you leave now,you'll lose the products you've chosen. Are you sure you want to leave? "),
        actions: [
          FlatButton(
            child: Text(
              "no, stay".toUpperCase(),
              style: TextStyle(color: Colors.black87),
            ),
            onPressed: () => Navigator.of(context).pop(false),
          ),
          FlatButton(
            child: Text("yas, leave".toUpperCase(),
                style: TextStyle(color: Colors.black87)),
            onPressed: () {
              MyOrder.myOrder.removeOrder();
              _animationController.dispose();
              return Navigator.of(context).pop(true);
            },
          )
        ],
      ),
    );
  }

  startAnimation() {
    _animationController.forward();
  }

  endAnimation() {
    _animationController.reverse();
    clicked = true;
  }
}
