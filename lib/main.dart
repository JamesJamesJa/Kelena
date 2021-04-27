import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kelena/providers/student.dart';
import 'package:kelena/providers/teachers.dart';
import 'package:kelena/screens/studentPage.dart';
import 'package:provider/provider.dart';
import 'screens/login.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Student()),
          ChangeNotifierProvider(create: (context) => Teachers()),
          // Provider(create: (context) => SomeOtherClass()),
        ],
        child: App(),
      ),
    );

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

void initState() {
  teachers.addLecturer("teacher1", "Ben Malaja", "ben.mala@gmail.com");
  teachers.addLecture("teacher1", "lec2", "CSC217", "Operating Systems",
      "CB2308", "Tue", "10:30", "12:00", "Hybrid");
  teachers.addLecture("teacher1", "lec8", "CSC217", "Operating Systems",
      "CB2306", "Fri", "12:50", "14:20", "Hybrid");
  teachers.addLecturer("teacher2", "Non Nontra", "non.nontra@gmail.com");
  teachers.addLecture("teacher2", "lec1", "MTH102", "Mathematics II", "CB2301",
      "Mon", "10:30", "12:30", "Hybrid");
  teachers.addLecture("teacher2", "lec5", "MTH102", "Mathematics II", "CB2304",
      "Thu", "12:30", "12:30", "Hybrid");
  teachers.addLecture("teacher2", "lec9", "MTH103", "Mathematics III", "CB2306",
      "Fri", "10:50", "12:20", "Hybrid");
}

class _MyAppState extends State<MyApp> {
  // GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Teachers teachers;

  Widget build(BuildContext context) {
    return Login(teachers: teachers);
  }
}
