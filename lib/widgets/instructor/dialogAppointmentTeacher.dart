import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kelena/providers/student.dart';
import 'package:kelena/providers/teacher.dart';
import 'package:kelena/widgets/appointment/appointmentBoxForTeacher.dart';
import 'package:provider/provider.dart';

class DialogAppointmentTeacher extends StatefulWidget {
  @override
  _DialogAppointmentTeacherState createState() =>
      new _DialogAppointmentTeacherState();
}

class _DialogAppointmentTeacherState extends State<DialogAppointmentTeacher> {
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
                  "Appointment List",
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
            child: Consumer2<Student, Teacher>(
                builder: (context, student, teacher, child) {
              return teacher.appointmentPendingLength() == 0
                  ? Center(child: Text("There is no appointment."))
                  : ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (ctx, index) =>
                          teacher.appointmentStatus(index) == "Pending"
                              ? AppointmentBoxForTeacher(
                                  name: student.name(),
                                  day: teacher.daytoAppointment(
                                      teacher.lectureIdFromAppointment(index)),
                                  room: teacher.room(
                                      teacher.lectureIdFromAppointment(index)),
                                  subjectId: teacher.subjectId(
                                      teacher.lectureIdFromAppointment(index)),
                                  subjectName: teacher.subjectName(
                                      teacher.lectureIdFromAppointment(index)),
                                  status: teacher.appointmentStatus(index),
                                  index: index,
                                  appointmentId: teacher.appointmentId(index))
                              : Container(),
                      itemCount: teacher.appointmentLength(),
                    );
            }),
          )
        ],
      ),
    ));
  }
}
