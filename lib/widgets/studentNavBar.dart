import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget _studentBody(BuildContext context) {
  return Container(
    height: 130.0,
    child: Stack(
      children: <Widget>[
        Container(
          color: Color(0xFF8675A9),
          width: MediaQuery.of(context).size.width,
          height: 130.0,
          child: Container(
            child: Column(children: <Widget>[
              Container(
                  child: Row(children: <Widget>[
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.65,
                      margin: EdgeInsets.only(top: 40.0, left: 20.0),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.white,
                            width: 0.5,
                          ),
                        ),
                      ),
                      child: Text("Instructors list",
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w300))),
                    ),
                  ),
                ),
                Container(
                  child: Align(
                    // alignment: Alignment.centerRight,
                    child: Container(
                      // width: MediaQuery.of(context).size.width * 0.3,
                      margin: EdgeInsets.only(
                        top: 30.0,
                        left: MediaQuery.of(context).size.width * 0.18,
                      ),
                      child: Image.asset(
                        'images/user.png',
                        height: 34,
                        width: 34,
                      ),
                    ),
                  ),
                ),
              ])),
              Container(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 40,
                      margin: EdgeInsets.only(top: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            icon: Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Icon(
                                Icons.search,
                                size: 26,
                                color: Color(0xFF8675A9),
                              ),
                            ),
                            border: InputBorder.none,
                            hintText: 'Search',
                            hintStyle: TextStyle(
                              color: Color(0xFF8675A9),
                              fontSize: 18.0,
                              fontWeight: FontWeight.w300,
                              fontFamily: 'Montserrat',
                            ),
                            contentPadding: const EdgeInsets.only(bottom: 6.0)),
                      )),
                ),
              ),
            ]),
          ),
        ),
      ],
    ),
  );
}
