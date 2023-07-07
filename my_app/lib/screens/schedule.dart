import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../services/api_service.dart';

// class SchedulePage extends StatefulWidget {
//   const SchedulePage({Key? key}) : super(key: key);

//   @override
//   State<SchedulePage> createState() => _SchedulePageState();
// }

// class _SchedulePageState extends State<SchedulePage> {
//   bool _isTyping = false;

//   late TextEditingController textEditingController;

//   @override
//   void initState() {
//     super.initState();
//     textEditingController = TextEditingController();
//   }

//   @override
//   void dispose() {
//     textEditingController.dispose();
//     super.dispose();
//   }

//   List<ChatModel> chatList = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SafeArea(
//       child: Column(children: [
//         Flexible(
//           child: ListView.builder(
//             itemCount: chatList.length,
//             itemBuilder: (context, index) {
//               return ChatWidget(
//                 msg: chatList[index].msg,
//                 chatIndex: chatList[index].chatIndex,
//               );
//             },
//           ),
//         ),
//         if (_isTyping) ...[
//           const SpinKitThreeBounce(
//             color: Colors.black,
//             size: 18,
//           ),
//           const SizedBox(
//             height: 15,
//           ),
//         ],
//         Material(
//           color: const Color.fromARGB(255, 221, 220, 220),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
//                     controller: textEditingController,
//                     onSubmitted: (value) async{
//                       await sendMessage(modelId: "gpt-3.5-turbo");
//                       },
//                     decoration: const InputDecoration.collapsed(
//                         hintText: "How can I help you",
//                         hintStyle: TextStyle(color: Colors.grey)),
//                   ),
//                 ),
//                 IconButton(
//                     onPressed: () async{
//                       await sendMessage(modelId: "gpt-3.5-turbo");
//                       },
//                     icon: const Icon(
//                       Icons.send,
//                       color: Colors.red,
//                     ))
//               ],
//             ),
//           ),
//         )
//       ]),
//     ));
//   }

//   Future<void> sendMessage({required modelId}) async {
//     try {
//       setState(() {
//         _isTyping = true;
//       });
//       ApiService.sendMessage(
//           message: textEditingController.text,
//           modelId: "gpt-3.5-turbo",
//           );
//       setState(() {});
//     } catch (error) {
//       print("error $error");
//     } finally {
//       setState(() {
//         _isTyping = false;
//       });
//     }
//   }
// }

// class ChatWidget extends StatelessWidget {
//   const ChatWidget({super.key, required this.msg, required this.chatIndex});
//   final String msg;
//   final int chatIndex;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Material(
//           color: chatIndex == 0
//               ? const Color.fromARGB(255, 221, 220, 220)
//               : Color.fromARGB(255, 236, 216, 216),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 chatIndex == 0
//                     ? Image.asset(
//                         'assets/images/Buff Guy.png',
//                         height: 30,
//                         width: 30,
//                       )
//                     : Image.asset(
//                         'assets/images/Sweat Smart Logo.png',
//                         height: 30,
//                         width: 30,
//                       ),
//                 Expanded(
//                   child: Text(
//                     msg,
//                     style: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

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