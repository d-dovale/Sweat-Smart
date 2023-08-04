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
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 25, 25, 25),
      body: IndexedStack(
        index: currentPage,
        children: [
          WorkoutPage(),
          HomePage(user: widget.user), // Pass the User object to HomePage
          SchedulePage(), // Pass the User object to SchedulePage// Pass the User object to WorkoutPage
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 25, 25, 25),
        unselectedItemColor: Color.fromARGB(255, 255, 255, 255),
        selectedItemColor: Colors.red,
        currentIndex: currentPage,
        onTap: (index) {
          setState(() {
            currentPage = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '', // Empty label to remove the text
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '',
          ),
        ],
      ),
    );
  }
}
