import 'dart:convert';
import 'package:my_app/data/constants.dart';
import 'package:http/http.dart' as http;


class ApiService {
  final List<Map<String, String>> messages = [];

  Future<void> sendMessage({required String message, required String modelId}) async {
    try {
      var response = await http.post(
        Uri.parse("$BASE_URL/completions"),
        headers: {
          "Authorization": "Bearer $API_KEY",
          "Content-Type": "application/json"
        },
        body: jsonEncode({
          "model": modelId,
          "messages": [
            {
              "role": "user",
              "content": "I am a male who weighs 140 pounds, who's height is 6'1. I am a beginner lifter and my ideal physique is to be Tom Holland who's height is 6'1. I am a beginner lifter and my ideal physique is to be Tom Holland and I want a workout split of 4 days. Generate me 3 completely different workout splits that can be used for my stats. Please start the title of a day with \"Day:\" and end with a new line before describing the workout",
            }
          ]
        }),
      );

      if (response.statusCode == 200) {
        String content = jsonDecode(response.body)["choices"][0]['message']['content'];
        content = content.trim();

        Map<String, String> newMessage = {
          'role': 'chatbot',
          'content': content,
        };

        // Add the new message to the messages list
        messages.add(newMessage);
      }
    } catch (error) {
      print("Error: $error");
    }
  }
}