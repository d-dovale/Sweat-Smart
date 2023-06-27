import 'package:flutter/material.dart';
import 'package:my_app/screens/loading.dart';
import 'package:my_app/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      home: Loading(),
    );
  }
}
