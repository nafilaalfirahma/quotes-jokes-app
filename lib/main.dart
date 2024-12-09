import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(RandomFunApp());
}

class RandomFunApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Fun App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}
