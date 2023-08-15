import 'dart:convert';
import 'package:my_app/data/constants.dart';
import 'package:http/http.dart' as http;


class ApiService {
  final List<Map<String, String>> messages = [];

  Future<void> sendMessage({required String message, required String modelId, double temperature = .2}) async {
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
              "content": message,
            }
          ],
          "temperature": temperature,
        }),
      );
      print(response.body);
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