import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Answer3 extends StatefulWidget {
  const Answer3({Key? key}) : super(key: key);

  @override
  State<Answer3> createState() => _Answer3State();
}

class _Answer3State extends State<Answer3> {
  String selectedImage = ''; // Track the selected image

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Image 1
        GestureDetector(
          onTap: () {
            setState(() {
              selectedImage = 'image1';
            });
          },
          child: Image.asset(
            'assets/image1.png', // Replace with your image asset path
            width: 150,
            height: 150,
            color: selectedImage == 'image1' ? Colors.red : null,
          ),
        ),
        const SizedBox(height: 10),

        // Image 2
        GestureDetector(
          onTap: () {
            setState(() {
              selectedImage = 'image2';
            });
          },
          child: Image.asset(
            'assets/image2.png', // Replace with your image asset path
            width: 150,
            height: 150,
            color: selectedImage == 'image2' ? Colors.red : null,
          ),
        ),
        const SizedBox(height: 10),

        // Image 3
        GestureDetector(
          onTap: () {
            setState(() {
              selectedImage = 'image3';
            });
          },
          child: Image.asset(
            'assets/image3.png', // Replace with your image asset path
            width: 150,
            height: 150,
            color: selectedImage == 'image3' ? Colors.red : null,
          ),
        ),
      ],
    );
  }
}
