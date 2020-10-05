import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/models/models.dart';
import 'package:delivery_app/utils/utils.dart';
import 'package:delivery_app/widget/widgets.dart';

class NewProduct extends StatefulWidget {
  @override
  _CreateCategoryScreenState createState() => _CreateCategoryScreenState();
}

class _CreateCategoryScreenState extends State<NewProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          RoundedInputField(
            hintText: "enter product name",
            icon: Icons.widgets,
          )
        ],
      ),
    );
  }
}
