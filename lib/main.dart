import 'package:flutter/material.dart';
import './Home_page.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '麻将计分器',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: new Home(),
    );
  }
}
