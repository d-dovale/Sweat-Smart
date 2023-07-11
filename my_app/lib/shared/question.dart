// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

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

List<Question> getQuestions() {
  List<Question> list = [];

  list.add(Question(
      questionText: 'Start by inputting some basic information',
      questionSubText:
          'These are required to help us find your ideal workout plan',
      answers: Column(
        children: <Widget>[],
      )));

  return list;
}

class QuestionBox extends StatefulWidget {
  @override
  State<QuestionBox> createState() => _QuestionBoxState();
}

class _QuestionBoxState extends State<QuestionBox> {
  List<Question> questionsList = getQuestions();

  int questionIndex = 0;

  void goToNextQuestion() {
    if (questionIndex < questionsList.length - 1) {
      // Increment the question index if it's within the range of the list
      questionIndex++;
    } else {
      // Handle reaching the end of the questions list
      // For example, you can show a message or navigate to a different screen
      print('End of questions');
    }
  }

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
            ],
          ),
        );
      }),
    );
  }
}
