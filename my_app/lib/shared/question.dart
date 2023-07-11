// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Question {
  late final String questionText;
}

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
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        double availableWidth = constraints.maxWidth;
        double availableHeight = constraints.maxHeight;

        double titleFontSize = availableWidth * 0.04;
        double subtitleFontSize = availableWidth * 0.03;

        return Container(
          margin: EdgeInsets.only(right: 2.0),
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                text,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Lato',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text(
                  subtext,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: subtitleFontSize,
                    color: Colors.grey,
                    fontFamily: 'Lato',
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
