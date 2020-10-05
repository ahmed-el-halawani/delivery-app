import 'package:flutter/material.dart';
import 'my_colors.dart';

ThemeData mTheme(BuildContext context) {
  return ThemeData(
    accentColor: MyColors.accentColor,
    primaryColor: MyColors.mPrimaryColor,
    scaffoldBackgroundColor: MyColors.backGroundColor,
    colorScheme: ColorScheme.dark(),
    tabBarTheme: TabBarTheme(
      labelColor: MyColors.selectedTabColors,
      unselectedLabelColor: MyColors.secondTextColor,
    ),
    backgroundColor: Colors.red,
    primaryIconTheme: IconThemeData(
      color: MyColors.secondTextColor,
    ),
    iconTheme: IconThemeData(
      color: MyColors.iconColors,
    ),
    textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.black87,
          displayColor: MyColors.thirdTextColor,
        ),
  );
}

TextStyle titleTextStyle() {
  return TextStyle(
      fontWeight: FontWeight.bold,
      height: 1,
      color: MyColors.primeTextColor,
      fontSize: 16);
}

TextStyle subTitleTextStyle() {
  return TextStyle(
    color: MyColors.thirdTextColor,
    fontSize: 16,
  );
}

TextStyle dateTextStyle() {
  return TextStyle(
    color: MyColors.secondTextColor,
    fontSize: 12,
    fontFamily: "",
  );
}

TextStyle massageDateTextStyle() {
  return TextStyle(
    color: MyColors.secondTextColor,
    fontSize: 10,
  );
}
