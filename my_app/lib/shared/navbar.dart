import 'package:flutter/material.dart';
import 'package:my_app/screens/home.dart';
import 'package:my_app/screens/workout.dart';
import 'package:my_app/screens/schedule.dart';
import 'package:my_app/data/user.dart';

class NavBar extends StatefulWidget {
  final User user;

  const NavBar({Key? key, required this.user}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   title: const Text(
      //     'Sweat Smart',
      //     style: TextStyle(
      //       fontFamily: 'BebasNeue',
      //       letterSpacing: 2.0,
      //     ),
      //   ),
      // ),
      body: IndexedStack(
        index: currentPage,
        children: [
          HomePage(user: widget.user), // Pass the User object to HomePage
          SchedulePage(), // Pass the User object to SchedulePage
          WorkoutPage(), // Pass the User object to WorkoutPage
        ],
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_month),
            label: 'Schedule',
          ),
          NavigationDestination(
            icon: Icon(Icons.fitness_center),
            label: 'Workout',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
      ),
    );
  }
}
