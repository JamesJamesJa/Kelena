import 'package:flutter/material.dart';
import 'package:kelena/widgets/student/studentNavBar.dart';

class StudentSchedule extends StatefulWidget {
  const StudentSchedule({Key key}) : super(key: key);
  @override
  _StudentScheduleState createState() => _StudentScheduleState();
}

class _StudentScheduleState extends State<StudentSchedule> {
  Widget build(BuildContext context) {
    return StudentNavBar(
      headline1: "Thanawat Benjachatriroj",
      headline2: "MTH 102, CB 2301",
    );
  }
}
