import 'package:flutter/material.dart';
import 'package:delivery_app/models/models.dart';
import 'package:delivery_app/utils/utils.dart';
import 'package:delivery_app/widget/widgets.dart';
import '../constants.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  final bool error;

  const TextFieldContainer({
    Key key,
    this.child,
    this.error = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: MySize.width(context) * 0.8,
      decoration: BoxDecoration(
        color: (!error) ? kPrimaryLightColor : Colors.redAccent.withAlpha(40),
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}
