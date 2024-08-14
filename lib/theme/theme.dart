import 'package:flutter/material.dart';

final themeConfig = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.amber,
    background: Colors.white,
  ),
  useMaterial3: true,
  inputDecorationTheme: InputDecorationTheme(
    border: InputBorder.none,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: Colors.grey.shade300, width: 0),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: Colors.grey, width: 1),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: Colors.redAccent, width: 1),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: Colors.red, width: 1),
    ),
    filled: true,
    fillColor: Colors.grey.shade100,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      minimumSize: MaterialStatePropertyAll(Size(0, 48)),
      backgroundColor: MaterialStatePropertyAll(Colors.amber),
      foregroundColor: MaterialStatePropertyAll(Colors.black),
      elevation: MaterialStatePropertyAll(0),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    ),
  ),
);
