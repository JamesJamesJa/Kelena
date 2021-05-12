import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dialogAddAppointment.dart';

class DialogSubjectDetails extends StatefulWidget {
  final int index;
  final String subjectId;
  final String subjectName;
  final String from;
  final String to;
  final String location;
  final String teacherName;
  final String day;
  final String lectureId;
  final String lecturerId;
  const DialogSubjectDetails({
    Key key,
    this.index,
    this.subjectId,
    this.subjectName,
    this.from,
    this.to,
    this.location,
    this.teacherName,
    this.day,
    this.lectureId,
    this.lecturerId,
  }) : super(key: key);
  @override
  _DialogSubjectDetailsState createState() => new _DialogSubjectDetailsState();
}

class _DialogSubjectDetailsState extends State<DialogSubjectDetails> {
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
                  top: 10,
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
                  top: 16,
                  right: 40,
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.add_alert_outlined,
                    size: 26,
                    color: Color(0xFFA5A5A9),
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return DialogAddAppointment(
                            index: widget.index,
                            subjectId: widget.subjectId,
                            subjectName: widget.subjectName,
                            to: widget.to,
                            location: widget.location,
                            teacherName: widget.teacherName,
                            day: widget.day,
                            lectureId: widget.lectureId,
                            lecturerId: widget.lecturerId,
                          );
                        });
                  },
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 100),
            child: Text(
              widget.subjectId,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 100, top: 8),
            child: Text(
              widget.subjectName,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 100, top: 6),
            child: Text(
              "${widget.from} - ${widget.to}",
              style: TextStyle(
                fontSize: 10,
                color: Color(0xff2D2D2D),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 98, top: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.location_on,
                  size: 18,
                  color: Color(0xff757575),
                ),
                Text(
                  widget.location,
                  style: TextStyle(
                    fontSize: 10,
                    color: Color(0xff2D2D2D),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
