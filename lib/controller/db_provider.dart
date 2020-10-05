import 'package:delivery_app/repository/firebase_db_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:delivery_app/models/models.dart';
import 'package:delivery_app/utils/utils.dart';
import 'package:delivery_app/widget/widgets.dart';

class DBProvider extends ChangeNotifier {
  DBProvider._() {
    fDb = FirebaseDatabaseRepo.fDB;
    getCategorys();
  }

  static DBProvider db = DBProvider._();

  FirebaseDatabaseRepo fDb;

  List<Category> categoryList = [];

  getCategorys() {
    fDb.getCategorys().then((value) {
      if (categoryList != value) {
        categoryList = value;
        notifyListeners();
      }
    });
  }
}
