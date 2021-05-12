import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'firstCome.dart';
import 'studentPage.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.18),
              child: Image.asset(
                'images/kelena_logo.png',
                height: 180,
                width: 180,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              child: Text("Login",
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          color: Color(0xFF8E8E93),
                          fontSize: 34.0,
                          fontWeight: FontWeight.w300))),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Text("Welcome back to Kalena,\n  Please select your roles",
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          color: Color(0xFF8675A9),
                          fontSize: 17.0,
                          fontWeight: FontWeight.w300))),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              margin: EdgeInsets.only(top: 50.0),
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StudentPage()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xff9C8CBE)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      side: BorderSide(
                          color: Colors.grey,
                          width: 2,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 0, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.only(left: 0, right: 30),
                          child: Text(
                            'Student',
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              margin: EdgeInsets.only(top: 10.0),
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FirstCome()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xff9C8CBE)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      side: BorderSide(
                          color: Colors.grey,
                          width: 2,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 0, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.only(left: 0, right: 30),
                          child: Text(
                            'Teacher',
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
