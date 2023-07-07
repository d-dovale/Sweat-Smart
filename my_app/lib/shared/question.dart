// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class QuestionBox extends StatelessWidget {
  const QuestionBox(
      {Key? key,
      required this.text,
      required this.subtext,
      required this.indexAction})
      : super(key: key);

  final String text;
  final String subtext;
  final int indexAction;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
        padding: EdgeInsets.only(top: 110.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              text,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
                fontFamily: 'BebasNeue',
                letterSpacing: 2.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                subtext,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey,
                  fontFamily: 'Lato',
                  letterSpacing: 2.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
