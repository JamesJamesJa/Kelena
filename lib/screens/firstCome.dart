import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kelena/models/user.dart';
import 'package:kelena/providers/student.dart';
import 'package:provider/provider.dart';
import '../widgets/instructor/firstComeNavBar.dart';
import '../widgets/instructor/firstComeBody.dart';
import '../widgets/instructor/firstComeBottom.dart';

class FirstCome extends StatefulWidget {
  @override
  _FirstComeState createState() => _FirstComeState();
}

class _FirstComeState extends State<FirstCome>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    Provider.of<Student>(context, listen: false).teacherDetails().then((_) {});
    _tabController = TabController(vsync: this, length: 7);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // User teacher = Provider.of<Student>(context).student;

    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      // width: double.infinity,
      child: Consumer<Student>(builder: (context, teacher, child) {
        return Container(
          color: Colors.white,
          child: Column(children: [
            FirstComeNavBar(
                tabController: _tabController, name: teacher.name()),
            FirstComeBody(
              tabController: _tabController,
              teacher: teacher,
            ),
            // FirstComeBottom(),
          ]),
        );
      }),
    ));
  }
}
