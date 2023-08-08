import 'package:flutter/material.dart';
import 'package:my_app/shared/imageviewer.dart';

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
            imageNames: ['Tom', 'Arnold', 'Michael'],
          ),
        );
      },
    );
  }
}
