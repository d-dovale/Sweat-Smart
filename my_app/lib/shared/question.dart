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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          text,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontFamily: 'BebasNeue',
            letterSpacing: 2.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            subtext,
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.grey,
              fontFamily: 'BebasNeue',
              letterSpacing: 2.0,
            ),
          ),
        ),
      ],
    );
  }
}
