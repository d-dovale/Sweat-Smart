import 'package:flutter/material.dart';
import 'package:my_app/screens/loading.dart';
import 'package:my_app/screens/home.dart';
import 'package:my_app/screens/information.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_app/data/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool seenInfoScreen = prefs.getBool('seenInfoScreen') ?? false;
  User user = await getUserFromSharedPreferences(prefs);
  runApp(MyApp(seenInfoScreen, user));
}

class MyApp extends StatelessWidget {
  final bool seenInfoScreen;
  final User user;
  const MyApp(this.seenInfoScreen, this.user, {super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        canvasColor: Color.fromARGB(255, 21, 21, 21),
      ),
      home: Loading(user:user)
    );
  }
}
