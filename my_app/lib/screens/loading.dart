// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

// Screen Background Color for Dark Mode: #191919

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 25, 25, 25),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('assets/images/Sweat Smart Logo.png'),
                  width: 120.0,
                  height: 120.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'SWEAT SMART',
                      style: TextStyle(
                        fontSize: 110.0,
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontFamily: 'BebasNeue',
                        letterSpacing: 2.0,
                      ),
                    ),
                    Text(
                      'POWERED BY CHATGPT',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3.0,
                        fontFamily: 'Lato',
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
                child: Image(
                  image: AssetImage("assets/images/loading.gif"),
                ),
                padding: EdgeInsets.fromLTRB(0, 125, 0, 0))
          ],
        ),
      ),
    );
  }
}
