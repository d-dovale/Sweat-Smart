import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome to Sweat Smart"),
        centerTitle: true,
      ),
      body: Center(
        child: Icon(
          Icons.fitness_center,
          color: Color.fromARGB(255, 194, 32, 21),
          size: 200.0,
        ),
      ),
    );
  }
}
