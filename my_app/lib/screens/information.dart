// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_app/shared/nextButton.dart';
import 'package:my_app/shared/question.dart';
import 'package:my_app/shared/navbar.dart';

List<Question> getQuestions() {
  List<Question> list = [];

  list.add(Question(
      questionText: 'Start by inputting some basic information',
      questionSubText:
          'These are required to help us find your ideal workout plan',

      // Will include:
      // name (type out box),
      // age (type out box),
      // sex (male or female small buttons next to each other that light up when clicked)

      answers: Column(
        children: <Widget>[],
      )));

  list.add(Question(
      questionText: 'Start by inputting some basic information',
      questionSubText: 'Input your height, body weight, and experience',

      // Will include:
      // Height (type out box)
      // Body weight (type out box)
      // Experience (Begineer, Intermediate, Advanced)

      answers: Column(
        children: <Widget>[],
      )));

  list.add(Question(
      questionText: 'What is your ideal physique or body goals?',
      questionSubText:
          'Click and select one of the three picture references of popular celebrities',

      // Will include:
      // Ideal physique/Goals (3 big picture buttons)

      answers: Column(
        children: <Widget>[],
      )));

  list.add(Question(
      questionText: 'How many days a week can you workout?',
      questionSubText: 'Leave empty if you are not sure',

      // Will include:
      // Days a week (text box)

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
    // Increases the questionsList index to change to the next question in the list
    if (questionIndex < questionsList.length - 1) {
      setState(() {
        questionIndex++;
      });
    } else {
      // Navigates to NavBar() when reaching the end of the questions list
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NavBar()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (questionIndex == 0) {
          Navigator.pop(context);
          return false;
        } else {
          setState(() {
            questionIndex--;
          });
          return false;
        }
      },
      child: Scaffold(
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
      ),
    );
  }
}
