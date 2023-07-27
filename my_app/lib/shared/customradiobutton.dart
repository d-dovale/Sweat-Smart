import 'package:flutter/material.dart';

class CustomRadioButton extends StatelessWidget {
  final bool selected;

  CustomRadioButton({required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24.0,
      height: 24.0,
      child: selected
          ? Center(
              child: Container(
                width: 12.0,
                height: 12.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            )
          : null,
    );
  }
}
