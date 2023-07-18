// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_app/shared/title.dart';
import 'package:my_app/screens/information.dart';

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
        // Uses the LayoutBuilder widget to readjust based on screen size
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            // Defines sizes for screen widgets such as the font size

            double availableWidth = constraints.maxWidth;
            double availableHeight = constraints.maxHeight;

            double logoSize = availableWidth * 0.15;
            double titleFontSize = availableWidth * 0.15;
            double subtitleFontSize = availableWidth * 0.027;

            double iconSize = availableWidth * 0.085;
            double iconText = availableWidth * 0.04;

            double buttonText = availableWidth * 0.035;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppTitle(
                  logoSize: logoSize,
                  titleFontSize: titleFontSize,
                  subtitleFontSize: subtitleFontSize,
                  textColor: Colors.white,
                ),
                Padding(
                  padding:
                      EdgeInsets.fromLTRB(30, availableHeight * 0.17, 0, 0),
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: Row(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Image(
                                image: AssetImage("assets/images/flex.png"),
                                width: iconSize,
                                height: iconSize,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ), // Add some spacing between icon and text
                            Expanded(
                              child: Text(
                                'Get personalized workouts based on your needs',
                                style: TextStyle(
                                  fontSize: iconText,
                                  color: Colors.white,
                                  letterSpacing: 1.0,
                                  fontFamily: 'Lato',
                                ),
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Row(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Image(
                                  image:
                                      AssetImage("assets/images/planner.png"),
                                  width: iconSize,
                                  height: iconSize,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ), // Add some spacing between icon and text
                              Expanded(
                                child: Text(
                                  'Schedule planner for your routine',
                                  style: TextStyle(
                                    fontSize: iconText,
                                    color: Colors.white,
                                    letterSpacing: 1.0,
                                    fontFamily: 'Lato',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Row(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Image(
                                  image:
                                      AssetImage("assets/images/guyFlex.png"),
                                  width: iconSize,
                                  height: iconSize,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ), // Add some spacing between icon and text
                              Expanded(
                                child: Text(
                                  'Become the best version of yourself!',
                                  style: TextStyle(
                                    fontSize: iconText,
                                    color: Colors.white,
                                    letterSpacing: 1.0,
                                    fontFamily: 'Lato',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 100.0),
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle button press
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return Information();
                              },
                            ),
                          );
                        },
                        child: Text(
                          'GET STARTED',
                          style: TextStyle(
                            fontSize: buttonText,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
