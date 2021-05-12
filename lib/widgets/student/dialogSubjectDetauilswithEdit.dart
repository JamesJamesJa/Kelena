import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kelena/widgets/student/dialogAddLecture.dart';
import 'package:kelena/widgets/student/dialogDeleteSubject.dart';
import 'package:intl/intl.dart';

class DialogSubjectDetailswithEdit extends StatefulWidget {
  final bool addBool;
  final DateTime startTime;
  final DateTime endTime;
  final String subjectId;
  final String subjectName;
  final String location;
  final String type;
  final int day;
  final String lectureId;
  final String userId;
  const DialogSubjectDetailswithEdit({
    Key key,
    this.addBool,
    this.startTime,
    this.endTime,
    this.subjectId,
    this.subjectName,
    this.location,
    this.type,
    this.day,
    this.lectureId,
    this.userId,
  }) : super(key: key);
  @override
  _DialogSubjectDetailswithEditState createState() =>
      new _DialogSubjectDetailswithEditState();
}

class _DialogSubjectDetailswithEditState
    extends State<DialogSubjectDetailswithEdit> {
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 16,
                      right: 0,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.edit_rounded,
                        size: 26,
                        color: Color(0xFFA5A5A9),
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return DialogAddLecture(
                                addBool: false,
                                startTime: widget.startTime,
                                endTime: widget.endTime,
                                location: widget.location,
                                type: widget.type,
                                subjectId: widget.subjectId,
                                subjectName: widget.subjectName,
                                day: widget.day,
                                lectureId: widget.lectureId,
                                userId: "6GL6X9a0wFZNAxS8y1yb",
                              );
                            });
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
                        Icons.delete_rounded,
                        size: 26,
                        color: Color(0xFFA5A5A9),
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return DialogDeleteSubject(
                                lectureId: widget.lectureId,
                              );
                            });
                      },
                    ),
                  ),
                ],
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
              "${DateFormat('hh:mm a').format(widget.startTime).toString()} - ${DateFormat('hh:mm a').format(widget.endTime).toString()}",
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
                  "${widget.location} (${widget.type})",
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
