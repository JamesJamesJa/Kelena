import 'package:flutter/material.dart';
import 'package:kelena/models/instructor.dart';
import 'package:kelena/widgets/instructor-list/InstructorBox.dart';
import 'package:kelena/widgets/student/studentNavBar.dart';

class FavoriteInstructor extends StatefulWidget {
  const FavoriteInstructor({Key key}) : super(key: key);
  @override
  _FavoriteInstructorState createState() => _FavoriteInstructorState();
}

class _FavoriteInstructorState extends State<FavoriteInstructor> {
  Widget build(BuildContext context) {
    List<Instructor> instructors = [
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
    ];
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
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: (ctx, index) => InstructorBox(
                name: instructors[index].name,
                time: instructors[index].time,
                place: instructors[index].place,
                fav: instructors[index].fav,
              ),
              itemCount: instructors.length,
            ),
          )
        ]));
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
