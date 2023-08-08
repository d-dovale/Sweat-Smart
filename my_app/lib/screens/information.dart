// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_app/shared/nextButton.dart';
import 'package:my_app/shared/question.dart';
import 'package:my_app/shared/navbar.dart';
import 'package:my_app/shared/answer1.dart';
import 'package:my_app/shared/answer2.dart';
import 'package:my_app/shared/answer3.dart';
import 'package:my_app/shared/answer4.dart';
import 'package:my_app/data/user.dart';

const bool debugSharedPreferences = false;
List<Question> getQuestions(
  Map<String, TextEditingController> controllers,
  User user, {
  required Function(String) onGenderSelected,
}) {
  List<Question> list = [];

  list.add(Question(
    questionText: 'Start by inputting some basic information',
    questionSubText:
        'These are required to help us find your ideal workout plan',

    // Will include:
    // name (type out box),
    // age (type out box),
    // sex (male or female small buttons next to each other that light up when clicked)

    answers: Answer1(
      controllers: controllers,
      onGenderSelected: onGenderSelected,
      user: user,
    ),
  ));

  list.add(Question(
    questionText: 'Start by inputting some basic information',
    questionSubText: 'Input your height, body weight, and experience',

    // Will include:
    // Height (type out box)
    // Body weight (type out box)
    // Experience (Beginner, Intermediate, Advanced)

    answers: Answer2(),
  ));

  list.add(Question(
    questionText: 'What is your ideal physique or body goals?',
    questionSubText:
        'Click and select one of the three picture references of popular celebrities',

    // Will include:
    // Ideal physique/Goals (3 big picture buttons)

    answers: Answer3(),
  ));

  list.add(Question(
    questionText: 'How many days a week can you workout?',
    questionSubText: 'Leave empty if you are not sure',

    // Will include:
    // Days a week (text box)

    answers: Answer4(),
  ));

  return list;
}

class Information extends StatefulWidget {
  const Information({super.key});

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  SharedPreferences? sharedPreferences;
  int questionIndex = 0;
  List<Question> questionsList = []; // Declare the questionsList variable here

  // User information
  User user = User(
    name: '',
    age: '',
    gender: '',
    height: '',
    bodyWeight: '',
    experience: '',
    idealPhysique: '',
    workoutDays: '',
  );

  // Text editing controllers for text fields
  late Map<String, TextEditingController> controllers;

  @override
  void initState() {
    super.initState();
    // Initialize SharedPreferences instance
    initSharedPreferences();

    // Initialize text editing controllers with stored user information
    controllers = {
      'name': TextEditingController(text: user.name),
      'age': TextEditingController(text: user.age),
      // Add more controllers for other fields as needed
    };

    questionsList = getQuestions(
      controllers,
      user,
      onGenderSelected: onGenderSelected,
    );
  }

  Future<void> initSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();

    if (debugSharedPreferences) {
      await sharedPreferences!.clear();
    }

    // Retrieve user information from shared preferences and update the user object

    user = User(
      name: sharedPreferences!.getString('name') ?? '',
      age: sharedPreferences!.getString('age') ?? '',
      gender: sharedPreferences!.getString('gender') ?? '',
      height: sharedPreferences!.getString('height') ?? '',
      // bodyWeight: sharedPreferences!.getString('bodyWeight') ?? '',
      bodyWeight: '',
      experience: sharedPreferences!.getString('experience') ?? '',
      idealPhysique: sharedPreferences!.getString('idealPhysique') ?? '',
      workoutDays: sharedPreferences!.getString('workoutDays') ?? '',
    );
  }

  void onGenderSelected(String gender) {
    setState(() {
      user.gender = gender;
    });
  }

  void goToNextQuestion() async {
    // Get the values of the name and age text fields
    String name = controllers['name']!.text;
    String age = controllers['age']!.text;

    // Check if the name and age fields are empty
    if (name.isEmpty || age.isEmpty) {
      showInputErrorSnackBar(context, 'Please fill in all required fields.');
      return;
    }

    // Store the current answer in shared preferences
    storeAnswer();
    if (questionIndex < questionsList.length - 1) {
      setState(() {
        questionIndex++;
      });
    } else {
      // Save the user information to shared preferences before navigating to NavBar()
      await saveUserInformation();

      // Navigates to NavBar() when reaching the end of the questions list
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NavBar(user: user)),
      );
    }
  }

  void storeAnswer() {
    print("test 2 ${user.gender}");
    Question currentQuestion = questionsList[questionIndex];

    if (currentQuestion.answers is Answer1) {
      // If the answer widget is a text field (e.g., name, age), store the value in the User object
      Answer1 answer1 = currentQuestion.answers as Answer1;
      String name = answer1.controllers['name']!.text;
      String age = answer1.controllers['age']!.text;
      setState(() {
        user.name = name;
        user.age = age;
        //add as needed
      });
      // Add other conditions for storing other text-based answers if needed
    }
    if (currentQuestion.answers is Row) {
      // If the answer widget is a row (e.g., gender), store the selected gender in the User object
      List<Widget> genderOptions = (currentQuestion.answers as Row).children;
      for (int i = 0; i < genderOptions.length; i++) {
        if (genderOptions[i] is ElevatedButton &&
            (genderOptions[i] as ElevatedButton).style != null) {
          // The selected gender will have a style that indicates it is pressed
          setState(() {
            user.gender = (i == 0) ? 'Male' : 'Female';
          });
          break;
        }
      }
    }
    // Add other conditions for storing other types of answers if needed
  }

  Future<void> saveUserInformation() async {
    if (sharedPreferences != null) {
      sharedPreferences!.setString('name', user.name);
      sharedPreferences!.setString('age', user.age);
      sharedPreferences!.setString('gender', user.gender);
      // Add more sharedPreferences!.setString() calls for other user information
    }
  }

  static void showInputErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        print("test 3 ${user.gender}");
        if (questionIndex == 0) {
          Navigator.pop(context);
          return false;
        } else {
          setState(() {
            questionIndex--;
          });
          return false;
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromARGB(255, 25, 25, 25),
        appBar: AppBar(
          title: const Text(
            'Basic Info',
            style: TextStyle(
              fontFamily: 'BebasNeue',
              letterSpacing: 2.0,
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            QuestionBox(
              questionIndex: questionIndex,
              goToNextQuestion: goToNextQuestion,
              questionsList: questionsList,
            ),
          ],
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: NextButton(
            onPressed: goToNextQuestion,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
