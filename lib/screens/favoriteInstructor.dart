import 'package:flutter/material.dart';
import 'package:kelena/widgets/student/studentNavBar.dart';

class FavoriteInstructor extends StatefulWidget {
  const FavoriteInstructor({Key key}) : super(key: key);
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
