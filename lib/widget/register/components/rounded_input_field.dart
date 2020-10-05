import 'package:flutter/material.dart';
import 'package:delivery_app/models/models.dart';
import 'package:delivery_app/utils/utils.dart';
import 'package:delivery_app/widget/widgets.dart';

import '../constants.dart';
import '../constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final bool error;
  final String errorMassage;
  final TextEditingController controller;

  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
    this.error = false,
    this.errorMassage = "",
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      error: error,
      child: TextField(
        controller: controller ?? null,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        style: TextStyle(
          color: kPrimaryColor,
        ),
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: (!error) ? hintText : "$hintText Not Valid",
          hintStyle: TextStyle(
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
