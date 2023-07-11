import 'package:flutter/material.dart';
import 'package:my_app/services/api_service.dart';


class WorkoutGenerator {
  final ApiService _apiService;

  WorkoutGenerator({required ApiService apiService})
      : _apiService = apiService;

  Future<List<String>> generateWorkoutRoutines(String prompt) async {
    await _apiService.sendMessage(message: prompt, modelId: "your_model_id");

    // Get the list of messages from the ApiService
    List<Map<String, String>> messages = _apiService.messages;

    // Extract workout routines from the messages
    List<String> workoutRoutines = extractWorkoutRoutines(messages);

    return workoutRoutines;
  }

  List<String> extractWorkoutRoutines(List<Map<String, String>> messages) {
    List<String> workoutRoutines = [];

    for (Map<String, String> message in messages) {
      String? content = message['content'];

      if (content != null) {
        List<String> lines = content.split('\n');

        bool isInsideRoutine = false;
        List<String> routineLines = [];

        for (String line in lines) {
          if (line.contains('Start Routine')) {
            isInsideRoutine = true;
          } else if (line.contains('End Routine')) {
            if (isInsideRoutine) {
              workoutRoutines.add(routineLines.join('\n'));
              routineLines.clear();
              isInsideRoutine = false;
            }
          } else if (isInsideRoutine) {
            routineLines.add(line);
          }
        }

        if (isInsideRoutine) {
          workoutRoutines.add(routineLines.join('\n'));
        }
      }
    }

    return workoutRoutines;
  }
}