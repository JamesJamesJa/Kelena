import 'package:flutter/material.dart';
import 'package:kelena/providers/student.dart';
import 'package:kelena/widgets/student/studentNavBar.dart';
import 'package:kelena/widgets/student/studentScheduleBody.dart';
import 'package:provider/provider.dart';

class StudentSchedule extends StatefulWidget {
  const StudentSchedule({Key key}) : super(key: key);
  @override
  _StudentScheduleState createState() => _StudentScheduleState();
}

class _StudentScheduleState extends State<StudentSchedule>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  void initState() {
    Provider.of<Student>(context, listen: false).studentDetails().then((_) {});
    _tabController = TabController(vsync: this, length: 7);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.91,
        child: Consumer<Student>(builder: (context, student, child) {
          return Column(children: <Widget>[
            StudentNavBar(
              headline1: student.name(),
              headline2: "No class...",
            ),
            Container(
              padding: EdgeInsets.only(
                top: 10.0,
              ),
              height: MediaQuery.of(context).size.height * 0.75,
              child: StudentScheduleBody(
                tabController: _tabController,
                student: student,
              ),
            ),
          ]);
        }));
  }
}
