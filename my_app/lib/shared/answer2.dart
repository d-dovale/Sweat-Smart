import 'package:flutter/material.dart';
import 'package:my_app/shared/customradiobutton.dart';

class Answer2 extends StatefulWidget {
  const Answer2({super.key});

  @override
  State<Answer2> createState() => _Answer2State();
}

class _Answer2State extends State<Answer2> {
  double heightInInches = 70.0;
  String experience = '';

  @override
  Widget build(BuildContext context) {
    // Converts the height from inches to feet and inches
    int feet = (heightInInches ~/ 12);
    int inches = (heightInInches % 12).toInt();

    return Column(
      children: <Widget>[
        // Slider for the Height in Feet and Inches
        Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Column(
            children: [
              Text(
                'Height: ${feet}\' ${inches}\"',
                style: const TextStyle(color: Colors.white),
              ),
              Slider(
                value: heightInInches,
                min: 48,
                max: 90,
                divisions: 48,
                label: '${feet}\' ${inches}\"',
                onChanged: (value) {
                  setState(() {
                    heightInInches = value;
                  });
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: const TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: 'Body Weight',
              labelStyle: TextStyle(color: Colors.white),
            ),
          ),
        ),

        // Radio buttons for Experience selection
        Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: RadioListTile(
            title: const Text(
              'Beginner',
              style: TextStyle(color: Colors.white),
            ),
            value: 'Beginner',
            groupValue: experience,
            onChanged: (value) {
              setState(() {
                experience = value as String;
              });
            },
            secondary: CustomRadioButton(
              selected: experience == 'Beginner',
            ),
          ),
        ),
        RadioListTile(
          title: const Text(
            'Intermediate',
            style: TextStyle(color: Colors.white),
          ),
          value: 'Intermediate',
          groupValue: experience,
          onChanged: (value) {
            setState(() {
              experience = value as String;
            });
          },
          secondary: CustomRadioButton(
            selected: experience == 'Intermediate',
          ),
        ),
        RadioListTile(
          title: const Text(
            'Advanced',
            style: TextStyle(color: Colors.white),
          ),
          value: 'Advanced',
          groupValue: experience,
          onChanged: (value) {
            setState(() {
              experience = value as String;
            });
          },
          secondary: CustomRadioButton(
            selected: experience == 'Advanced',
          ),
        ),
      ],
    );
  }
}
