import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kelena/models/user.dart';
import 'package:kelena/providers/teacher.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:kelena/providers/student.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<DocumentSnapshot> getItem() {
  Firebase.initializeApp();
  return FirebaseFirestore.instance.collection("users").doc("docID").get();
}

class DialogAddLecture extends StatefulWidget {
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
  const DialogAddLecture({
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
  _DialogAddLectureState createState() => new _DialogAddLectureState();
}

class _DialogAddLectureState extends State<DialogAddLecture> {
  String startTime = "Start Time";
  String endTime = "End Time";
  String subjectId, subjectName, location;
  List<bool> typeList = [false, false, false];
  int weeklyDay = 0;
  List<String> allDayStringData = [
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
    "Sun",
  ];
  List<String> allDayString = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];
  List<Text> allDay = [
    Text('Monday'),
    Text('Tuesday'),
    Text('Wednesday'),
    Text('Thursday'),
    Text('Friday'),
    Text('Saturday'),
    Text('Sunday'),
  ];
  DateTime initialTimerStart = DateTime(2021, 4, 4, 8, 00),
      initialTimerEnd = DateTime(2021, 4, 4, 12, 00);
  String typeCheck() {
    if (typeList[0]) {
      return "Onsite";
    } else if (typeList[1]) {
      return "Online";
    } else {
      return "Hybrid";
    }
  }

  @override
  void initState() {
    startTime = DateFormat('hh:mm a').format(widget.startTime);
    endTime = DateFormat('hh:mm a').format(widget.endTime);
    initialTimerStart = widget.startTime;
    initialTimerEnd = widget.endTime;
    subjectId = widget.subjectId;
    subjectName = widget.subjectName;
    location = widget.location;
    weeklyDay = widget.day;
    if (widget.type == 'Onsite') {
      typeList[0] = true;
    } else if (widget.type == 'Online') {
      typeList[1] = true;
    } else if (widget.type == 'Hybrid') {
      typeList[2] = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.6,
          child: Consumer<Student>(builder: (context, student, child) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        top: 8,
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
                        top: 8,
                        right: 40,
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xff8675A9),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0),
                                side: BorderSide(color: Color(0xff8675A9)))),
                        child: Container(
                          child: Text(
                            'Save',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        onPressed: () {
                          if (widget.userId == "6GL6X9a0wFZNAxS8y1yb") {
                            Provider.of<Student>(context, listen: false)
                                .addLecturetoDB(
                                  widget.lectureId,
                                  widget.addBool,
                                  subjectId,
                                  subjectName,
                                  location,
                                  allDayStringData[weeklyDay],
                                  startTime,
                                  endTime,
                                  typeCheck(),
                                  widget.userId,
                                )
                                .then((_) {});
                          } else {
                            Provider.of<Teacher>(context, listen: false)
                                .addLecturetoDB(
                                  widget.lectureId,
                                  widget.addBool,
                                  subjectId,
                                  subjectName,
                                  location,
                                  allDayStringData[weeklyDay],
                                  startTime,
                                  endTime,
                                  typeCheck(),
                                  widget.userId,
                                )
                                .then((_) {});
                          }
                          if (!widget.addBool) {
                            Navigator.of(context).pop();
                          }
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: 56,
                  child: TextFormField(
                    initialValue: subjectId,
                    decoration: const InputDecoration(
                      labelText: 'Subject ID',
                      hintText: 'Add your Subject ID',
                    ),
                    onChanged: (String value) {
                      setState(() {
                        subjectId = value;
                      });
                    },
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: 56,
                  child: TextFormField(
                    initialValue: subjectName,
                    decoration: const InputDecoration(
                      labelText: 'Subject Name',
                      hintText: 'Add your Subject Name',
                    ),
                    onChanged: (String value) {
                      setState(() {
                        subjectName = value;
                      });
                    },
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: 56,
                  child: TextFormField(
                    initialValue: location,
                    decoration: const InputDecoration(
                      labelText: 'Location',
                      hintText: 'Add your Location',
                    ),
                    onChanged: (String value) {
                      setState(() {
                        location = value;
                      });
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 38),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            typeList = [true, false, false];
                          });
                        },
                        child: Row(
                          children: [
                            Checkbox(
                              value: typeList[0],
                              onChanged: (_) {
                                setState(() {
                                  typeList = [true, false, false];
                                });
                              },
                            ),
                            Text("Onsite"),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            typeList = [false, true, false];
                          });
                        },
                        child: Row(
                          children: [
                            Checkbox(
                              value: typeList[1],
                              onChanged: (_) {
                                setState(() {
                                  typeList = [false, true, false];
                                });
                              },
                            ),
                            Text("Online"),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            typeList = [false, false, true];
                          });
                        },
                        child: Row(
                          children: [
                            Checkbox(
                              value: typeList[2],
                              onChanged: (_) {
                                setState(() {
                                  typeList = [false, false, true];
                                });
                              },
                            ),
                            Text("Hybrid"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 50, top: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.access_time_outlined,
                        size: 20,
                        color: Color(0xFF8675A9),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            GestureDetector(
                              child: Text(
                                startTime,
                                style: TextStyle(color: Color(0xffA3A3A3)),
                              ),
                              onTap: () {
                                return showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return CupertinoDatePicker(
                                        initialDateTime: initialTimerStart,
                                        onDateTimeChanged: (DateTime newdate) {
                                          initialTimerStart = newdate;
                                          setState(() {
                                            startTime = DateFormat('kk:mm a')
                                                .format(initialTimerStart);
                                            int tempHr = int.parse(
                                                startTime.substring(0, 2));
                                            if (tempHr > 12) {
                                              if (tempHr > 21) {
                                                if (tempHr == 24) {
                                                  startTime = "00" +
                                                      startTime.substring(2);
                                                } else {
                                                  startTime = (tempHr % 12)
                                                          .toString() +
                                                      startTime.substring(2);
                                                }
                                              } else {
                                                startTime = "0" +
                                                    (tempHr % 12).toString() +
                                                    startTime.substring(2);
                                              }
                                            }
                                          });
                                        },
                                        mode: CupertinoDatePickerMode.time,
                                      );
                                    });
                              },
                            ),
                            Text(
                              " - ",
                              style: TextStyle(color: Color(0xffA3A3A3)),
                            ),
                            GestureDetector(
                              child: Text(
                                endTime,
                                style: TextStyle(color: Color(0xffA3A3A3)),
                              ),
                              onTap: () {
                                return showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return CupertinoDatePicker(
                                        initialDateTime: initialTimerEnd,
                                        onDateTimeChanged: (DateTime newdate) {
                                          initialTimerEnd = newdate;
                                          setState(() {
                                            endTime = DateFormat('kk:mm a')
                                                .format(initialTimerEnd);
                                            int tempHr = int.parse(
                                                endTime.substring(0, 2));
                                            if (tempHr > 12) {
                                              if (tempHr > 21) {
                                                endTime =
                                                    (tempHr % 12).toString() +
                                                        endTime.substring(2);
                                              } else {
                                                endTime = "0" +
                                                    (tempHr % 12).toString() +
                                                    endTime.substring(2);
                                              }
                                            }
                                          });
                                        },
                                        mode: CupertinoDatePickerMode.time,
                                      );
                                    });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 50, top: 20),
                  child: Row(
                    children: [
                      Icon(
                        Icons.access_time_outlined,
                        size: 20,
                        color: Color(0xFF8675A9),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: 20,
                        ),
                        child: GestureDetector(
                          child: Text(
                            allDayString[weeklyDay],
                            style: TextStyle(color: Color(0xffA3A3A3)),
                          ),
                          onTap: () {
                            return showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return CupertinoPicker(
                                    backgroundColor: Colors.white,
                                    itemExtent: 30,
                                    scrollController:
                                        FixedExtentScrollController(
                                            initialItem: weeklyDay),
                                    children: allDay,
                                    onSelectedItemChanged: (value) {
                                      setState(() {
                                        weeklyDay = value;
                                      });
                                    },
                                  );
                                });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          })),
    );
  }
}
