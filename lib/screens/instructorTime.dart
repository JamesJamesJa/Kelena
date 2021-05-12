import 'package:flutter/material.dart';
import 'package:kelena/providers/teachers.dart';
import 'package:kelena/widgets/instructor/instructorScheduleBody.dart';
import 'package:kelena/widgets/student/bottomNavBar.dart';
import 'package:kelena/widgets/instructor-list/instructorTimeNavBar.dart';
import 'package:provider/provider.dart';

class InstructTime extends StatefulWidget {
  final int selectedTabIndex;
  final Function changeIndex;
  final String name;
  final String id;
  final int index;
  const InstructTime(
      {Key key,
      this.selectedTabIndex,
      this.changeIndex,
      this.name,
      this.id,
      this.index})
      : super(key: key);
  @override
  _InstructTimeState createState() => _InstructTimeState();
}

class _InstructTimeState extends State<InstructTime>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 7);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.9,
          child: Column(children: <Widget>[
            InstructorTimeNavBar(
              headline1: widget.name,
              headline2: "No class...",
            ),
            Consumer<Teachers>(builder: (context, teachers, child) {
              return InstructorScheduleBody(
                tabController: _tabController,
                id: widget.id,
                teachers: teachers,
                index: widget.index,
              );
            }),
          ])),
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.white),
        child: GestureDetector(
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                ),
              ],
            ),
            height: MediaQuery.of(context).size.height * 0.09,
            child: BottomNavBar(
                isPop: true,
                selectedTabIndex: widget.selectedTabIndex,
                changeIndex: widget.changeIndex),
          ),
          onTap: () {},
        ),
      ),
    );
  }
}
