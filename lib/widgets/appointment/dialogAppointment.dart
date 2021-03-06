import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kelena/providers/student.dart';
import 'package:kelena/providers/teachers.dart';
import 'package:provider/provider.dart';

import 'appointmentBox.dart';

class DialogAppointment extends StatefulWidget {
  @override
  _DialogAppointmentState createState() => new _DialogAppointmentState();
}

class _DialogAppointmentState extends State<DialogAppointment> {
  @override
  Widget build(BuildContext context) {
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
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.7,
            child: Consumer2<Student, Teachers>(
                builder: (context, student, teachers, child) {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemBuilder: (ctx, index) => AppointmentBox(
                    textLine1:
                        "With ${teachers.teacherNameFromLecturerId(student.lecturerIdFromAppointment(index))} on ${teachers.appointmentDayFromLecturerId(student.lecturerIdFromAppointment(index), student.lectureIdFromAppointment(index))}",
                    textLine2:
                        "at ${teachers.roomFromAppointment(student.lecturerIdFromAppointment(index), student.lectureIdFromAppointment(index))} after ${teachers.subjectIdFromAppointment(student.lecturerIdFromAppointment(index), student.lectureIdFromAppointment(index))} ${teachers.subjectNameFromAppointment(student.lecturerIdFromAppointment(index), student.lectureIdFromAppointment(index))}",
                    status: "${student.appointmentStatus(index)}"),
                itemCount: student.appointmentLength(),
              );
            }),
          )
        ],
      ),
    ));
  }
}
