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
  bool isLoading = true; // Set to true initially

  @override
  void initState() {
    super.initState();
    // Automatically fetch the generated workouts when the screen is loaded
    _fetchGeneratedWorkouts();
  }

  void _fetchGeneratedWorkouts() async {
    await apiService.sendMessage(
      modelId: "gpt-3.5-turbo-16k",
      message: "I am a male who weighs 140 pounds, who's height is 6'1. I am a beginner lifter and my ideal physique is to be Tom Holland and I want to workout 4 days a week. Generate me 3 different workout routines that can be used for my stats. Please start the title of a day with \"Day:\" and end with a new line before describing the workout", // Update with your message
    );

    setState(() {
      if (apiService.messages.isNotEmpty) {
        String chatbotResponse = apiService.messages.last['content'] ?? '';
        workoutList = [chatbotResponse]; // Store the entire message as a list item
      }
      isLoading = false; // Set loading to false when the message is fetched
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Workouts"),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: isLoading
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 20),
                  Text(
                    "Generating workout routines...",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              )
            : SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: workoutList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(
                        workoutList[index],
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}
