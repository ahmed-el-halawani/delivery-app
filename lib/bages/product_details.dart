import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/models/models.dart';
import 'package:delivery_app/utils/utils.dart';
import 'package:delivery_app/widget/widgets.dart';

class ProductDetails extends StatefulWidget {
  final Product p;

  ProductDetails(this.p);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.backGroundColor,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [MyColors.backGroundColor, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [
                  .01,
                  .15,
                ])),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * .1),
            Hero(
                tag: widget.p.productName,
                child: Container(
                    height: MediaQuery.of(context).size.height * .4,
                    width: MediaQuery.of(context).size.width * .8,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(widget.p.productImage),
                            fit: BoxFit.contain)))),
            SizedBox(height: MediaQuery.of(context).size.height * .05),
            Text(
              widget.p.productName,
              style: TextStyle(
                  color: Color(0xFF575E67),
                  fontFamily: 'Varela',
                  fontSize: 24.0),
            ),
            Text("${widget.p.productPrice}",
                style: TextStyle(
                    color: Color(0xFFCC8053),
                    fontFamily: 'Varela',
                    fontSize: 24.0)),
            SizedBox(height: MediaQuery.of(context).size.height * .1),
            RaisedButton(
              onPressed: () {
                MyOrder.myOrder.addProduct(widget.p);
                Navigator.pop(context);
              },
              padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
              child: Text("Add to cart"),
            )
          ],
        ),
      ),
    );
  }
}
