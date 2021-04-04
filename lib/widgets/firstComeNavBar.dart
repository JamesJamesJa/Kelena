import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstComeNavBar extends StatefulWidget {
  final TabController tabController;
  const FirstComeNavBar({Key key, this.tabController}) : super(key: key);
  @override
  _FirstComeNavBarState createState() => _FirstComeNavBarState();
}

class _FirstComeNavBarState extends State<FirstComeNavBar> {
  final List<Widget> myTabs = [
    Tab(text: "SUN"),
    Tab(text: "MON"),
    Tab(text: "TUE"),
    Tab(text: "WED"),
    Tab(text: "THU"),
    Tab(text: "FRI"),
    Tab(text: "SAT"),
  ];
  Widget build(BuildContext context) {
    return Container(
      // color: Color(0xFF8675A9),
      color: Colors.white,
      // width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height * 0.22,
      // height: 130.0,
      child: Column(children: [
        Container(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              // width: MediaQuery.of(context).size.width * 0.65,
              margin: EdgeInsets.only(top: 50.0, left: 30.0),
              child: Text("Welcome Supawit",
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          color: Color(0xff67676C),
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400))),
            ),
          ),
        ),
        Container(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              // width: MediaQuery.of(context).size.width * 0.65,
              margin: EdgeInsets.only(top: 2.0, left: 30.0),
              child: Text("Let's setup your schedule",
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          color: Color(0xffAEAEB2),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400))),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            top: 10.0,
            bottom: 20,
          ),
          // height: MediaQuery.of(context).size.height * 0.06,
          color: Colors.white,
          child: TabBar(
            indicatorPadding: EdgeInsets.all(3),
            labelPadding: EdgeInsets.all(0),
            controller: widget.tabController,
            labelColor: Color(0xFF8675A9),
            unselectedLabelColor: Color(0xff8E8E93),
            labelStyle: GoogleFonts.montserrat(
                textStyle:
                    TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500)),
            unselectedLabelStyle: GoogleFonts.montserrat(
              textStyle: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
            ),
            indicatorColor: Color(0xFF8675A9),
            tabs: myTabs,
          ),
        ),
      ]),
    );
  }
}
