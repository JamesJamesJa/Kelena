import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:kelena/providers/student.dart';

class DialogAddLecture extends StatefulWidget {
  @override
  _DialogAddLectureState createState() => new _DialogAddLectureState();
}

class _DialogAddLectureState extends State<DialogAddLecture> {
  String startTime = "Start Time";
  String endTime = "End Time";
  String subjectId, subjectName, location;
  List<bool> type = [false, false, false];
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
  DateTime initialTimerStart = DateTime(2020, 12, 1, 8, 00),
      initialTimerEnd = DateTime(2020, 12, 1, 12, 00);
  String typeCheck() {
    if (type[0]) {
      return "Onsite";
    } else if (type[1]) {
      return "Online";
    } else {
      return "Hybrid";
    }
  }

  @override
  Widget build(BuildContext context) {
    int _selectedValue = 0;
    return Scaffold(
      body: Container(
          // color: Colors.red,
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
                          // padding: EdgeInsets.only(top: 0, bottom: 0),
                          child: Text(
                            'Save',
                            style: TextStyle(
                              color: Colors.white,
                              // fontWeight: FontWeight.w200,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        onPressed: () {
                          student.addLecture(
                              "lecTemp",
                              subjectId,
                              subjectName,
                              location,
                              allDayStringData[weeklyDay],
                              startTime,
                              endTime,
                              typeCheck());
                          // student.addLecture("lec10", "MTH999", "Mathematics II",
                          //     "CB2312", "Mon", "5:30", "06:30", "Hybrid");
                          Navigator.of(context).pop();
                          // print("$student");
                          // showDialog(
                          //     context: context,
                          //     builder: (context) {
                          //       return DialogAddSchedule();
                          //     });
                        },
                      ),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: 56,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Subject ID',
                      hintText: 'Add your Subject ID',
                    ),
                    onSaved: (String value) {
                      setState(() {
                        subjectId = value;
                      });

                      // This optional block of code can be used to run
                      // code when the user saves the form.
                    },
                    // validator: (String value) {
                    //   return (value != null && value.contains('@'))
                    //       ? 'Do not use the @ char.'
                    //       : null;
                    // },
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: 56,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Subject Name',
                      hintText: 'Add your Subject Name',
                    ),
                    onSaved: (String value) {
                      setState(() {
                        subjectName = value;
                      });

                      // This optional block of code can be used to run
                      // code when the user saves the form.
                    },
                    // validator: (String value) {
                    //   return (value != null && value.contains('@'))
                    //       ? 'Do not use the @ char.'
                    //       : null;
                    // },
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: 56,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Location',
                      hintText: 'Add your Location',
                    ),
                    onSaved: (String value) {
                      setState(() {
                        location = value;
                      });

                      // This optional block of code can be used to run
                      // code when the user saves the form.
                    },
                    // validator: (String value) {
                    //   return (value != null && value.contains('@'))
                    //       ? 'Do not use the @ char.'
                    //       : null;
                    // },
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
                            type = [true, false, false];
                          });
                        },
                        child: Row(
                          children: [
                            Checkbox(
                              value: type[0],
                              onChanged: (_) {
                                setState(() {
                                  type = [true, false, false];
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
                            type = [false, true, false];
                          });
                        },
                        child: Row(
                          children: [
                            Checkbox(
                              value: type[1],
                              onChanged: (_) {
                                setState(() {
                                  type = [false, true, false];
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
                            type = [false, false, true];
                          });
                        },
                        child: Row(
                          children: [
                            Checkbox(
                              value: type[2],
                              onChanged: (_) {
                                setState(() {
                                  type = [false, false, true];
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
                                          });
                                          // print(startTime);
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
                                          });

                                          // print(newdate);
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
                                    // key: _selectedValue,
                                    backgroundColor: Colors.white,
                                    itemExtent: 30,
                                    scrollController:
                                        FixedExtentScrollController(
                                            initialItem: _selectedValue),
                                    children: allDay,
                                    onSelectedItemChanged: (value) {
                                      setState(() {
                                        weeklyDay = value;
                                        // print(_selectedValue);
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

                // Divider(
                //   thickness: 1,
                //   indent: 40,
                //   endIndent: 40,
                //   color: Color(0xff9C8CBE),
                // ),

                // Container(
                //   width: MediaQuery.of(context).size.width * 0.7,
                //   height: 56,
                //   child: Row(
                //     children: [
                //       CheckboxListTile(
                //           title: Text('Onsite'),
                //           value: onWhat['Onsite'],
                //           activeColor: Colors.pink,
                //           checkColor: Colors.white,
                //           onChanged: (bool value) {
                //             setState(() {
                //               onWhat['Onsite'] = value;
                //             });
                //           })
                //     ],
                //   ),
                // ),
                Container(),
                Container(),
                Container(),
              ],
            );
          })),
    );
  }
}
