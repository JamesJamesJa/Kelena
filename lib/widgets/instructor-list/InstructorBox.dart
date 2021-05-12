import 'package:flutter/material.dart';
import 'package:kelena/models/user.dart';
import 'package:kelena/providers/student.dart';
import 'package:kelena/screens/firstCome.dart';
import 'package:kelena/screens/instructorTime.dart';
import 'package:kelena/widgets/student/dialogAddSchedule.dart';
import 'package:provider/provider.dart';

class InstructorBox extends StatefulWidget {
  final User teacher;
  final String id, name, classNow;
  final bool fav;
  final int index;
  final int selectedTabIndex;
  final Function changeIndex;
  const InstructorBox({
    Key key,
    this.teacher,
    this.id,
    this.name,
    this.classNow,
    this.fav,
    this.index,
    this.selectedTabIndex,
    this.changeIndex,
  }) : super(key: key);
  @override
  _InstructorBoxState createState() => _InstructorBoxState();
}

class _InstructorBoxState extends State<InstructorBox> {
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0xff67676C),
              width: 0.2,
            ),
          ),
        ),
        child: Container(
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20.0, top: 0.0),
                child: Image.asset(
                  'images/teacher1.png',
                  height: 44,
                  width: 44,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.52,
                padding: EdgeInsets.only(left: 20.0, top: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        widget.name,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "No Class...",
                        style: TextStyle(
                            color: Color(0xff666666),
                            fontWeight: FontWeight.w100,
                            fontSize: 10.0),
                      ),
                    ),
                  ],
                ),
              ),
              Consumer<Student>(builder: (context, student, child) {
                return Container(
                  padding: EdgeInsets.only(right: 0, left: 10),
                  width: 40.0,
                  child: IconButton(
                    icon: Icon(
                      widget.fav ? Icons.favorite : Icons.favorite_outline,
                      size: 24,
                      color: Color(0xFF8675A9),
                    ),
                    onPressed: () {
                      student.manageFav(widget.id);
                    },
                  ),
                );
              }),
              Container(
                width: 30.0,
                child: IconButton(
                  icon: Icon(
                    Icons.navigate_next_rounded,
                    size: 20,
                    color: Color(0xFF8675A9),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InstructTime(
                                  selectedTabIndex: widget.selectedTabIndex,
                                  changeIndex: widget.changeIndex,
                                  name: widget.name,
                                  index: widget.index,
                                )));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => InstructTime(
                      selectedTabIndex: widget.selectedTabIndex,
                      changeIndex: widget.changeIndex,
                      name: widget.name,
                      id: widget.id,
                      index: widget.index,
                    )));
      },
    );
  }
}
