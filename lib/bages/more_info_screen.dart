import 'package:flutter/material.dart';
import 'package:delivery_app/models/models.dart';
import 'package:delivery_app/utils/utils.dart';
import 'package:delivery_app/widget/widgets.dart';

class MoreInfoScreen extends StatelessWidget {
  String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImageKey.deffultUserImage))),
          ),
          Text(
            "optional",
            style:
                Theme.of(context).textTheme.subtitle1.apply(color: Colors.grey),
          ),
          RoundedInputField(
            hintText: "phone number",
            icon: Icons.phone,
            onChanged: (string) => phoneNumber = string,
          ),
        ],
      ),
    );
  }
}
