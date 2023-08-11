// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_app/shared/imageviewer.dart';
import 'package:my_app/data/user.dart';
import 'package:my_app/shared/answer1.dart';

class Answer3 extends StatefulWidget {
  const Answer3({Key? key}) : super(key: key);

  @override
  State<Answer3> createState() => _Answer3State();
}

class _Answer3State extends State<Answer3> {
  String selectedImage = ''; // Track the selected image

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double availableWidth = constraints.maxWidth;
        double availableHeight = constraints.maxHeight;

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
          ),
        );
      },
    );
  }
}
