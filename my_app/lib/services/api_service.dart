import 'dart:convert';
import 'dart:io';
import 'package:my_app/data/constants.dart';
import 'package:http/http.dart' as http;



// class ApiService {
//   final List<Map<String, String>> messages = [];
//   static Future<void> sendMessage(
//       {required String message, required String modelId}) async {
//     try {
//       var response = await http.post(
//         Uri.parse("$BASE_URL/completions"),
//         headers: {
//           "Authorization": "Bearer $API_KEY",
//           "Content-Type": "application/json"
//         },
//         body: jsonEncode({
//           "model": "gpt-3.5-turbo",
//           "messages": [
//             {
//               "role": "user",
//               "content": "Give me a workout routine for a male $message",
//             }
//           ]
//         }),
//       );
//       print(response.body);
//       if(response.statusCode == 200){
//         String content = 
//         jsonDecode(response.body)["choices"][0]['message']['content'];
//         content = content.trim();
      
        
//       }

//     } catch (error) {
//       print("error $error");
//     }
//   }
// }

// class ChatModel {
//   final String msg;
//   final int chatIndex;

//   ChatModel({required this.msg, required this.chatIndex});
// }

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
              "content": "Give me a workout routine for a male $message",
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