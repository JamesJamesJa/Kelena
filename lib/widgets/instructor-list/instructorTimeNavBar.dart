import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InstructorTimeNavBar extends StatelessWidget {
  final String headline1;
  final String headline2;
  const InstructorTimeNavBar({this.headline1, this.headline2});
  Widget build(BuildContext context) {
    //Bottom Nav Bar Widget
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(top: 54.0, left: 0.0),
          child: IconButton(
              icon: Icon(
                Icons.navigate_before_rounded,
                size: 40,
                color: Color(0xFF67676C),
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        Column(children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.13,
            // color: Colors.green,
            child: Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.65,
                  margin: EdgeInsets.only(top: 60.0, left: 10.0),
                  child: Text(headline1,
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              color: Color(0xff67676C),
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400))),
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.03,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.65,
                margin: EdgeInsets.only(top: 0.0, left: 10.0),
                child: Text(headline2,
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            color: Color(0xffAEAEB2),
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400))),
              ),
            ),
          ),
        ]),
        Container(
          child: Container(
            margin: EdgeInsets.only(
              top: 66.0,
              // left: MediaQuery.of(context).size.width * 0.1,
            ),
            child: Image.asset(
              'images/teacher1.png',
              height: 44,
              width: 44,
            ),
          ),
        ),
      ],
    );
  }
}
