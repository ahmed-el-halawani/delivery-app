import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImagePicker2 extends ChangeNotifier {
  File image;

  ImagePicker picker;

  ImagePicker2._() {
    picker = ImagePicker();
    retrieveLostData();
  }

  static ImagePicker2 pic = ImagePicker2._();

  takeImage() async {
    picker.getImage(source: ImageSource.camera).then((value) {
      image = File(value.path);
      notifyListeners();
    });
  }

  retrieveLostData() async {
    picker.getLostData().then((value) {
      if (value.file != null) {
        image = File(value.file.path);
        notifyListeners();
      } else {
        return null;
      }
    });
  }
}
