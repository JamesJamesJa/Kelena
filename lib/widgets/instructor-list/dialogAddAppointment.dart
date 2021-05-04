import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kelena/main.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:kelena/providers/student.dart';

import 'dialogAddAppointment.dart';

class DialogAddAppointment extends StatefulWidget {
  final int index;
  final String subjectId;
  final String subjectName;
  final String to;
  final String location;
  final String teacherName;
  const DialogAddAppointment({
    Key key,
    this.index,
    this.subjectId,
    this.subjectName,
    this.to,
    this.location,
    this.teacherName,
  }) : super(key: key);
  @override
  _DialogAddAppointmentState createState() => new _DialogAddAppointmentState();
}

class _DialogAddAppointmentState extends State<DialogAddAppointment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 0,
                  left: 20,
                ),
                child: IconButton(
                  icon: Icon(Icons.close),
                  color: Colors.grey,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  right: 40,
                  bottom: 10,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xff8675A9),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          side: BorderSide(color: Color(0xff8675A9)))),
                  child: Container(
                    child: Text(
                      'Confirm',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          Center(
            child: Text(
              "Are you sure to make an appointment ?",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.only(left: 0, top: 4),
              child: Text(
                "with " + widget.teacherName,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.only(left: 0, top: 8),
              child: Text(
                "after ${widget.subjectId}  ${widget.subjectName}",
                style: TextStyle(
                  fontSize: 10,
                  color: Color(0xff2D2D2D),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.only(left: 0, top: 4),
              child: Text(
                "the class will end at " +
                    widget.to +
                    " at " +
                    widget.location.split(" ")[0],
                style: TextStyle(
                  fontSize: 10,
                  color: Color(0xff2D2D2D),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.only(left: 0, top: 24),
              child: Text(
                "*Appointment person should arrive before the class end*",
                style: TextStyle(
                  fontSize: 8,
                  color: Color(0xffABABAB),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
