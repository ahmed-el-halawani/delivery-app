import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundedCardMenu extends StatelessWidget {
  String title;
  Icon icon;
  Function onTap;
  Color color;

  RoundedCardMenu(
      {@required this.title,
      @required this.icon,
      this.onTap,
      this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: () {
          if (onTap != null) onTap();
        },
        child: ListTile(
          leading: icon,
          title: Text(
            title,
          ),
          trailing: Icon(Icons.arrow_forward_ios, color: Colors.black87),
        ),
      ),
    );
  }
}
