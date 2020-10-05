import 'package:flutter/cupertino.dart';

class Field {
  String fName;
  bool fErrorState;
  String fHint;
  String fType;
  TextEditingController fController = TextEditingController();

  Field({this.fName, this.fErrorState, this.fHint, this.fType});
}
