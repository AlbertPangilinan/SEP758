import 'package:flutter/material.dart';
import 'colors.dart';

Map themes = {
  "Blue - Light": ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: blue,
      titleTextStyle: TextStyle(color: white),
      actionsIconTheme: IconThemeData(color: white),
    ),
    navigationBarTheme: NavigationBarThemeData(backgroundColor: black),
    primaryColor: blue,
    buttonTheme: ButtonThemeData(buttonColor: blue),
    textTheme: TextTheme().apply(bodyColor: black, displayColor: black),
    iconTheme: IconThemeData(color: black),
    brightness: Brightness.light,
  ),
  "Blue - Dark": ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: blue,
      titleTextStyle: TextStyle(color: white),
      actionsIconTheme: IconThemeData(color: white),
    ),
    navigationBarTheme: NavigationBarThemeData(backgroundColor: black),
    primaryColor: blue,
    buttonTheme: ButtonThemeData(buttonColor: blue),
    textTheme: TextTheme().apply(bodyColor: white, displayColor: white),
    iconTheme: IconThemeData(color: white),
    brightness: Brightness.dark,
  ),
  "Orange - Light": ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: orange,
      titleTextStyle: TextStyle(color: white),
      actionsIconTheme: IconThemeData(color: white),
    ),
    navigationBarTheme: NavigationBarThemeData(backgroundColor: black),
    primaryColor: orange,
    buttonTheme: ButtonThemeData(buttonColor: orange),
    textTheme: TextTheme().apply(bodyColor: black, displayColor: black),
    iconTheme: IconThemeData(color: black),
    brightness: Brightness.light,
  ),
  "Orange - Dark": ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: orange,
      titleTextStyle: TextStyle(color: white),
      actionsIconTheme: IconThemeData(color: white),
    ),
    navigationBarTheme: NavigationBarThemeData(backgroundColor: black),
    primaryColor: orange,
    buttonTheme: ButtonThemeData(buttonColor: orange),
    textTheme: TextTheme().apply(bodyColor: white, displayColor: white),
    iconTheme: IconThemeData(color: white),
    brightness: Brightness.dark,
  ),
};
