import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kelena/providers/student.dart';
import 'package:kelena/providers/teacher.dart';
import 'package:kelena/providers/teachers.dart';
import 'package:provider/provider.dart';
import 'screens/login.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Student()),
          ChangeNotifierProvider(create: (context) => Teachers()),
          ChangeNotifierProvider(create: (context) => Teacher()),
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

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Login();
  }
}
