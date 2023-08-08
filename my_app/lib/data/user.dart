import 'package:shared_preferences/shared_preferences.dart';
class User {
  String name;
  String gender;
  String height;
  String age;
  String bodyWeight;
  String experience;
  String idealPhysique;
  String workoutDays;

  User({
    required this.name,
    required this.age,
    required this.gender,
    required this.height,
    required this.bodyWeight,
    required this.experience,
    required this.idealPhysique,
    required this.workoutDays,
  });
}

Future<User> getUserFromSharedPreferences(SharedPreferences prefs) async {
  try {
    String name = prefs.getString('name') ?? '';
    String age = prefs.getString('age') ?? '';
    String gender = prefs.getString('gender') ?? '';
    String height = prefs.getString('height') ?? '';
    String bodyWeight = prefs.getString('bodyWeight') ?? '';
    String experience = prefs.getString('experience') ?? '';
    String idealPhysique = prefs.getString('idealPhysique') ?? '';
    String workoutDays = prefs.getString('workoutDays') ?? '';

    return User(
      name: name,
      age: age,
      gender: gender,
      height: height,
      bodyWeight: bodyWeight,
      experience: experience,
      idealPhysique: idealPhysique,
      workoutDays: workoutDays,
    );
  } catch (error) {
    print("Error reading user data: $error");
    return User(
      name: '',
      age: '',
      gender: '',
      height: '',
      bodyWeight: '',
      experience: '',
      idealPhysique: '',
      workoutDays: '',
    );
  }
}
