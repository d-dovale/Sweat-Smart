import 'package:flutter/material.dart';
import 'package:my_app/screens/information.dart';
class Answer1 extends StatefulWidget {
  const Answer1({super.key});

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
          ),
        ),
        // Text field for Age
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: TextField(
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              labelText: 'Age',
              labelStyle: TextStyle(color: Colors.white),
            ),
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
