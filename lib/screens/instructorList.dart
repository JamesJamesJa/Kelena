import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kelena/models/user.dart';
import 'package:kelena/widgets/instructor-list/InstructorBox.dart';
import 'package:kelena/models/instructor.dart';
import 'package:kelena/widgets/student/studentNavBar.dart';

class InstructorList extends StatefulWidget {
  final int selectedTabIndex;
  final Function changeIndex;
  final List<User> teachers;
  final User student;
  const InstructorList({
    Key key,
    this.selectedTabIndex,
    this.changeIndex,
    this.teachers,
    this.student,
  }) : super(key: key);
  @override
  _InstructorListState createState() => _InstructorListState();
}

class _InstructorListState extends State<InstructorList> {
  Widget build(BuildContext context) {
    List<Instructor> instructors = [
      Instructor(
        name: "Narogrit Eiei",
        place: "CB2301",
        time: "16:20",
        fav: 0,
      ),
      Instructor(
        name: "Wirawan Calcal",
        place: "CB2302",
        time: "12:30",
        fav: 1,
      ),
      Instructor(
        name: "Pornchai Yo",
        place: "CB2303",
        time: "14:20",
        fav: 1,
      ),
      Instructor(
        name: "P'jo Kitiphod",
        place: "CB2304",
        time: "16:20",
        fav: 1,
      ),
      Instructor(
        name: "Cholaa Makub",
        place: "CB2305",
        time: "19:20",
        fav: 1,
      ),
      Instructor(
        name: "Siam Sri",
        place: "CB2306",
        time: "11:20",
        fav: 1,
      ),
      Instructor(
        name: "Non Nontra",
        place: "CB2307",
        time: "11:11",
        fav: 1,
      ),
    ];
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.91,
      child: Column(children: <Widget>[
        StudentNavBar(
          headline1: "Instructors list",
          headline2: "Find  your  Instructors",
        ),
        Container(
          // color: Colors.yellow,
          height: MediaQuery.of(context).size.height * 0.1,
          child: Align(
            alignment: Alignment.center,
            child: Container(
                width: MediaQuery.of(context).size.width * 0.86,
                height: 40,
                margin: EdgeInsets.only(top: 10.0),
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(12),
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFF8675A9),
                      width: 1.0,
                    ),
                  ),
                  color: Colors.white,
                ),
                child: TextField(
                  decoration: InputDecoration(
                      icon: Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Icon(
                          Icons.search,
                          size: 24,
                          color: Color(0xFF8675A9),
                        ),
                      ),
                      border: InputBorder.none,
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        color: Color(0xFF8675A9),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w200,
                        fontFamily: 'Montserrat',
                      ),
                      contentPadding: const EdgeInsets.only(bottom: 6.0)),
                )),
          ),
        ),
        Container(
          padding: EdgeInsets.only(
              // top: 10.0,
              ),
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.63,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemBuilder: (ctx, index) => InstructorBox(
              teacher: widget.teachers[index],
              student: widget.student,
              // name: instructors[index].name,
              // time: instructors[index].time,
              // place: instructors[index].place,
              // fav: instructors[index].fav,
              selectedTabIndex: widget.selectedTabIndex,
              changeIndex: widget.changeIndex,
            ),
            itemCount: widget.teachers.length,
          ),
        )
      ]),
    );
  }
}
