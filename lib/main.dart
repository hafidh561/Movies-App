import 'package:flutter/material.dart';
import 'package:submission/menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Movies App', theme: ThemeData.dark(), home: Menu());
  }
}
