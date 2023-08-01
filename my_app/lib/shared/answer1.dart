import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/screens/information.dart';

class AgeInputFormatter extends TextInputFormatter {
  final BuildContext context;

  AgeInputFormatter(this.context);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Only allow digits (0-9) and ensure the entered value is within the range of 0-100
    if (newValue.text.isEmpty) {
      return newValue;
    }

    int? age = int.tryParse(newValue.text);

    if (age != null && age >= 0 && age <= 100) {
      return newValue;
    } else {
      // Show the error snackbar
      showInputErrorSnackBar(
          context, 'Invalid age. Age must be a number between 0 and 100.');
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

class NameInputFormatter extends TextInputFormatter {
  final BuildContext context;
  final int maxLength;

  NameInputFormatter(this.context, {this.maxLength = 50});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Allow only letters (a-z, A-Z) and restrict name length
    final nameRegExp = RegExp(r'^[a-zA-Z\s]+$');
    if (nameRegExp.hasMatch(newValue.text) &&
        newValue.text.length <= maxLength) {
      return newValue;
    } else {
      // Show the error snackbar
      showInputErrorSnackBar(context,
          'Invalid name. Name should contain only letters and be less than $maxLength characters.');
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

class Answer1 extends StatefulWidget {
  final Map<String, TextEditingController> controllers;
  const Answer1({required this.controllers, Key? key}) : super(key: key);

  @override
  State<Answer1> createState() => _Answer1State();
}

class _Answer1State extends State<Answer1> {
  bool isMaleSelected = false;
  bool isFemaleSelected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Text field for Name
        Padding(
          padding: const EdgeInsets.only(top: 80.0),
          child: TextField(
            controller: widget.controllers['name'],
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              labelText: 'Name',
              labelStyle: TextStyle(color: Colors.white),
            ),

            // Input validator to disallow numbers to be typed
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp(r'[0-9]')),
              NameInputFormatter(context,
                  maxLength: 30), // Set the maximum length of the name
            ],
          ),
        ),

        // Text field for Age
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: TextField(
            controller: widget.controllers['age'],
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              labelText: 'Age',
              labelStyle: TextStyle(color: Colors.white),
            ),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              AgeInputFormatter(context),
            ],
          ),
        ),
        // Row of buttons for gender selection
        Padding(
          padding: const EdgeInsets.only(top: 100.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isMaleSelected = !isMaleSelected;
                        if (isMaleSelected) {
                          isFemaleSelected = false;
                        }
                      });
                    },
                    // Highlighted color when selected
                    style: ElevatedButton.styleFrom(
                      primary: isMaleSelected ? Colors.blue : null,
                    ),
                    child: const Text('Male'),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isFemaleSelected = !isFemaleSelected;
                        if (isFemaleSelected) {
                          isMaleSelected = false;
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: isFemaleSelected ? Colors.blue : null,
                    ),
                    child: const Text('Female'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
