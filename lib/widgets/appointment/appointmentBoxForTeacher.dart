import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kelena/widgets/instructor/dialogConfirmAppointment.dart';

class AppointmentBoxForTeacher extends StatelessWidget {
  final String name;
  final String day;
  final String room;
  final String subjectId;
  final String subjectName;
  final String status;
  final int index;
  final String appointmentId;
  const AppointmentBoxForTeacher(
      {this.name,
      this.day,
      this.room,
      this.subjectId,
      this.subjectName,
      this.status,
      this.index,
      this.appointmentId});
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 10),
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text("With ${name} on ${day}",
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  color: Color(0xff67676C),
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w400))),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                          "at ${room} after ${subjectId} ${subjectName}",
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  color: Color(0xff67676C),
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w400))),
                    ),
                  ],
                ),
                (status == "Approved" || status == "Rejected")
                    ? Text(status,
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: (status == "Approved")
                                    ? Color(0xff9C8CBE)
                                    : (status == "Rejected")
                                        ? Color(0xffFFD5CD)
                                        : Color(0xffC9C9C9),
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400)))
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            child: Container(
                              child: Icon(
                                Icons.check_rounded,
                                size: 24,
                                color: Color(0xFF000000),
                              ),
                            ),
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return DialogConfirmAppointment(
                                      name: name,
                                      day: day,
                                      room: room,
                                      subjectId: subjectId,
                                      subjectName: subjectName,
                                      status: status,
                                      index: index,
                                      appointmentId: appointmentId,
                                      accept: true,
                                    );
                                  });
                            },
                          ),
                          GestureDetector(
                            child: Container(
                              padding: EdgeInsets.only(left: 10),
                              child: Icon(
                                Icons.clear_rounded,
                                size: 24,
                                color: Color(0xFF000000),
                              ),
                            ),
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return DialogConfirmAppointment(
                                      name: name,
                                      day: day,
                                      room: room,
                                      subjectId: subjectId,
                                      subjectName: subjectName,
                                      status: status,
                                      index: index,
                                      appointmentId: appointmentId,
                                      accept: false,
                                    );
                                  });
                            },
                          ),
                        ],
                      )
              ],
            ),
            Divider(
              color: Color(0xff9C8CBE),
              thickness: 1,
              indent: 50,
              endIndent: 50,
            )
          ],
        ));
  }
}
