import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kelena/models/user.dart';
import 'package:kelena/providers/student.dart';
import 'package:kelena/providers/teachers.dart';
import 'package:kelena/widgets/appointment/appointmentBox.dart';
import 'package:provider/provider.dart';

class DialogAppointmentTeacher extends StatefulWidget {
  @override
  _DialogAppointmentTeacherState createState() =>
      new _DialogAppointmentTeacherState();
}

class _DialogAppointmentTeacherState extends State<DialogAppointmentTeacher> {
  @override
  // void initState() {
  //   Provider.of<Student>(context, listen: false).studentDetails().then((_) {});
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    // User student = Provider.of<Student>(context).student;
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
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.7,
            child: Consumer2<Student, Teachers>(
                builder: (context, student, teachers, child) {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemBuilder: (ctx, index) => AppointmentBox(
                    //Teacher ID : student.lecturerIdFromAppointment(index)
                    //Lecture ID :student.lectureIdFromAppointment(index)
                    textLine1:
                        "With ${teachers.teacherNameFromLecturerId(student.lecturerIdFromAppointment(index))} on ${teachers.appointmentDayFromLecturerId(student.lecturerIdFromAppointment(index), student.lectureIdFromAppointment(index))}",
                    textLine2:
                        "at ${teachers.roomFromAppointment(student.lecturerIdFromAppointment(index), student.lectureIdFromAppointment(index))} after ${teachers.subjectIdFromAppointment(student.lecturerIdFromAppointment(index), student.lectureIdFromAppointment(index))} ${teachers.subjectNameFromAppointment(student.lecturerIdFromAppointment(index), student.lectureIdFromAppointment(index))}",
                    status: "${student.appointmentStatus(index)}"),
                itemCount: student.appointmentLength(),
              );
            }),
          )

          // AppointmentBox(
          //     textLine1: "Dr. Ronald Robertson",
          //     textLine2: "at CB 2301 after CSC261 Statistics for data science",
          //     status: "Approved"),
          // AppointmentBox(
          //     textLine1: "Dr. Ronald Robertson",
          //     textLine2: "at CB 2301 after CSC261 Statistics for data science",
          //     status: "Rejected"),
          // AppointmentBox(
          //     textLine1: "Dr. Ronald Robertson",
          //     textLine2: "at CB 2301 after CSC261 Statistics for data science",
          //     status: "Pending"),
        ],
      ),
    ));
  }
}
