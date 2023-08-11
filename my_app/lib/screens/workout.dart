import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:my_app/services/api_service.dart';
import 'package:my_app/data/generatedworkouts.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({Key? key}) : super(key: key);

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  ApiService apiService = ApiService();
  List<String> workoutList = [];
  bool isLoading = false;

  void _fetchGeneratedWorkouts() async {
    setState(() {
      isLoading = true; // Set loading to true when starting to fetch workouts
    });

    await apiService.sendMessage(
      modelId: "gpt-3.5-turbo",
      message: "I am a male who weighs 140 pounds, who's height is 6'1. I am a beginner lifter and my ideal physique is to be Tom Holland who's height is 6'1. I am a beginner lifter and my ideal physique is to be Tom Holland and I want a workout split of 4 days. Generate me 3 completely different workout splits that can be used for my stats. Please start the title of a day with \"Day:\" and end with a new line before describing the workout",
    );

    setState(() {
      if (apiService.messages.isNotEmpty) {
        String chatbotResponse = apiService.messages.last['content'] ?? '';
        workoutList = [chatbotResponse]; // Store the entire message as a list item
      }
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Workouts"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _fetchGeneratedWorkouts,
              child: Text("Generate Workouts"),
            ),
            isLoading // Show loading indicator while fetching workouts
                ? CircularProgressIndicator()
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: workoutList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(
                          workoutList[index],
                          style: TextStyle(color: Colors.white), // Make text white
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}