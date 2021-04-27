import 'package:flutter/material.dart';
import 'package:kelena/models/user.dart';
import 'package:kelena/screens/firstCome.dart';
import 'package:kelena/screens/instructorTime.dart';
import 'package:kelena/widgets/student/dialogAddSchedule.dart';

class InstructorBox extends StatefulWidget {
  final User teacher;
  final User student;
  // final String name, place, time;
  // final int fav;
  // final Function(int fav) onUpdateFav;
  final int selectedTabIndex;
  final Function changeIndex;
  const InstructorBox({
    Key key,
    this.teacher,
    this.student,
    // this.name,
    // this.place,
    // this.time,
    // this.fav,
    // this.onUpdateFav,
    this.selectedTabIndex,
    this.changeIndex,
  }) : super(key: key);
  @override
  _InstructorBoxState createState() => _InstructorBoxState();
}

class _InstructorBoxState extends State<InstructorBox> {
  // final int favTemp = widget.fav;
  // widget.fav = 0;
  // @override
  //  void initState(){
  //    super.initState();
  //    int favTemp = widget..fav = 0;
  //    widget.onUpdateFav(favTemp);
  //  }
  // initState() {
  //   super.initState();
  //   if (widget.fav == 0) {
  //     widget.onUpdateFav(1);
  //     debugPrint('Fav in In: ${widget.fav}');
  //   } else {
  //     widget.onUpdateFav(0);
  //     debugPrint('Fav in In: ${widget.fav}');
  //   }
  // }
  bool isFav() {
    for (var i = 0; i < widget.student.favoriteLectures.length; i++) {
      // print(widget.student.favoriteLectures[i]);
      // print(widget.teacher.id);
      if (widget.student.favoriteLectures[i].lectureId == widget.teacher.id) {
        return false;
      }
    }
    return true;
  }

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 0.0,
        // bottom: 0,
      ),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(10),
        border: Border(
          bottom: BorderSide(
            color: Color(0xff67676C),
            width: 0.2,
          ),
        ),
        // color: Color(0xff8675A9),
      ),
      child: Container(
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 20.0, top: 0.0),
              child: Image.asset(
                'images/user.png',
                height: 44,
                width: 44,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.52,
              // color: Colors.pink,
              padding: EdgeInsets.only(left: 20.0, top: 16.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      widget.teacher.name,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      // "At " + widget.place + " until " + widget.time,
                      "No Class",
                      style: TextStyle(
                          color: Color(0xff666666),
                          fontWeight: FontWeight.w100,
                          fontSize: 10.0),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // color: Colors.green,
              padding: EdgeInsets.only(right: 0, left: 10),
              width: 40.0,
              child: IconButton(
                icon: Icon(
                  isFav() ? Icons.favorite_outline : Icons.favorite,
                  size: 24,
                  color: Color(0xFF8675A9),
                ),
                // tooltip: 'Increase volume by 10',
                onPressed: () {
                  // setState(() {
                  //   // initState();
                  //   if (widget.fav == 0) {
                  //     widget.onUpdateFav(1);
                  //     debugPrint('Fav in In: ${widget.fav}');
                  //   } else {
                  //     widget.onUpdateFav(0);
                  //     debugPrint('Fav in In: ${widget.fav}');
                  //   }

                  //   // showDialog(
                  //   //     context: context,
                  //   //     builder: (context) {
                  //   //       return DialogAddSchedule();
                  //   //     });
                  // });
                },
              ),
            ),
            Container(
              // padding: EdgeInsets.only(right: 0, left: 0),
              width: 30.0,
              child: IconButton(
                icon: Icon(
                  Icons.navigate_next_rounded,
                  size: 20,
                  color: Color(0xFF8675A9),
                ),
                // tooltip: 'Increase volume by 10',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InstructTime(
                              selectedTabIndex: widget.selectedTabIndex,
                              changeIndex: widget.changeIndex)));
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => FirstCome()),
                  //   // MaterialPageRoute(builder: (context) => InstructorsList()),
                  // );
                },
              ),
            ),
            // Container(
            //   width: 40.0,
            //   child: ElevatedButton(
            //     style: ElevatedButton.styleFrom(
            //         primary: Colors.white,
            //         shape: RoundedRectangleBorder(
            //             // borderRadius: BorderRadius.circular(30.0),
            //             side: BorderSide(color: Colors.grey))),
            //     child: Icon(
            //       widget.fav == 0 ? Icons.favorite_outline : Icons.favorite,
            //       size: 10,
            //       color: Color(0xFF8675A9),
            //     ),
            //     onPressed: () {
            //       // showDialog(
            //       //     context: context,
            //       //     builder: (context) {
            //       //       return DialogAddSchedule();
            //       //     });
            //     },
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
