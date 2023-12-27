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
  final Map<String, List<String>> workoutSplits = {
    'Push Day (Chest, Shoulders, and Triceps)': [
      'Bench Press: 3 sets of 6-8 reps',
      'Overhead Press: 3 sets of 6-8 reps',
      'Incline Dumbbell Press: 3 sets of 8-10 reps',
      'Tricep Dips: 3 sets of 8-10 reps',
      'Lateral Raises: 3 sets of 12-15 reps',
    ],
    'Pull Day (Back, Biceps, and Forearms)': [
      'Deadlifts: 3 sets of 6-8 reps',
      'Pull-Ups or Lat Pulldowns: 3 sets of 6-8 reps',
      'Barbell Rows: 3 sets of 6-8 reps',
      'Face Pulls: 3 sets of 12-15 reps',
      'Hammer Curls: 3 sets of 8-10 reps',
    ],
    'Legs Day (Quads, Hamstrings, Calves, and sometimes Glutes)': [
      'Squats: 3 sets of 6-8 reps',
      'Leg Press: 3 sets of 8-10 reps',
      'Romanian Deadlifts: 3 sets of 8-10 reps',
      'Leg Curls: 3 sets of 10-12 reps',
      'Calf Raises: 5 sets of 15-20 reps',
    ],
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: workoutSplits.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            isScrollable: true,
            tabs: workoutSplits.keys
                .map((split) => Tab(text: split.split(' ')[0]))
                .toList(),
          ),
          title: Text('Your Workout Split'),
        ),
        body: TabBarView(
          children: workoutSplits.entries.map((entry) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        entry.key,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ...entry.value.map<Widget>((exercise) {
                      return Card(
                        elevation: 4.0,
                        margin: EdgeInsets.symmetric(vertical: 6.0),
                        child: ListTile(
                          title: Text(exercise),
                        ),
                      );
                    }).toList()
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
