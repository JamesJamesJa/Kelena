import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kelena/providers/teacher.dart';
import 'package:provider/provider.dart';

class DialogConfirmAppointment extends StatefulWidget {
  final String name;
  final String day;
  final String room;
  final String subjectId;
  final String subjectName;
  final String status;
  final int index;
  final String appointmentId;
  final bool accept;
  const DialogConfirmAppointment({
    this.name,
    this.day,
    this.room,
    this.subjectId,
    this.subjectName,
    this.status,
    this.index,
    this.appointmentId,
    this.accept,
  });
  @override
  _DialogConfirmAppointmentState createState() =>
      new _DialogConfirmAppointmentState();
}

class _DialogConfirmAppointmentState extends State<DialogConfirmAppointment> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Teacher>(builder: (context, teacher, child) {
      return AlertDialog(
        title: widget.accept
            ? Text(
                'Confirm Your Acception',
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400)),
              )
            : Text(
                'Confirm Your Rejection',
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400)),
              ),
        content: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 6),
                  child: Text(
                    '    With ${widget.name}',
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            color: Color(0xff67676C),
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    'after ${widget.subjectId} ${widget.subjectName}',
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            color: Color(0xff67676C),
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    'on ${widget.day} at ${widget.room}',
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            color: Color(0xff67676C),
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400)),
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Cancel',
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        color: Color(0xff9C8CBE),
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400))),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('Confirm',
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        color: Color(0xff9C8CBE),
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400))),
            onPressed: () {
              teacher.changeAppointmentStatus("cjreWa9KOQom1YywjMBw",
                  widget.appointmentId, widget.index, widget.accept);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    });
  }
}
