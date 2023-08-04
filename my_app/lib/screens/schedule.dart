import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:table_calendar/table_calendar.dart';
import '../services/api_service.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

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
      backgroundColor: Color.fromARGB(255, 25, 25, 25),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            // Center the TableCalendar in the middle of the body
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
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
                  titleTextStyle: TextStyle(
                      color: Colors.white), // Set the month text color to white
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
                  defaultTextStyle: TextStyle(color: Colors.white),
                  weekendTextStyle: TextStyle(color: Colors.white),
                  outsideTextStyle: TextStyle(color: Colors.grey),
                  outsideDaysVisible: false,
                  cellMargin: EdgeInsets.all(0),
                  todayTextStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          if (_selectedDay != null)
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
              child: Text(
                'On ${DateFormat.yMMMd().format(_selectedDay!)}, you have a back and bicep day!',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Lato',
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
