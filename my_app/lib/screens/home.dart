import 'package:flutter/material.dart';
import 'package:my_app/screens/workout.dart';
import 'package:my_app/data/user.dart';
import 'package:my_app/screens/information.dart';
import 'package:my_app/shared/navbar.dart';
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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage('assets/images/Sweat Smart Loading Screen Light.gif'),
            height: 400, //testing logo gif,
          ),
          Text(
            'Welcome to Sweat Smart, ${widget.user.name}!',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'BebasNeue',
            ),
          ),
          const SizedBox(height: 16), // Optional spacing between text and button
          ElevatedButton(
            onPressed: () {
              // Handle button press
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return NavBar(user: widget.user); // Pass the User object to NavBar
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
  }
}
