import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final VoidCallback onPressed;

  NextButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Set the width to fill the available space
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10.0),
        ),
        child: Text(
          'Next',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontFamily: 'Lato',
          ),
        ),
      ),
    );
  }
}
