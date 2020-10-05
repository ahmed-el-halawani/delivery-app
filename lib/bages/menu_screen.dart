import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          RaisedButton(
              onPressed: () {},
              child: Row(
                children: [
                  Icon(Icons.mail_outline),
                  Text(
                    "Help",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ))
        ],
      ),
      body: null,
    );
  }
}
