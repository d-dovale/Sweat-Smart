import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/screens/information.dart';

class AgeInputFormatter extends TextInputFormatter {
  final BuildContext context;

  AgeInputFormatter(this.context);

  bool _isAgeValid = true;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    int? age = int.tryParse(newValue.text);

    if (age != null && age >= 0 && age <= 100) {
      // Reset the error status for age when input is valid
      _isAgeValid = true;
      return newValue;
    } else {
      // Show the error snackbar only if the error status for age is false
      if (!_isAgeValid) {
        showInputErrorSnackBar(
            context, 'Invalid age. Age must be a number between 0 and 100.');
      }
      _isAgeValid = false;
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
  final void Function() onErrorShown;

  NameInputFormatter(this.context,
      {this.maxLength = 30, required this.onErrorShown});

  bool _isNameValid = true; // Track the error status for name

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Allow empty strings as well
    final nameRegExp = RegExp(r'^[a-zA-Z\s]*$');

    if (nameRegExp.hasMatch(newValue.text) &&
        newValue.text.length <= maxLength) {
      _isNameValid = true;
      return newValue;
    } else {
      // Show the error snackbar only if the error status for name is false
      if (!_isNameValid && onErrorShown != null) {
        onErrorShown();
      }
      _isNameValid = false;
      return oldValue;
    }
  }

  static bool isValidName(String value) {
    final nameRegExp = RegExp(r'^[a-zA-Z\s]*$');
    return nameRegExp.hasMatch(value);
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

  static void showInputErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

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
              NameInputFormatter(
                context,
                maxLength: 30,
                onErrorShown: () {
                  showInputErrorSnackBar(context,
                      'Invalid name. Name should contain only letters and be less than 30 characters.');
                },
              ),
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
                      primary: isMaleSelected
                          ? Color.fromARGB(255, 156, 44, 36)
                          : null,
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
                      primary: isFemaleSelected
                          ? Color.fromARGB(255, 156, 44, 36)
                          : null,
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
