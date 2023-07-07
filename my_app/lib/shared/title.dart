import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  final double logoSize;
  final double titleFontSize;
  final double subtitleFontSize;
  final Color textColor;

  AppTitle({
    required this.logoSize,
    required this.titleFontSize,
    required this.subtitleFontSize,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage('assets/images/Sweat Smart Logo.png'),
          width: logoSize,
          height: logoSize,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'SWEAT SMART',
              style: TextStyle(
                fontSize: titleFontSize,
                color: textColor,
                fontFamily: 'BebasNeue',
                letterSpacing: 2.0,
              ),
            ),
            Text(
              'POWERED BY CHATGPT',
              style: TextStyle(
                fontSize: subtitleFontSize,
                color: textColor,
                fontWeight: FontWeight.bold,
                letterSpacing: 3.0,
                fontFamily: 'Lato',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
