import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'appointmentBox.dart';

class DialogAppointment extends StatefulWidget {
  @override
  _DialogAppointmentState createState() => new _DialogAppointmentState();
}

class _DialogAppointmentState extends State<DialogAppointment> {
  @override
  Widget build(BuildContext context) {
    Map<String, bool> onWhat = {
      'Onsite': false,
      'Online': false,
      'Hybrid': false,
    };
    int onWhatSelected = -1;
    return Scaffold(
        body: Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 54,
                  left: 10,
                  bottom: 20,
                ),
                child: IconButton(
                  icon: Icon(Icons.navigate_before_rounded),
                  color: Color(0xFF67676C),
                  iconSize: 40,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Container(
                // color: Colors.amber,
                padding: EdgeInsets.only(
                  top: 60,
                  left: 30,
                  bottom: 20,
                ),
                child: Text(
                  "Your Appointment",
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          color: Color(0xff67676C),
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400)),
                ),
              )
            ],
          ),
          AppointmentBox(
              textLine1: "Dr. Ronald Robertson",
              textLine2: "at CB 2301 after CSC261 Statistics for data science",
              status: "Approved"),
          AppointmentBox(
              textLine1: "Dr. Ronald Robertson",
              textLine2: "at CB 2301 after CSC261 Statistics for data science",
              status: "Rejected"),
          AppointmentBox(
              textLine1: "Dr. Ronald Robertson",
              textLine2: "at CB 2301 after CSC261 Statistics for data science",
              status: "Pending"),
        ],
      ),
    ));
  }
}
