// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

// Screen Background Color for Dark Mode: #191919

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 25, 25, 25),
        body: Column(
          children: <Widget>[
            Text(
              'SWEAT SMART',
              style: TextStyle(
                fontSize: 37.0,
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'POWERED BY CHATGPT',
              style: TextStyle(
                fontSize: 7.7,
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ));
  }
}
