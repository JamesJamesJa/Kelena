import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kelena/providers/student.dart';
import 'package:kelena/providers/teacher.dart';
import 'package:provider/provider.dart';

class DialogDeleteSubject extends StatefulWidget {
  final String lectureId;
  const DialogDeleteSubject({
    this.lectureId,
  });
  @override
  _DialogDeleteSubjectState createState() => new _DialogDeleteSubjectState();
}

class _DialogDeleteSubjectState extends State<DialogDeleteSubject> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Teacher>(builder: (context, teacher, child) {
      return AlertDialog(
        title: Text(
          'Confirm delete schedule ?',
          style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                  color: Color(0xff000000),
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400)),
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
              Provider.of<Student>(context, listen: false)
                  .deleteLecture(widget.lectureId);
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    });
  }
}
