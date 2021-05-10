import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kelena/widgets/instructor/dialogAppointmentTeacher.dart';

class FirstComeNavBar extends StatefulWidget {
  final TabController tabController;
  final String name;
  const FirstComeNavBar({Key key, this.tabController, this.name})
      : super(key: key);
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
    // return Container(
    //   height: MediaQuery.of(context).size.height * 0.26,
    //   color: Colors.white,
    //   child: Column(children: [
    //     Row(
    //       children: [
    //         Container(
    //           child: Align(
    //             alignment: Alignment.centerLeft,
    //             child: Container(
    //               width: MediaQuery.of(context).size.width * 0.65,
    //               margin: EdgeInsets.only(top: 50.0, left: 30.0),
    //               child: Text("Welcome ${widget.name}",
    //                   style: GoogleFonts.montserrat(
    //                       textStyle: TextStyle(
    //                           color: Color(0xff67676C),
    //                           fontSize: 18.0,
    //                           fontWeight: FontWeight.w400))),
    //             ),
    //           ),
    //         ),
    //         Container(
    //           margin: EdgeInsets.only(
    //             top: 10.0,
    //             left: MediaQuery.of(context).size.width * 0.1,
    //           ),
    //           child: Stack(
    //             children: [
    //               IconButton(
    //                 icon: Icon(
    //                   Icons.notifications_active,
    //                   size: 26,
    //                   color: Color(0xFFA5A5A9),
    //                 ),
    //                 onPressed: () {
    //                   // Navigator.push(
    //                   //     context,
    //                   //     MaterialPageRoute(
    //                   //         builder: (context) => DialogAppointment()));
    //                 },
    //               ),
    //               Container(
    //                 padding: EdgeInsets.only(left: 8, top: 12),
    //                 child: IconButton(
    //                   icon:
    //                       Icon(Icons.brightness_1, size: 16, color: Colors.red),
    //                   onPressed: () {
    //                     // Navigator.push(
    //                     //     context,
    //                     //     MaterialPageRoute(
    //                     //         builder: (context) => DialogAppointment()));
    //                   },
    //                 ),
    //               ),
    //               GestureDetector(
    //                 child: Container(
    //                   padding: EdgeInsets.only(left: 30, top: 24),
    //                   child: Text(
    //                     // amountNoti,
    //                     "3",
    //                     style: TextStyle(color: Colors.white, fontSize: 6),
    //                   ),
    //                 ),
    //                 onTap: () {
    //                   // Navigator.push(
    //                   //     context,
    //                   //     MaterialPageRoute(
    //                   //         builder: (context) => DialogAppointment()));
    //                 },
    //               ),
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //     Container(
    //       child: Align(
    //         alignment: Alignment.centerLeft,
    //         child: Container(
    //           margin: EdgeInsets.only(top: 2.0, left: 30.0),
    //           child: Text("This is your schedule",
    //               style: GoogleFonts.montserrat(
    //                   textStyle: TextStyle(
    //                       color: Color(0xffAEAEB2),
    //                       fontSize: 14.0,
    //                       fontWeight: FontWeight.w400))),
    //         ),
    //       ),
    //     ),
    //     Container(
    //       padding: EdgeInsets.only(
    //         top: 10.0,
    //         bottom: 20,
    //       ),
    //       color: Colors.white,
    //       child: TabBar(
    //         indicatorPadding: EdgeInsets.all(3),
    //         labelPadding: EdgeInsets.all(0),
    //         controller: widget.tabController,
    //         labelColor: Color(0xFF8675A9),
    //         unselectedLabelColor: Color(0xff8E8E93),
    //         labelStyle: GoogleFonts.montserrat(
    //             textStyle:
    //                 TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500)),
    //         unselectedLabelStyle: GoogleFonts.montserrat(
    //           textStyle: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
    //         ),
    //         indicatorColor: Color(0xFF8675A9),
    //         tabs: myTabs,
    //       ),
    //     ),
    //   ]),
    // );
    return Container(
      color: Colors.white,
      child: Column(children: [
        Container(
            height: MediaQuery.of(context).size.height * 0.1,
            // color: Colors.green,
            child: Row(children: <Widget>[
              Container(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.65,
                    margin: EdgeInsets.only(top: 30.0, left: 20.0),
                    child: Text("Welcome ${widget.name}",
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
                  top: 30.0,
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
                                builder: (context) =>
                                    DialogAppointmentTeacher()));
                      },
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 7, top: 12),
                      child: IconButton(
                        icon: Icon(Icons.brightness_1,
                            size: 16, color: Colors.red),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DialogAppointmentTeacher()));
                        },
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        padding: EdgeInsets.only(left: 29, top: 25),
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
                                builder: (context) =>
                                    DialogAppointmentTeacher()));
                      },
                    ),
                  ],
                ),
              ),
            ])),
        Container(
          height: MediaQuery.of(context).size.height * 0.03,
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.65,
              margin: EdgeInsets.only(top: 0.0, left: 22.0),
              child: Text("This is your schedule",
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          color: Color(0xffAEAEB2),
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400))),
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.1,
          padding: EdgeInsets.only(
            top: 10.0,
            bottom: 20,
          ),
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
