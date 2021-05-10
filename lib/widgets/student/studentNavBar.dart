import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kelena/widgets/appointment/dialogAppointment.dart';

class StudentNavBar extends StatelessWidget {
  final String headline1;
  final String headline2;
  final String amountNoti;
  const StudentNavBar({this.headline1, this.headline2, this.amountNoti});
  Widget build(BuildContext context) {
    //Bottom Nav Bar Widget
    return Column(children: [
      Container(
          height: MediaQuery.of(context).size.height * 0.13,
          // color: Colors.green,
          child: Row(children: <Widget>[
            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.65,
                  margin: EdgeInsets.only(top: 60.0, left: 30.0),
                  child: Text(headline1,
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              color: Color(0xff67676C),
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400))),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 50.0,
                left: MediaQuery.of(context).size.width * 0.1,
              ),
              child: Stack(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.notifications_active,
                      size: 26,
                      color: Color(0xFFA5A5A9),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DialogAppointment()));
                    },
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 8, top: 12),
                    child: IconButton(
                      icon:
                          Icon(Icons.brightness_1, size: 16, color: Colors.red),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DialogAppointment()));
                      },
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.only(left: 30, top: 24),
                      child: Text(
                        // amountNoti,
                        "3",
                        style: TextStyle(color: Colors.white, fontSize: 6),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DialogAppointment()));
                    },
                  ),
                ],
              ),
            ),
          ])),
      Container(
        height: MediaQuery.of(context).size.height * 0.03,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.65,
            margin: EdgeInsets.only(top: 0.0, left: 30.0),
            child: Text(headline2,
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        color: Color(0xffAEAEB2),
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400))),
          ),
        ),
      ),
    ]);
  }
}
