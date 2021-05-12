import 'package:flutter/material.dart';
import 'package:kelena/providers/student.dart';
import 'package:kelena/providers/teacher.dart';
import 'package:provider/provider.dart';
import '../widgets/instructor/firstComeNavBar.dart';
import '../widgets/instructor/firstComeBody.dart';

class FirstCome extends StatefulWidget {
  @override
  _FirstComeState createState() => _FirstComeState();
}

class _FirstComeState extends State<FirstCome>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    Provider.of<Teacher>(context, listen: false).teacherDetails().then((_) {});
    Provider.of<Student>(context, listen: false).studentDetails().then((_) {});
    _tabController = TabController(vsync: this, length: 7);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      child: Consumer<Teacher>(builder: (context, teacher, child) {
        return Container(
          color: Colors.white,
          child: Column(children: [
            FirstComeNavBar(
                tabController: _tabController, name: teacher.name()),
            FirstComeBody(
              tabController: _tabController,
              teacher: teacher,
            ),
          ]),
        );
      }),
    ));
  }
}
