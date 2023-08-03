import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WeightInputFormatter extends TextInputFormatter {
  final BuildContext context;

  WeightInputFormatter(this.context);

  bool _isWeightValid = true;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    int? weight = int.tryParse(newValue.text);

    if (weight != null && weight >= 0 && weight <= 1000) {
      _isWeightValid = true;
      return newValue;
    } else {
      if (!_isWeightValid) {
        showInputErrorSnackBar(context,
            'Invalid weight. Weight must be a number between 0 and 1000.');
      }
      _isWeightValid = false;
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

class Answer2 extends StatefulWidget {
  const Answer2({super.key});

  @override
  State<Answer2> createState() => _Answer2State();
}

class _Answer2State extends State<Answer2> {
  double heightInInches = 70.0;
  String experience = '';
  double bodyWeight = 150.0;

  @override
  Widget build(BuildContext context) {
    // Converts the height from inches to feet and inches

    int feet = (heightInInches ~/ 12);
    int inches = (heightInInches % 12).toInt();

    void showInputErrorSnackBar(BuildContext context, String message) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          duration: Duration(seconds: 2),
        ),
      );
    }

    return Column(
      children: <Widget>[
        // Slider for the Height in Feet and Inches
        Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Column(
            children: [
              Text(
                'Height: ${feet}\' ${inches}\"',
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Lato',
                ),
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

        // TextField for Body Weight
        Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: 'Body Weight',
              labelStyle: TextStyle(
                color: Colors.white,
                fontFamily: 'Lato',
              ),
              suffix: Text(
                'lbs',
                style: TextStyle(color: Colors.white),
              ),
            ),
            // Save the entered value to the bodyWeight variable
            onChanged: (value) {
              setState(() {
                bodyWeight = double.tryParse(value) ?? 0.0;
              });
            },
            // Add input formatters for validation
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              WeightInputFormatter(context),
            ],
          ),
        ),

        // Radio buttons for Experience selection
        Padding(
          padding: const EdgeInsets.only(top: 75.0),
          child: RadioListTile(
            title: const Text(
              'Beginner',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Lato',
              ),
            ),
            value: 'Beginner',
            groupValue: experience,
            onChanged: (value) {
              setState(() {
                experience = value as String;
              });
            },
          ),
        ),
        RadioListTile(
          title: const Text(
            'Intermediate',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Lato',
            ),
          ),
          value: 'Intermediate',
          groupValue: experience,
          onChanged: (value) {
            setState(() {
              experience = value as String;
            });
          },
        ),
        RadioListTile(
          title: const Text(
            'Advanced',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Lato',
            ),
          ),
          value: 'Advanced',
          groupValue: experience,
          onChanged: (value) {
            setState(() {
              experience = value as String;
            });
          },
        ),
      ],
    );
  }
}
