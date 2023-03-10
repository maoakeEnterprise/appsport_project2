import 'dart:ui';

import 'package:flutter/material.dart';


class CustomThemes{

  static TextStyle headerAppBarTextStyle = const TextStyle(fontSize: 50, color: Colors.black);
  static TextStyle secondTypeTitle = const TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold);

  static TextStyle widgetName = const TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold);
  static TextStyle descriptifTitle = const TextStyle(fontSize: 20, color: Colors.grey, fontWeight: FontWeight.bold);

  static TextStyle howManyTimesTitle = const TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold);

  static InputDecoration textFieldStyle = InputDecoration(
      hintText: "nom exercice",
    hintStyle: const TextStyle(color: Colors.grey,fontSize: 15),
    filled: false,
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(50)
    ),
  );
  static InputDecoration textFieldStyle2 = InputDecoration(
    hintText: "nom programme",
    hintStyle: const TextStyle(color: Colors.grey,fontSize: 15),
    filled: false,
    border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(50)
    ),
  );

  static ThemeData themeData = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyle(fontSize: 50, color: Colors.black),
      iconTheme: IconThemeData(color: Colors.black),
      actionsIconTheme: IconThemeData(
        size: 40
      )
    )
  );

}