// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_app/shared/nextButton.dart';
import 'package:my_app/shared/question.dart';

List<Question> getQuestions() {
  List<Question> list = [];

  list.add(Question(
      questionText: 'Start by inputting some basic information',
      questionSubText:
          'These are required to help us find your ideal workout plan',
      answers: Column(
        children: <Widget>[],
      )));

  list.add(Question(
      questionText: 'Test',
      questionSubText:
          'These are required to help us find your ideal workout plan',
      answers: Column(
        children: <Widget>[],
      )));

  return list;
}

class Information extends StatefulWidget {
  const Information({super.key});

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  List<Question> questionsList = getQuestions();
  int questionIndex = 0;

  void goToNextQuestion() {
    if (questionIndex < questionsList.length - 1) {
      // Increment the question index if it's within the range of the list
      setState(() {
        questionIndex++;
      });
    } else {
      // Handle reaching the end of the questions list
      // For example, you can show a message or navigate to a different screen
      print('End of questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 25, 25, 25),
      appBar: AppBar(
        title: Text('Basic Info',
            style: TextStyle(
              fontFamily: 'BebasNeue',
              letterSpacing: 2.0,
            )),
      ),
      body: Column(
        children: <Widget>[
          QuestionBox(
            questionIndex: questionIndex,
            goToNextQuestion: goToNextQuestion,
            questionsList: questionsList,
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: NextButton(
          onPressed: goToNextQuestion,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
