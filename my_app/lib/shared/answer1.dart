import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/screens/information.dart';

class AgeInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Only allow digits (0-9) and ensure the entered value is within the range of 0-100
    if (newValue.text.isEmpty || (int.tryParse(newValue.text) ?? -1) <= 100) {
      return newValue;
    } else {
      // If the value is not valid, keep the old value
      return oldValue;
    }
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
          
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              labelText: 'Name',
              labelStyle: TextStyle(color: Colors.white),
            ),

            // Input validator to disallow numbers to be typed
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp(r'[0-9]')),
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
              AgeInputFormatter(), // Use the custom input formatter for age validation
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
                  width: 150, // Adjust the width as needed
                  height: 50, // Adjust the height as needed
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isMaleSelected = !isMaleSelected;
                        if (isMaleSelected) {
                          // If male is selected, deselect female
                          isFemaleSelected = false;
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: isMaleSelected
                          ? Colors.blue // Highlighted color when selected
                          : null,
                    ),
                    child: const Text('Male'),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: SizedBox(
                  width: 150, // Adjust the width as needed
                  height: 50, // Adjust the height as needed
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isFemaleSelected = !isFemaleSelected;
                        if (isFemaleSelected) {
                          // If female is selected, deselect male
                          isMaleSelected = false;
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: isFemaleSelected
                          ? Colors.blue // Highlighted color when selected
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
