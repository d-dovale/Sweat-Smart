import 'package:flutter/material.dart';
import 'package:my_app/services/api_service.dart';


class WorkoutGenerator {
  final ApiService _apiService;

  WorkoutGenerator({required ApiService apiService})
      : _apiService = apiService;

  Future<List<Map<String, dynamic>>> generateWorkoutRoutines(String prompt) async {
    await _apiService.sendMessage(message: prompt, modelId: "gpt-3.5-turbo");

    // Get the list of messages from the ApiService
    List<Map<String, String>> messages = _apiService.messages;

    // Extract workout routines with days and info from the messages
    List<Map<String, dynamic>> workoutRoutines = extractWorkoutRoutines(messages);

    return workoutRoutines;
  }

  List<Map<String, dynamic>> extractWorkoutRoutines(List<Map<String, String>> messages) {
    List<Map<String, dynamic>> workoutRoutines = [];

    for (Map<String, String> message in messages) {
      String? content = message['content'];

      if (content != null) {
        Map<String, dynamic> routine = parseRoutine(content);
        workoutRoutines.add(routine);
      }
    }

    return workoutRoutines;
  }

  Map<String, dynamic> parseRoutine(String content) {
    List<String> lines = content.split('\n');

    Map<String, dynamic> routine = {};

    String currentDay = '';
    String currentInfo = '';
    List<String> currentExercises = [];

    for (String line in lines) {
      if (line.startsWith('Day:')) {
        if (currentDay.isNotEmpty) {
          // Add the previous day's data to the routine
          routine[currentDay] = {
            'info': currentInfo,
            'exercises': currentExercises,
          };
        }

        currentDay = line;
        currentInfo = '';
        currentExercises = [];
      } else if (line.isEmpty) {
        // Skip empty lines
        continue;
      } else if (currentDay.isNotEmpty) {
        if (line.startsWith('Info:')) {
          currentInfo = line.substring(5).trim();
        } else {
          currentExercises.add(line);
        }
      }
    }

    // Add the last day's data to the routine
    if (currentDay.isNotEmpty) {
      routine[currentDay] = {
        'info': currentInfo,
        'exercises': currentExercises,
      };
    }

    return routine;
  }
}