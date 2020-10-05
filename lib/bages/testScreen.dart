import 'dart:io';
import 'package:delivery_app/controller/image_picker.dart';
import 'package:delivery_app/repository/firebase_db_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:delivery_app/models/models.dart';
import 'package:delivery_app/utils/utils.dart';
import 'package:delivery_app/widget/widgets.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  File image;
  ImagePicker2 iPic;

  @override
  Widget build(BuildContext context) {
    final fbdb = FirebaseDatabaseRepo.fDB;
    iPic = Provider.of<ImagePicker2>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
            onPressed: () {
              fbdb.createCat(Category(catName: "ahmed"));
            },
            child: Text("create category"),
          ),
          RaisedButton(
            onPressed: () {
              fbdb.createSupCat(
                  catId: "ahmed", cat: Category(catName: "muhamed"));
            },
            child: Text("create sup category"),
          ),
          Container(
            width: MediaQuery.of(context).size.width * .5,
            height: MediaQuery.of(context).size.width * .5,
            decoration: BoxDecoration(
                color: Colors.grey,
                image: (iPic.image != null)
                    ? DecorationImage(image: FileImage(iPic.image))
                    : null),
          ),
          RaisedButton(
            onPressed: () {
              iPic.takeImage();
            },
            child: Text("take a photo"),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/newProduct");
            },
            child: Text("newProduct"),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/newCategory");
            },
            child: Text("new category"),
          ),
        ],
      ),
    );
  }
}
