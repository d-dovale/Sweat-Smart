import 'package:my_app/services/api_service.dart';

class WorkoutDay {
  final String name;
  final String info;
  final int index;

  WorkoutDay({
    required this.name,
    required this.info,
    required this.index,
  });
}

class WorkoutGenerator {
  final ApiService _apiService;

  WorkoutGenerator({required ApiService apiService}) : _apiService = apiService;

  Future<List<Map<String, dynamic>>> generateWorkoutRoutines(
      String prompt) async {
    await _apiService.sendMessage(message: prompt, modelId: "gpt-3.5-turbo");

    // Get the list of messages from the ApiService
    List<Map<String, String>> messages = _apiService.messages;

    // Extract workout routines with days and info from the messages
    List<Map<String, dynamic>> workoutRoutines =
        extractWorkoutRoutines(messages);

    return workoutRoutines;
  }

  List<Map<String, dynamic>> extractWorkoutRoutines(
      List<Map<String, String>> messages) {
    List<Map<String, dynamic>> workoutRoutines = [];

    for (Map<String, String> message in messages) {
      String? content = message['content'];

      if (content != null) {
        List<String> workoutSplits = content.split('\n\nWorkout Split');

        for (String split in workoutSplits) {
          Map<String, dynamic> routine = parseWorkoutSplit(split.trim());
          workoutRoutines.add(routine);
        }
      }
    }

    return workoutRoutines;
  }

  Map<String, dynamic> parseWorkoutSplit(String content) {
    List<String> lines = content.split('\n');

    Map<String, dynamic> workoutSplit = {
      'days': [],
    };

    String currentDay = '';
    String currentInfo = '';
    int currentDayIndex = 1;

    for (String line in lines) {
      if (line.startsWith('Day')) {
        if (currentDay.isNotEmpty) {
          // Create a WorkoutDay object and add it to the workout split
          WorkoutDay day = WorkoutDay(
            name: currentDay,
            info: currentInfo,
            index: currentDayIndex,
          );

          workoutSplit['days'].add(day);
          currentDayIndex++;
        }

        currentDay = line;
        currentInfo = '';
      } else if (line.isNotEmpty && !line.startsWith('Workout Split')) {
        currentInfo += '$line\n';
      }
    }

    // Add the last day's data to the workout split
    if (currentDay.isNotEmpty) {
      WorkoutDay day = WorkoutDay(
        name: currentDay,
        info: currentInfo,
        index: currentDayIndex,
      );

      workoutSplit['days'].add(day);
    }

    return workoutSplit;
  }
}
