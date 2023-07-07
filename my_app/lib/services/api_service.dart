import 'dart:convert';
import 'dart:io';
import 'package:my_app/data/constants.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<void> sendMessage(
      {required String message, required String modelId}) async {
    try {
      var response = await http.post(
        Uri.parse("$BASE_URL/completions"),
        headers: {
          "Authorization": "Bearer $API_KEY",
          "Content-Type": "application/json"
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": [
            {
              "role": "user",
              "content": "You are a helpful assistant $message",
            }
          ]
        }),
      );
      print(response.body);
      if (response.statusCode == 200) {
        print("success");
      }
      // Map jsonResponse = jsonDecode(response.body);

      // if (jsonResponse['error'] != null) {
      //   throw HttpException(jsonResponse['error']["message"]);
      // }
      // if (jsonResponse["choices"].length > 0) {
      //   print(jsonResponse["choices"][0]["text"]);
      // }
    } catch (error) {
      print("error $error");
    }
  }
}

class ChatModel {
  final String msg;
  final int chatIndex;

  ChatModel({required this.msg, required this.chatIndex});
}
