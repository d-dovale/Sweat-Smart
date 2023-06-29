import 'dart:convert';

import 'package:http/http.dart' as http;

String BASE_URL = "https://api.openai.com/v1";
String API_KEY = "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";

class ApiService {
  static Future<void> getModels() async {
    try {
      var response = await http.get(
        Uri.parse("$BASE_URL/models"),
        headers: {"Authorization": "Bearer $API_KEY"},
      );

      Map jsonResponse = jsonDecode(response.body);
      print("jsonResponse $jsonResponse");
    } catch (error) {
      print("error $error");
    }
  }
}
