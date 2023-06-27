import 'package:flutter/material.dart';
import 'package:my_app/screens/schedule.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage(
                'assets/images/Sweat Smart Loading Screen Light.gif'),
            height: 400 //testing logo gif,
          ),
          const Text(
            'Welcome to Sweat Smart, [name]!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'BebasNeue',
            ),
          ),
          SizedBox(height: 16), // Optional spacing between text and button
          ElevatedButton(
            onPressed: () {
              // Handle button press
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const SchedulePage();
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
          )
        ],
      ),
    );
  }
}
