// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WeekInputFormatter extends TextInputFormatter {
  final BuildContext context;

  WeekInputFormatter(this.context);

  bool _isWeekValid = true;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    int? week = int.tryParse(newValue.text);

    if (week != null && week >= 1 && week <= 7) {
      _isWeekValid = true;
      return newValue;
    } else {
      if (!_isWeekValid) {
        showInputErrorSnackBar(
            context, 'Invalid must be a number between 1 and 7.');
      }
      _isWeekValid = false;
      return oldValue;
    }
  }

  void showInputErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }
}

class Answer4 extends StatefulWidget {
  const Answer4({super.key});

  @override
  State<Answer4> createState() => _Answer4State();
}

class _Answer4State extends State<Answer4> {
  double daysAWeek = 0.0;

  void showInputErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  bool sizeOne(BuildContext context) =>
      MediaQuery.of(context).size.height <= 700;

  bool sizeTwo(BuildContext context) =>
      MediaQuery.of(context).size.height > 700;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: 'Days a week',
              labelStyle: TextStyle(
                color: Colors.grey,
                fontFamily: 'Lato',
              ),
            ),
            onChanged: (value) {
              setState(() {
                daysAWeek = double.tryParse(value) ?? 0.0;
              });
            },
            // Add input formatters for validation
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              WeekInputFormatter(context),
            ],
          ),
        ),
        if (sizeOne(context))
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 0),
            child: Flexible(
              child: Image(
                image: AssetImage("assets/images/daysaweek.png"),
                alignment: Alignment.center,
                fit: BoxFit.contain,
                height: 275,
                width: 250,
              ),
            ),
          ),
        if (sizeTwo(context))
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 50.0, 0, 0),
            child: Flexible(
              child: Image(
                image: AssetImage("assets/images/daysaweek.png"),
                alignment: Alignment.center,
                fit: BoxFit.contain,
                height: 350,
                width: 350,
              ),
            ),
          ),
      ],
    );
  }
}
