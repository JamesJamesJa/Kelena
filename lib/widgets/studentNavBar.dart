import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kelena/widgets/InstructorBox.dart';
import 'package:kelena/models/instructor.dart';

class StudentNavBar extends StatefulWidget {
  final int tabIndex;
  const StudentNavBar({Key key, this.tabIndex}) : super(key: key);
  @override
  _StudentNavBarState createState() => _StudentNavBarState();
}

class _StudentNavBarState extends State<StudentNavBar> {
  Widget build(BuildContext context) {
    List<int> fav = [
      1,
      0,
      1,
      1,
      0,
      0,
      1,
    ];
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
    if (widget.tabIndex == 0) {
      return Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.91,
        child: Column(children: <Widget>[
          Container(
              height: MediaQuery.of(context).size.height * 0.13,
              // color: Colors.green,
              child: Row(children: <Widget>[
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.65,
                      margin: EdgeInsets.only(top: 60.0, left: 20.0),
                      decoration: BoxDecoration(
                          // border: Border(
                          //   bottom: BorderSide(
                          //     color: Color(0xff67676C),
                          //     width: 0.5,
                          //   ),
                          // ),
                          ),
                      child: Text("Instructors list",
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  color: Color(0xff67676C),
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w400))),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 50.0,
                    left: MediaQuery.of(context).size.width * 0.1,
                  ),
                  child: Icon(
                    Icons.notifications_active,
                    size: 26,
                    color: Color(0xFFA5A5A9),
                  ),
                ),
                // Container(
                //   child: Align(
                //     // alignment: Alignment.centerRight,
                //     child: Container(
                //       // width: MediaQuery.of(context).size.width * 0.3,
                //       margin: EdgeInsets.only(
                //         top: 50.0,
                //         left: MediaQuery.of(context).size.width * 0.1,
                //       ),
                //       child: Image.asset(
                //         'images/user.png',
                //         height: 34,
                //         width: 34,
                //       ),
                //     ),
                //   ),
                // ),
              ])),
          Container(
            // color: Colors.blue,
            height: MediaQuery.of(context).size.height * 0.03,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.65,
                margin: EdgeInsets.only(top: 0.0, left: 20.0),
                decoration: BoxDecoration(
                    // border: Border(
                    //   bottom: BorderSide(
                    //     color: Color(0xff67676C),
                    //     width: 0.5,
                    //   ),
                    // ),
                    ),
                child: Text("Find  your  Instructors",
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            color: Color(0xffAEAEB2),
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400))),
              ),
            ),
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
                name: instructors[index].name,
                time: instructors[index].time,
                place: instructors[index].place,
                fav: instructors[index].fav,
              ),
              itemCount: instructors.length,
            ),
          )
        ]),
      );
    } else if (widget.tabIndex == 1) {
      return Text('Favoirute');
    } else if (widget.tabIndex == 2) {
      return Text('Calendar');
    } else {
      return Center(child: Text('Out of tabIndex Bound'));
    }
  }
}
