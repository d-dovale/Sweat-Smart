import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_app/shared/nextButton.dart';
import 'package:my_app/shared/question.dart';
import 'package:my_app/shared/navbar.dart';
import 'package:my_app/data/user.dart';



List<Question> getQuestions() {
  List<Question> list = [];

  list.add(Question(
    questionText: 'Start by inputting some basic information',
    questionSubText:
        'These are required to help us find your ideal workout plan',

    // Will include:
    // name (type out box),
    // age (type out box),
    // sex (male or female small buttons next to each other that light up when clicked)

    answers: Column(
      children: <Widget>[
        // Text field for Name
        TextField(
          decoration: InputDecoration(labelText: 'Name',
          labelStyle: TextStyle(color: Colors.white),)
          
        ),
        // Text field for Age
        TextField(
          decoration: InputDecoration(labelText: 'Age',
          labelStyle: TextStyle(color: Colors.white),),
        ),
        // Row of buttons for gender selection
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {},
              child: Text('Male'),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {},
              child: Text('Female'),
            ),
          ],
        ),
      ],
    ),
  ));

  list.add(Question(
    questionText: 'Start by inputting some basic information',
    questionSubText: 'Input your height, body weight, and experience',

    // Will include:
    // Height (type out box)
    // Body weight (type out box)
    // Experience (Beginner, Intermediate, Advanced)

    answers: Column(
      children: <Widget>[
        // Text field for Height
        TextField(
          decoration: InputDecoration(labelText: 'Height',
          labelStyle: TextStyle(color: Colors.white),),
        ),
        // Text field for Body Weight
        TextField(
          decoration: InputDecoration(labelText: 'Body Weight',
          labelStyle: TextStyle(color: Colors.white),),
        ),
        // Radio buttons for Experience selection
        RadioListTile(
          title: Text('Beginner',
          style: TextStyle(color: Colors.white),),
          value: 'Beginner',
          groupValue: 'Experience', // Replace 'Experience' with the appropriate group value variable
          onChanged: (value) {
            // Handle the selection
          },
        ),
        RadioListTile(
          title: Text('Intermediate',
          style: TextStyle(color: Colors.white),),
          value: 'Intermediate',
          groupValue: 'Experience', // Replace 'Experience' with the appropriate group value variable
          onChanged: (value) {
            // Handle the selection
          },
        ),
        RadioListTile(
          title: Text('Advanced',
          style: TextStyle(color: Colors.white),),
          value: 'Advanced',
          groupValue: 'Experience', // Replace 'Experience' with the appropriate group value variable
          onChanged: (value) {
            // Handle the selection
          },
        ),
      ],
    ),
  ));

  list.add(Question(
    questionText: 'What is your ideal physique or body goals?',
    questionSubText:
        'Click and select one of the three picture references of popular celebrities',

    // Will include:
    // Ideal physique/Goals (3 big picture buttons)

    answers: Column(
      children: <Widget>[
        // Add your image selection buttons here
      ],
    ),
  ));

  list.add(Question(
    questionText: 'How many days a week can you workout?',
    questionSubText: 'Leave empty if you are not sure',

    // Will include:
    // Days a week (text box)

    answers: Column(
      children: <Widget>[
        // Text field for Days a week
        TextField(
          decoration: InputDecoration(labelText: 'Days a week'),
        ),
      ],
    ),
  ));

  return list;
}


class Information extends StatefulWidget {
  const Information({super.key});

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  List<Question> questionsList = getQuestions();
  int questionIndex = 0;

  // User information
  late User user = User(
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
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  // Initialize SharedPreferences
  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    // Initialize SharedPreferences instance
    initSharedPreferences();
  }

  Future<void> initSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  void goToNextQuestion() {
    // Store the current answer in shared preferences
    storeAnswer();

    if (questionIndex < questionsList.length - 1) {
      setState(() {
        questionIndex++;
      });
    } else {
      // Save the user information to shared preferences before navigating to NavBar()
      saveUserInformation();
      // Navigates to NavBar() when reaching the end of the questions list
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NavBar()),
      );
    }
  }

  void storeAnswer() {
    Question currentQuestion = questionsList[questionIndex];
    if (currentQuestion.answers is TextField) {
      // If the answer widget is a text field (e.g., name, age), store the value in the User object
      String answer = (currentQuestion.answers as TextField).controller!.text;
      if (currentQuestion.questionText == 'Name') {
        setState(() {
          user.name = answer;
        });
      } else if (currentQuestion.questionText == 'Age') {
        setState(() {
          user.age = answer;
        });
      }
      // Add other conditions for storing other text-based answers if needed
    } else if (currentQuestion.answers is Row) {
      // If the answer widget is a row (e.g., gender), store the selected gender in the User object
      List<Widget> genderOptions = (currentQuestion.answers as Row).children;
      for (int i = 0; i < genderOptions.length; i++) {
        if (genderOptions[i] is ElevatedButton && (genderOptions[i] as ElevatedButton).style != null) {
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
    sharedPreferences.setString('name', user.name);
    sharedPreferences.setString('age', user.age);
    sharedPreferences.setString('gender', user.gender);
    // Add more sharedPreferences.setString() calls for other user information
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
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
        backgroundColor: Color.fromARGB(255, 25, 25, 25),
        appBar: AppBar(
          title: Text(
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

