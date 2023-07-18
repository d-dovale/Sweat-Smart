// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_app/shared/title.dart';

import '../shared/navbar.dart';

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(seconds: 2), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => NavBar(),
      ),
    );
  }

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
                  padding: EdgeInsets.fromLTRB(0, availableHeight * 0.15, 0, 0),
                  child: Image(
                    image: AssetImage("assets/images/loading.gif"),
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
