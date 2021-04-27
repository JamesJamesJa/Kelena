import 'package:flutter/material.dart';
import 'package:kelena/widgets/instructor/instructorScheduleBody.dart';
import 'package:kelena/widgets/student/bottomNavBar.dart';
import 'package:kelena/widgets/instructor-list/instructorTimeNavBar.dart';

class InstructTime extends StatefulWidget {
  final int selectedTabIndex;
  final Function changeIndex;
  const InstructTime({Key key, this.selectedTabIndex, this.changeIndex})
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
              headline1: "Ronald Robertson",
              headline2: "At CB2304 until 16.00",
            ),
            InstructorScheduleBody(
              tabController: _tabController,
            ),
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
          onTap: () {
            // print("a");
          },
        ),
      ),
    );
    // decoration: BoxDecoration(
    // border: Border(
    //   bottom: BorderSide(
    //     color: Color(0xff67676C),
    //     width: 0.5,
    //   ),
    // ),
    // ),
  }
}
