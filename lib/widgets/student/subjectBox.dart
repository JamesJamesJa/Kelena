import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:kelena/widgets/instructor-list/dialogSubjectDetails.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class SubjectBox extends StatefulWidget {
  final Appointment appointment;
  const SubjectBox({Key key, this.appointment}) : super(key: key);
  @override
  _SubjectBoxState createState() => _SubjectBoxState();
}

class _SubjectBoxState extends State<SubjectBox> {
  Container subjectEachBox(String details) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(bottom: 6),
      child: Text(
        details,
        style: GoogleFonts.montserrat(
            textStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          fontSize: 10,
          color: Colors.white,
        )),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xff8675A9),
      ),
      child: Stack(children: [
        Container(
            padding: EdgeInsets.fromLTRB(18, 14, 0, 0),
            child: Column(children: [
              subjectEachBox(widget.appointment.subject),
              (widget.appointment.endTime
                          .difference(widget.appointment.startTime)
                          .inHours >=
                      1)
                  ? subjectEachBox(widget.appointment.notes)
                  : Container(),
              (widget.appointment.endTime
                          .difference(widget.appointment.startTime)
                          .inHours >=
                      2)
                  ? subjectEachBox(DateFormat('hh:mm a')
                          .format(widget.appointment.startTime) +
                      DateFormat(' - hh:mm a')
                          .format(widget.appointment.endTime))
                  : Container(),
              (widget.appointment.endTime
                          .difference(widget.appointment.startTime)
                          .inHours >=
                      3)
                  ? subjectEachBox(widget.appointment.location)
                  : Container(),
            ])),
        Container(
          alignment: Alignment.topRight,
          child: Image.asset('images/kelena_logo.png',
              height: 60,
              width: 60,
              color: Color.fromRGBO(255, 255, 255, 0.6),
              colorBlendMode: BlendMode.modulate),
        ),
      ]),
    );
  }
}
