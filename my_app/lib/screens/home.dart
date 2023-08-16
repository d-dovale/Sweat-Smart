import 'package:flutter/material.dart';
import 'package:my_app/screens/workout.dart';
import 'package:my_app/data/user.dart';
import 'package:my_app/screens/information.dart';
import 'package:my_app/shared/navbar.dart';
import 'package:my_app/shared/title.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  final User user;

  const HomePage({required this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 25, 25, 25),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        double availableWidth = constraints.maxWidth;
        double availableHeight = constraints.maxHeight;

        double logoSize = availableWidth * 0.15;
        double titleFontSize = availableWidth * 0.15;
        double subtitleFontSize = availableWidth * 0.027;

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const Image(
              //   image: AssetImage(
              //       'assets/images/Sweat Smart Loading Screen Light.gif'),
              //   height: 400, //testing logo gif,
              // ),
              // Text(
              //   'Welcome to Sweat Smart, ${widget.user.name}!',
              //   textAlign: TextAlign.center,
              //   style: const TextStyle(
              //     fontSize: 24,
              //     fontWeight: FontWeight.bold,
              //     fontFamily: 'BebasNeue',
              //   ),
              // ),
              AppTitle(
                logoSize: logoSize,
                titleFontSize: titleFontSize,
                subtitleFontSize: subtitleFontSize,
                textColor: Colors.white,
              ),
              const SizedBox(height: 100),
              ElevatedButton(
                onPressed: () {
                  // Handle button press
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return NavBar(user: widget.user);
                      },
                    ),
                  );
                },
                child: const Text(
                  'Click for Today\'s Workout, [workout variable]!',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'BebasNeue',
                    letterSpacing: 2.0,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
