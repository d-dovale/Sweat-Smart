import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  final bool _isTyping = true;

  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }


  @override
  void dispose(){
    textEditingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   elevation: 2,
        //   leading: Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: Image.asset('assets/images/Sweat Smart Logo.png'),
        //   ),
        //   backgroundColor: Colors.red[200], // Lighter red color
        // ),
        body: SafeArea(
      child: Column(
        children: [
          Flexible(
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
                return const Text("hello this is a text");
              },
            ),
          ),
          if (_isTyping) ...[
            const SpinKitThreeBounce(
              color: Colors.black,
              size: 18,
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(controller: textEditingController,
                  onSubmitted: (value){
                    //TODO send message
                  },
                  decoration: InputDecoration.collapsed(hintText: "How can I help you"),
                  ),
                ),
              ],
            )
          ]
        ],
      ),
    ));
  }
}
