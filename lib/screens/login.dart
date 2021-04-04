import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import 'firstCome.dart';

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
                  top: MediaQuery.of(context).size.height * 0.22),
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
              child: Text("Welcome back to Kelena,\nPlease sign in to continue",
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
              margin: EdgeInsets.only(top: 40.0),
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FirstCome()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      side: BorderSide(
                          color: Colors.black, //Not show black border
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
                      Image(
                        image: AssetImage("images/google_logo.png"),
                        height: 35.0,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 10, right: 30),
                          child: Text(
                            'Sign In with Google',
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                fontSize: 17,
                                color: Colors.black,
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
      // bottomNavigationBar: _bottomNavBar(),
    );
  }
}
