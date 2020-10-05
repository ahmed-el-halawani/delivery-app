import 'package:delivery_app/controller/db_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:delivery_app/models/models.dart';
import 'package:delivery_app/utils/utils.dart';
import 'package:delivery_app/widget/widgets.dart';

class NewCategory extends StatefulWidget {
  @override
  _NewProductState createState() => _NewProductState();
}

class _NewProductState extends State<NewCategory> {
  DBProvider dbp;
  List<Category> dbItem;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    dbp = Provider.of<DBProvider>(context);
    dbItem = dbp.categoryList;

    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          InkWell(
              onTap: () {},
              child: ListTile(
                title: Text(
                  "add category",
                ),
                leading: Icon(
                  Icons.add,
                  color: Colors.black,
                ),
              )),
          Expanded(
            child: ListView.builder(
              itemCount: dbItem.length,
              itemBuilder: (context, index) {
                return Container(
                  child: ListTile(
                    title: Text(dbItem[index].catName),
                    leading: RoundedImage(
                      image: dbItem[index].catIcon,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    ));
  }
}
