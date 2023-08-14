// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_app/shared/imageviewer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Answer3 extends StatefulWidget {
  const Answer3({Key? key}) : super(key: key);

  @override
  State<Answer3> createState() => _Answer3State();
}

class _Answer3State extends State<Answer3> {
  String selectedImageName = ''; // Track the selected image
  String gender = '';
  bool isMaleSelected = false;
  bool isFemaleSelected = false;

  void initState() {
    super.initState();

    initializeValues();
  }

  void initializeValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      isMaleSelected = prefs.getBool('isMaleSelected') ?? false;
      isFemaleSelected = prefs.getBool('isFemaleSelected') ?? false;
      selectedImageName = prefs.getString('selectedImageName') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double availableWidth = constraints.maxWidth;
        double availableHeight = constraints.maxHeight;
        if (isMaleSelected) {
          return Center(
            child: ImageViewer(
              imagePaths: [
                'assets/images/tom.png',
                'assets/images/arnold.png',
                'assets/images/michael.png',
              ],
              imageNames: [
                'Tom Holland',
                'Arnold Schwarzenegger',
                'Michael B. Jordan'
              ],
              arrowButtonSize: 20.0, // Adjust as needed
              initialSelectedImageName: selectedImageName,
            ),
          );
        } else if (isFemaleSelected) {
          return Center(
            child: ImageViewer(
              imagePaths: [
                'assets/images/HaileyBaldwin.png',
                'assets/images/SommerRay.png',
                'assets/images/SerenaWilliams.png',
              ],
              imageNames: [
                'Hailey Baldwin',
                'Sommer Ray',
                'Serena Williams',
              ],
              arrowButtonSize: 20.0, // Adjust as needed
              initialSelectedImageName: selectedImageName,
            ),
          );
        } else {
          return Container(color: Colors.transparent);
        }
      },
    );
  }
}
