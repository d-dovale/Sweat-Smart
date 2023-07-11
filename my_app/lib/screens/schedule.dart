import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:table_calendar/table_calendar.dart';
import '../services/api_service.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
// class SchedulePage extends StatefulWidget {
//   const SchedulePage({Key? key}) : super(key: key);

//   @override
//   _SchedulePageState createState() => _SchedulePageState();
// }

// class _SchedulePageState extends State<SchedulePage> {
//   final TextEditingController _textEditingController = TextEditingController();
//   final ApiService _apiService = ApiService();
//   List<Map<String, String>> messages = [];
//   bool isLoading = false;

//   Future<void> sendMessage() async {
//     final String message = _textEditingController.text;
//     if (message.trim().isEmpty) return;

//     setState(() {
//       isLoading = true;
//     });

//     try {
//       await _apiService.sendMessage(message: message, modelId: "gpt-3.5-turbo");

//       setState(() {
//         messages = List<Map<String, String>>.from(_apiService.messages);
//       });
//     } catch (error) {
//       print("Error: $error");
//     } finally {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Workout Schedule'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: messages.length,
//               itemBuilder: (context, index) {
//                 final chat = messages[index];
//                 return ListTile(
//                   title: Text(chat['role'] ?? ''),
//                   subtitle: Text(chat['content'] ?? ''),
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: _textEditingController,
//               decoration: const InputDecoration(
//                 hintText: 'Enter a message',
//               ),
//             ),
//           ),
//           ElevatedButton(
//             onPressed: isLoading ? null : sendMessage,
//             child: isLoading ? const CircularProgressIndicator() : const Text('Send'),
//           ),
//         ],
//       ),
//     );
//   }
// }



class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  late CalendarFormat _calendarFormat;
  late DateTime _focusedDay;
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _calendarFormat = CalendarFormat.month;
    _focusedDay = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule Page'),
      ),
      body: content(),
    );
  }

  Widget content() {
    return Column(
      children: [
        Container(
          child: TableCalendar(
            locale: 'en_US',
            calendarFormat: _calendarFormat,
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            focusedDay: _focusedDay,
            firstDay: DateTime.utc(2010, 1, 1),
            lastDay: DateTime.utc(2030, 1, 1),
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              leftChevronIcon: Container(
                child: const Icon(
                  Icons.chevron_left,
                  color: Colors.red,
                ),
              ),
              rightChevronIcon: Container(
                child: const Icon(
                  Icons.chevron_right,
                  color: Colors.red,
                ),
              ),
            ),
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: _selectedDay != null ? Colors.red[200] : Colors.red,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        if (_selectedDay != null)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'On ${DateFormat.yMMMd().format(_selectedDay!)}, you have a back and bicep day!',
              style: TextStyle(fontSize: 20),
            ),
          ),
      ],
    );
  }
}