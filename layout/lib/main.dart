import 'package:flutter/material.dart';
import 'package:layout/pages/home.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Widjet test",
      home: HomePage(),
    );
  }
}
