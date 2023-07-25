// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:my_app/shared/nextButton.dart';

class Question {
  final String questionText;
  final String questionSubText;
  final Widget answers;

  Question({
    required this.questionText,
    required this.questionSubText,
    required this.answers,
  });
}

class QuestionBox extends StatefulWidget {
  final int questionIndex;
  final VoidCallback goToNextQuestion;
  final List<Question> questionsList;

  QuestionBox({
    required this.questionIndex,
    required this.goToNextQuestion,
    required this.questionsList,
  });

  @override
  State<QuestionBox> createState() => _QuestionBoxState();
}

class _QuestionBoxState extends State<QuestionBox> {
  @override
  Widget build(BuildContext context) {
    List<Question> questionsList = widget.questionsList;
    int questionIndex = widget.questionIndex;

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
                questionsList[questionIndex].questionText,
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
                  questionsList[questionIndex].questionSubText,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: subtitleFontSize,
                    color: Colors.grey,
                    fontFamily: 'Lato',
                    letterSpacing: 1.0,
                  ),
                ),
              ),
              questionsList[questionIndex].answers,
            ],
          ),
        );
      }),
    );
  }
}
