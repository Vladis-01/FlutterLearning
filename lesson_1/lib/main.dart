import 'package:flutter/material.dart';
import 'package:lesson_1/pages/home.dart';
import 'package:lesson_1/pages/addBook.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.deepOrangeAccent
    ),
    home: Home(),
    ));
}
