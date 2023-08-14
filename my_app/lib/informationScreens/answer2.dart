import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';


const bool debugSharedPreferences = false;
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

    double? weight = double.tryParse(newValue.text);

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
  final Map<String, TextEditingController> controllers;
  const Answer2({required this.controllers, super.key});

  @override
  State<Answer2> createState() => _Answer2State();
}

class _Answer2State extends State<Answer2> {
  double heightInInches = 70.0;
  String experience = '';
  double bodyWeight = 150.0;


@override
  void initState() {
    super.initState();

    // Initialize heightInInches based on the saved value in SharedPreferences
    initializeValues();
  }
   void initializeValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (debugSharedPreferences) {
      await prefs.clear();
    }

    setState(() {
      heightInInches = prefs.getDouble('heightInInches') ?? 70.0; // Default height if not found
      bodyWeight = prefs.getDouble('bodyWeight') ?? 150.0;
      experience = prefs.getString('experience') ?? '';
    });
  }
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

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      double availableWidth = constraints.maxWidth;
      double availableHeight = constraints.maxHeight;

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
                onChanged: (value) async{
                  setState(() {
                    heightInInches = value;
                  });
                  // Save the heightInInches in SharedPreferences
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  await prefs.setDouble('heightInInches', heightInInches);
                },
              ),
            ],
          ),
        ),

        // TextField for Body Weight
        Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: TextField(
            controller: widget.controllers['bodyWeight'],
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
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
            // Add input formatters for validation
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              WeightInputFormatter(context),
            ],
          ),
        ),

          // Radio buttons for Experience selection
          Padding(
            padding: EdgeInsets.only(top: 50.0),
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
              onChanged: (value) async{
                setState(() {
                  experience = value as String;
                });
              // Save the experience in SharedPreferences
              SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              await prefs.setString('experience', experience);
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
            onChanged: (value) async{
              setState(() {
                experience = value as String;
              });
              // Save the experience in SharedPreferences
              SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              await prefs.setString('experience', experience);
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
            onChanged: (value) async{
              setState(() {
                experience = value as String;
              });
              // Save the experience in SharedPreferences
              SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              await prefs.setString('experience', experience);
            },
          ),
        ],
      );
    });
  }
}
