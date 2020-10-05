import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/models/models.dart';
import 'package:delivery_app/utils/constant_key.dart';
import 'package:delivery_app/utils/utils.dart';
import 'package:delivery_app/widget/widgets.dart';

class FirebaseDatabaseRepo {
  FirebaseFirestore db;

  FirebaseDatabaseRepo._() {
    db = FirebaseFirestore.instance;
  }

  static FirebaseDatabaseRepo fDB = FirebaseDatabaseRepo._();

  createCat(Category cat) {
    DocumentReference doc = db.collection("category").doc();
    String key = doc.id;
    doc.set(cat.toMap(key));
  }

  createSupCat({String catId, Category cat}) {
    Query query = db
        .collection("category")
        .where("catId", isEqualTo: "VZuLmo1gZN6iBdsVrtKc");
    DocumentReference query2 = db.collection("category").doc("ahmed");
    query.get().then((value) {
      DocumentReference doc =
          value.docs[0].reference.collection("supcat").doc();
      String key = doc.id;
      doc.set(cat.toMap(key));
    });
  }

  Future<List<Category>> getCategorys({String supCatKey}) {
    if (supCatKey != null) {
      return db
          .collection(ConstKey.category)
          .doc(supCatKey)
          .collection(ConstKey.supcat)
          .get()
          .then((value) {
        return value.docs.map((e) => Category.fromJson(e)).toList();
      });
    }
    return db.collection(ConstKey.category).get().then((value) {
      return value.docs.map((e) => Category.fromJson(e)).toList();
    });
  }
}
