import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../services/api_service.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  final TextEditingController _textEditingController = TextEditingController();
  final ApiService _apiService = ApiService();
  List<Map<String, String>> messages = [];
  bool isLoading = false;

  Future<void> sendMessage() async {
    final String message = _textEditingController.text;
    if (message.trim().isEmpty) return;

    setState(() {
      isLoading = true;
    });

    try {
      await _apiService.sendMessage(message: message, modelId: "gpt-3.5-turbo");

      setState(() {
        messages = List<Map<String, String>>.from(_apiService.messages);
      });
    } catch (error) {
      print("Error: $error");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout Schedule'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final chat = messages[index];
                return ListTile(
                  title: Text(chat['role'] ?? ''),
                  subtitle: Text(chat['content'] ?? ''),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(
                hintText: 'Enter a message',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: isLoading ? null : sendMessage,
            child: isLoading ? const CircularProgressIndicator() : const Text('Send'),
          ),
        ],
      ),
    );
  }
}