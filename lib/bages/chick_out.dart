import 'package:delivery_app/models/cart_item.dart';
import 'package:delivery_app/models/my_oreder.dart';
import 'package:delivery_app/utils/my_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChickOut extends StatefulWidget {
  @override
  _ChickOutState createState() => _ChickOutState();
}

class _ChickOutState extends State<ChickOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Chick out", style: TextStyle(color: Colors.black87)),
        backgroundColor: MyColors.backGroundColor,
      ),
      body: ListView(
        children: [
          listOfItems(),
          deliveryAddress1(),
        ],
      ),
    );
  }

  listOfItems() {
    return Column(
      children: List.generate(MyOrder.myOrder.getCartItems().length,
          (index) => itemsTile(MyOrder.myOrder.getCartItems()[index])),
    );
  }

  itemsTile(CartItem c) {
    return Dismissible(
      key: Key(c.product.productName),
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 20, right: 20),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(c.product.productImage))),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              c.product.productName,
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              "${c.product.productPrice} \$",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    MyOrder.myOrder.removeProduct(c.product);
                                    if (MyOrder.myOrder.cartItemList.length ==
                                        0) Navigator.pop(context);
                                  });
                                },
                                child: Icon(Icons.remove_circle_outline,
                                    color: Color(0xFFD17E50), size: 25.0),
                              ),
                              Text("x${c.productCount}",
                                  style: TextStyle(
                                      fontFamily: 'Varela',
                                      color: Color(0xFFD17E50),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0)),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    MyOrder.myOrder.addProduct(c.product);
                                  });
                                },
                                child: Icon(Icons.add_circle_outline,
                                    color: Color(0xFFD17E50), size: 25.0),
                              ),
                            ]),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              height: 1,
              color: Colors.black12,
            )
          ],
        ),
      ),
      onDismissed: (DismissDirection d) {
        setState(() {
          MyOrder.myOrder.cartItemList.remove(c);
          if (MyOrder.myOrder.cartItemList.length == 0) Navigator.pop(context);
        });
      },
      background: Container(
        color: Colors.red,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.restore_from_trash,
                size: 40,
              ),
              Icon(
                Icons.restore_from_trash,
                size: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }

  deliveryAddress1() {
    return chickOutTile(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: [
            Icon(
              Icons.outlined_flag,
              size: 40,
              color: Colors.black87,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "No location",
                  style: TextStyle(fontSize: 20),
                ),
                Text("No address details set"),
              ],
            ),
          ],
        ),
        Icon(Icons.arrow_forward_ios, color: Colors.black87),
      ],
    ));
  }

  chickOutTile({Widget child}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
          ),
          Text(
            "Delivery address".toUpperCase(),
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.black12, fontSize: 20),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 1,
            color: Colors.black12,
          ),
          child,
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 1,
            color: Colors.black12,
          ),
        ],
      ),
    );
  }
}
