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
  double savedSliderValue = 70.0; // Set a default value
  @override
  void initState() {
    super.initState();
    initializeValues();
  }

  void initializeValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (debugSharedPreferences) {
      await prefs.clear();
    }

    setState(() {
      String? heightAsString = prefs.getString('heightInInches');
      heightInInches =
          double.tryParse(heightAsString ?? '') ?? savedSliderValue;
      savedSliderValue = prefs.getDouble('savedSliderValue') ?? 70.0;
      bodyWeight = prefs.getDouble('bodyWeight') ?? 150.0;
      experience = prefs.getString('experience') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    int feet = (heightInInches ~/ 12);
    int inches = (heightInInches % 12).toInt();

    int feetSaved = (savedSliderValue ~/ 12);
    int inchesSaved = (savedSliderValue % 12).toInt();

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double availableWidth = constraints.maxWidth;
        double availableHeight = constraints.maxHeight;

        double logoSize = availableWidth * 0.05;
        double titleFontSize = availableWidth * 0.15;
        double subtitleFontSize = availableWidth * 0.027;

        return Column(
          children: <Widget>[
            // Text above the Slider
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Height: ',
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Lato',
                      fontSize: logoSize,
                    ),
                  ),
                  Text(
                    '${feetSaved}\' ${inchesSaved}\"',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Lato',
                      fontSize: logoSize,
                    ),
                  ),
                ],
              ),
            ),

            // Slider for the Height in Feet and Inches
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.005),
              child: Column(
                children: [
                  Slider(
                    value: savedSliderValue,
                    min: 48,
                    max: 90,
                    divisions: 42,
                    label: '${feetSaved}\' ${inchesSaved}\"',
                    onChanged: (value) async {
                      setState(() {
                        heightInInches = value;
                        savedSliderValue = value;
                      });
                      // Save the heightInInches in SharedPreferences

                      int feetSaved = (savedSliderValue ~/ 12);
                      int inchesSaved = (savedSliderValue % 12).toInt();
                      int feet = (heightInInches ~/ 12);
                      int inches = (heightInInches % 12).toInt();
                      String formattedHeight = '$feet\' $inches"';

                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.setDouble(
                          'savedSliderValue', savedSliderValue);
                      await prefs.setString('heightInInches', formattedHeight);
                    },
                  ),
                ],
              ),
            ),

            // TextField for Body Weight
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.02),
              child: TextField(
                controller: widget.controllers['bodyWeight'],
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Body Weight',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Lato',
                    fontSize: logoSize,
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

            // Text above the Radio buttons
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.07),
              child: Text(
                'How much experience do you have working out?',
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Lato',
                  fontSize: logoSize,
                ),
              ),
            ),

            // Radio buttons for Experience selection
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.01),
              child: RadioListTile(
                title: Text(
                  'Beginner',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Lato',
                    fontSize: logoSize,
                  ),
                ),
                value: 'Beginner',
                groupValue: experience,
                onChanged: (value) async {
                  setState(() {
                    experience = value as String;
                  });

                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setString('experience', experience);
                },
              ),
            ),
            RadioListTile(
              title: Text(
                'Intermediate',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Lato',
                  fontSize: logoSize,
                ),
              ),
              value: 'Intermediate',
              groupValue: experience,
              onChanged: (value) async {
                setState(() {
                  experience = value as String;
                });

                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setString('experience', experience);
              },
            ),
            RadioListTile(
              title: Text(
                'Advanced',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Lato',
                  fontSize: logoSize,
                ),
              ),
              value: 'Advanced',
              groupValue: experience,
              onChanged: (value) async {
                setState(() {
                  experience = value as String;
                });

                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setString('experience', experience);
              },
            ),
          ],
        );
      },
    );
  }
}
