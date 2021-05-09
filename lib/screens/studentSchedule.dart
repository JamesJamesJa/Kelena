import 'package:flutter/material.dart';
import 'package:kelena/models/user.dart';
import 'package:kelena/providers/student.dart';
import 'package:kelena/widgets/instructor/firstComeBody.dart';
import 'package:kelena/widgets/student/studentNavBar.dart';
import 'package:kelena/widgets/student/studentScheduleBody.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'firstCome.dart';

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
    // User student = Provider.of<Student>(context).student;
    return Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.91,
        child:
            //
            Consumer<Student>(builder: (context, student, child) {
          // print(student.toHr('SdP0hm270JzDOPIJgewr'));
          return
              //
              Column(children: <Widget>[
            StudentNavBar(
              headline1: student.name(),
              // headline1: Provider.of<Student>(context).name(),
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
          ])
              //
              ;
        })
        //
        );
  }
}
