import 'package:flutter/material.dart';
import 'package:kelena/models/instructor.dart';
import 'package:kelena/providers/student.dart';
import 'package:kelena/providers/teachers.dart';
import 'package:kelena/widgets/instructor-list/InstructorBox.dart';
import 'package:kelena/widgets/student/studentNavBar.dart';
import 'package:provider/provider.dart';

class FavoriteInstructor extends StatefulWidget {
  final int selectedTabIndex;
  final Function changeIndex;
  const FavoriteInstructor({
    Key key,
    this.selectedTabIndex,
    this.changeIndex,
  }) : super(key: key);
  @override
  _FavoriteInstructorState createState() => _FavoriteInstructorState();
}

class _FavoriteInstructorState extends State<FavoriteInstructor> {
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.91,
        child: Column(children: <Widget>[
          StudentNavBar(
            headline1: "Thanawat Benjachatriroj",
            headline2: "Favourite instructors  （*´▽｀*）",
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Divider(
            color: Color(0xff9C8CBE),
            thickness: 1,
            indent: 40,
            endIndent: 40,
          ),
          Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.68,
              child: Consumer2<Teachers, Student>(
                  builder: (context, teachers, student, child) {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (ctx, index) =>
                      (student.checkFav(teachers.id(index)))
                          ? InstructorBox(
                              id: teachers.id(index),
                              name: teachers.name(index),
                              fav: student.checkFav(teachers.id(index)),
                              index: index,
                              selectedTabIndex: widget.selectedTabIndex,
                              changeIndex: widget.changeIndex,
                            )
                          : Container(),
                  itemCount: teachers.teacherLength(),
                );
              }))
        ]));
  }
}
