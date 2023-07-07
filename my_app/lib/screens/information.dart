// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_app/shared/nextButton.dart';
import 'package:my_app/shared/question.dart';

class Information extends StatefulWidget {
  const Information({super.key});

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
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
              text: 'Start by inputting some basic information',
              subtext:
                  'These are required to help us find your ideal workout plan',
              indexAction: 0),
        ],
      ),
      floatingActionButton: Padding(
        child: NextButton(),
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
