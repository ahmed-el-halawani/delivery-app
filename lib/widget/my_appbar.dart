import 'package:flutter/material.dart';
import 'package:delivery_app/models/models.dart';
import 'package:delivery_app/utils/utils.dart';
import 'package:delivery_app/widget/widgets.dart';

class MyAppBar extends AppBar {
  final Function(String) onChange;
  String text = "";

  TextEditingController t;

  MyAppBar(
      {List<Widget> actions, this.onChange, this.text, this.t, Widget bottom})
      : super(
          bottom: PreferredSize(
            preferredSize:
                (bottom != null) ? Size.fromHeight(40) : Size.fromHeight(0),
            child: (bottom != null) ? bottom : Container(),
          ),
          elevation: 0,
          backgroundColor: MyColors.backGroundColor,
          title: Center(
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {},
              child: searchBar(onChange, t),
            ),
          ),
          actions: (actions == null)
              ? [
                  InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: Icon(Icons.share),
                    ),
                  ),
                ]
              : actions,
        );

  static Container searchBar(Function(String) onChange, t) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Color(0xfff5f5f5),
      ),
      child: TextField(
        autofocus: true,
        controller: t,
        onSubmitted: onChange,
        style: TextStyle(
          color: MyColors.titleTextColor,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          isDense: false,
          isCollapsed: false,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          contentPadding: const EdgeInsets.only(top: 5.0),
          border: InputBorder.none,
          hintText: "place or product",
          hintStyle: TextStyle(
            color: Color(0xff949494),
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
