// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 25, 25, 25),
      body: Center(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            double availableWidth = constraints.maxWidth;
            double availableHeight = constraints.maxHeight;

            double logoSize = availableWidth * 0.15;
            double titleFontSize = availableWidth * 0.15;
            double subtitleFontSize = availableWidth * 0.027;

            double iconSize = availableWidth * 0.085;
            double iconText = availableWidth * 0.04;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
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
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontFamily: 'BebasNeue',
                            letterSpacing: 2.0,
                          ),
                        ),
                        Text(
                          'POWERED BY CHATGPT',
                          style: TextStyle(
                            fontSize: subtitleFontSize,
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3.0,
                            fontFamily: 'Lato',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, availableHeight * 0.17, 0, 0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image(
                            image: AssetImage("assets/images/flex.png"),
                            width: iconSize,
                            height: iconSize,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20.0),
                            child: SizedBox(
                              width: 225,
                              child: Text(
                                'Get personalized workouts based on your needs',
                                style: TextStyle(
                                  fontSize: iconText,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  letterSpacing: 1.0,
                                  fontFamily: 'Lato',
                                ),
                                maxLines: 2,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image(
                              image: AssetImage("assets/images/planner.png"),
                              width: iconSize,
                              height: iconSize,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: Text(
                                'Schedule planner for your routine',
                                style: TextStyle(
                                  fontSize: iconText,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  letterSpacing: 1.0,
                                  fontFamily: 'Lato',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image(
                              image: AssetImage("assets/images/guyFlex.png"),
                              width: iconSize,
                              height: iconSize,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: Text(
                                'Become the best version of yourself!',
                                style: TextStyle(
                                  fontSize: iconText,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  letterSpacing: 1.0,
                                  fontFamily: 'Lato',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
