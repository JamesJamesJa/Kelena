import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kelena/providers/student.dart';
import 'package:kelena/widgets/student/dialogAddLecture.dart';
import 'package:kelena/widgets/student/subjectBox.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../student/subjectBox.dart';

class FirstComeBody extends StatefulWidget {
  final TabController tabController;
  final Student teacher;
  const FirstComeBody({Key key, this.tabController, this.teacher})
      : super(key: key);
  @override
  _FirstComeBodyState createState() => _FirstComeBodyState();
}

class _FirstComeBodyState extends State<FirstComeBody> {
  Widget build(BuildContext context) {
    int checkDay(DateTime startDate) {
      switch (DateFormat('d').format(startDate)) {
        case "4":
          {
            return 6;
          }
          break;
        case "5":
          {
            return 0;
          }
          break;
        case "6":
          {
            return 1;
          }
          break;
        case "7":
          {
            return 2;
          }
          break;
        case "8":
          {
            return 3;
          }
          break;
        case "9":
          {
            return 4;
          }
          break;
        case "10":
          {
            return 5;
          }
          break;
      }
    }

    CalendarController _calendarController;
    _AppointmentDataSource _getCalendarDataSource() {
      List<Appointment> appointments = <Appointment>[];
      for (var i = 0; i < widget.teacher.lectureLength(); i++) {
        // print(widget.teacher.id());
        var lecturesId = widget.teacher.lectureId(i);
        appointments.add(Appointment(
          startTime: DateTime(
              2021,
              4,
              4 + widget.teacher.day(lecturesId),
              widget.teacher.fromHr(lecturesId),
              widget.teacher.fromMn(lecturesId),
              0,
              0,
              0),
          endTime: DateTime(
              2021,
              4,
              4 + widget.teacher.day(lecturesId),
              widget.teacher.toHr(lecturesId),
              widget.teacher.toMn(lecturesId),
              0,
              0,
              0),
          subject: widget.teacher.subjectId(lecturesId),
          color: Colors.purple.shade200,
          location:
              "${widget.teacher.room(lecturesId)} (${widget.teacher.type(lecturesId)})",
          notes: widget.teacher.lectureId(i) +
              "*" +
              widget.teacher.subjectName(lecturesId),
        ));
      }
      return _AppointmentDataSource(appointments);
    }

    return Container(
      height: MediaQuery.of(context).size.height * 0.77,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.61,
            width: MediaQuery.of(context).size.width * 0.9,
            padding: EdgeInsets.only(top: 20),
            color: Colors.white,
            child: TabBarView(
              controller: widget.tabController,
              children: [
                SfCalendar(
                  view: CalendarView.day,
                  headerHeight: 0,
                  viewHeaderHeight: 0,
                  showCurrentTimeIndicator: false,
                  dataSource: _getCalendarDataSource(),
                  minDate: DateTime(2021, 04, 04, 0, 0, 0),
                  maxDate: DateTime(2021, 04, 04, 23, 59, 59),
                  initialDisplayDate: DateTime(2021, 04, 04, 07, 30, 00),
                  controller: _calendarController,
                  appointmentBuilder: (context, calendarAppointmentDetails) {
                    final Appointment appointment =
                        calendarAppointmentDetails.appointments.first;
                    return SubjectBox(appointment: appointment);
                  },
                  onTap: (CalendarTapDetails details) {
                    if (details.targetElement == CalendarElement.appointment) {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return DialogAddLecture(
                              addBool: false,
                              startTime: details.appointments[0].startTime,
                              endTime: details.appointments[0].endTime,
                              location: ((details.appointments[0].location)
                                  .split(" ("))[0],
                              subjectId: details.appointments[0].subject,
                              subjectName:
                                  details.appointments[0].notes.split('*')[1],
                              type: (((details.appointments[0].location)
                                      .split(" ("))[1])
                                  .substring(0, 6),
                              day: checkDay(details.appointments[0].startTime),
                              lectureId:
                                  details.appointments[0].notes.split('*')[0],
                              userId: widget.teacher.id(),
                            );
                          });
                    }
                  },
                ),
                SfCalendar(
                  view: CalendarView.day,
                  headerHeight: 0,
                  viewHeaderHeight: 0,
                  dataSource: _getCalendarDataSource(),
                  showCurrentTimeIndicator: false,
                  minDate: DateTime(2021, 04, 05, 0, 0, 0),
                  maxDate: DateTime(2021, 04, 05, 23, 59, 59),
                  initialDisplayDate: DateTime(2021, 04, 05, 07, 30, 00),
                  controller: _calendarController,
                  appointmentBuilder: (context, calendarAppointmentDetails) {
                    final Appointment appointment =
                        calendarAppointmentDetails.appointments.first;
                    return SubjectBox(appointment: appointment);
                  },
                  onTap: (CalendarTapDetails details) {
                    if (details.targetElement == CalendarElement.appointment) {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return DialogAddLecture(
                              addBool: false,
                              startTime: details.appointments[0].startTime,
                              endTime: details.appointments[0].endTime,
                              location: ((details.appointments[0].location)
                                  .split(" ("))[0],
                              subjectId: details.appointments[0].subject,
                              subjectName:
                                  details.appointments[0].notes.split('*')[1],
                              type: (((details.appointments[0].location)
                                      .split(" ("))[1])
                                  .substring(0, 6),
                              day: checkDay(details.appointments[0].startTime),
                              lectureId:
                                  details.appointments[0].notes.split('*')[0],
                              userId: widget.teacher.id(),
                            );
                          });
                    }
                  },
                ),
                SfCalendar(
                  view: CalendarView.day,
                  headerHeight: 0,
                  viewHeaderHeight: 0,
                  dataSource: _getCalendarDataSource(),
                  showCurrentTimeIndicator: false,
                  minDate: DateTime(2021, 04, 06, 0, 0, 0),
                  maxDate: DateTime(2021, 04, 06, 23, 59, 59),
                  initialDisplayDate: DateTime(2021, 04, 06, 07, 30, 00),
                  controller: _calendarController,
                  appointmentBuilder: (context, calendarAppointmentDetails) {
                    final Appointment appointment =
                        calendarAppointmentDetails.appointments.first;
                    return GestureDetector(
                      child: SubjectBox(appointment: appointment),
                      onTap: () {},
                    );
                  },
                  onTap: (CalendarTapDetails details) {
                    if (details.targetElement == CalendarElement.appointment) {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return DialogAddLecture(
                              addBool: false,
                              startTime: details.appointments[0].startTime,
                              endTime: details.appointments[0].endTime,
                              location: ((details.appointments[0].location)
                                  .split(" ("))[0],
                              subjectId: details.appointments[0].subject,
                              subjectName:
                                  details.appointments[0].notes.split('*')[1],
                              type: (((details.appointments[0].location)
                                      .split(" ("))[1])
                                  .substring(0, 6),
                              day: checkDay(details.appointments[0].startTime),
                              lectureId:
                                  details.appointments[0].notes.split('*')[0],
                              userId: widget.teacher.id(),
                            );
                          });
                    }
                  },
                ),
                SfCalendar(
                  view: CalendarView.day,
                  headerHeight: 0,
                  viewHeaderHeight: 0,
                  dataSource: _getCalendarDataSource(),
                  showCurrentTimeIndicator: false,
                  minDate: DateTime(2021, 04, 07, 0, 0, 0),
                  maxDate: DateTime(2021, 04, 07, 23, 59, 59),
                  initialDisplayDate: DateTime(2021, 04, 07, 07, 30, 00),
                  controller: _calendarController,
                  appointmentBuilder: (context, calendarAppointmentDetails) {
                    final Appointment appointment =
                        calendarAppointmentDetails.appointments.first;
                    return SubjectBox(appointment: appointment);
                  },
                  onTap: (CalendarTapDetails details) {
                    if (details.targetElement == CalendarElement.appointment) {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return DialogAddLecture(
                              addBool: false,
                              startTime: details.appointments[0].startTime,
                              endTime: details.appointments[0].endTime,
                              location: ((details.appointments[0].location)
                                  .split(" ("))[0],
                              subjectId: details.appointments[0].subject,
                              subjectName:
                                  details.appointments[0].notes.split('*')[1],
                              type: (((details.appointments[0].location)
                                      .split(" ("))[1])
                                  .substring(0, 6),
                              day: checkDay(details.appointments[0].startTime),
                              lectureId:
                                  details.appointments[0].notes.split('*')[0],
                              userId: widget.teacher.id(),
                            );
                          });
                    }
                  },
                ),
                SfCalendar(
                  view: CalendarView.day,
                  headerHeight: 0,
                  viewHeaderHeight: 0,
                  dataSource: _getCalendarDataSource(),
                  showCurrentTimeIndicator: false,
                  minDate: DateTime(2021, 04, 08, 0, 0, 0),
                  maxDate: DateTime(2021, 04, 08, 23, 59, 59),
                  initialDisplayDate: DateTime(2021, 04, 08, 07, 30, 00),
                  controller: _calendarController,
                  appointmentBuilder: (context, calendarAppointmentDetails) {
                    final Appointment appointment =
                        calendarAppointmentDetails.appointments.first;
                    return SubjectBox(appointment: appointment);
                  },
                  onTap: (CalendarTapDetails details) {
                    if (details.targetElement == CalendarElement.appointment) {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return DialogAddLecture(
                              addBool: false,
                              startTime: details.appointments[0].startTime,
                              endTime: details.appointments[0].endTime,
                              location: ((details.appointments[0].location)
                                  .split(" ("))[0],
                              subjectId: details.appointments[0].subject,
                              subjectName:
                                  details.appointments[0].notes.split('*')[1],
                              type: (((details.appointments[0].location)
                                      .split(" ("))[1])
                                  .substring(0, 6),
                              day: checkDay(details.appointments[0].startTime),
                              lectureId:
                                  details.appointments[0].notes.split('*')[0],
                              userId: widget.teacher.id(),
                            );
                          });
                    }
                  },
                ),
                SfCalendar(
                  view: CalendarView.day,
                  headerHeight: 0,
                  viewHeaderHeight: 0,
                  dataSource: _getCalendarDataSource(),
                  showCurrentTimeIndicator: false,
                  minDate: DateTime(2021, 04, 09, 0, 0, 0),
                  maxDate: DateTime(2021, 04, 09, 23, 59, 59),
                  initialDisplayDate: DateTime(2021, 04, 09, 07, 30, 00),
                  controller: _calendarController,
                  appointmentBuilder: (context, calendarAppointmentDetails) {
                    final Appointment appointment =
                        calendarAppointmentDetails.appointments.first;
                    return SubjectBox(appointment: appointment);
                  },
                  onTap: (CalendarTapDetails details) {
                    if (details.targetElement == CalendarElement.appointment) {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return DialogAddLecture(
                              addBool: false,
                              startTime: details.appointments[0].startTime,
                              endTime: details.appointments[0].endTime,
                              location: ((details.appointments[0].location)
                                  .split(" ("))[0],
                              subjectId: details.appointments[0].subject,
                              subjectName:
                                  details.appointments[0].notes.split('*')[1],
                              type: (((details.appointments[0].location)
                                      .split(" ("))[1])
                                  .substring(0, 6),
                              day: checkDay(details.appointments[0].startTime),
                              lectureId:
                                  details.appointments[0].notes.split('*')[0],
                              userId: widget.teacher.id(),
                            );
                          });
                    }
                  },
                ),
                SfCalendar(
                  view: CalendarView.day,
                  headerHeight: 0,
                  viewHeaderHeight: 0,
                  dataSource: _getCalendarDataSource(),
                  showCurrentTimeIndicator: false,
                  minDate: DateTime(2021, 04, 10, 0, 0, 0),
                  maxDate: DateTime(2021, 04, 10, 23, 59, 59),
                  initialDisplayDate: DateTime(2021, 04, 10, 07, 30, 00),
                  controller: _calendarController,
                  appointmentBuilder: (context, calendarAppointmentDetails) {
                    final Appointment appointment =
                        calendarAppointmentDetails.appointments.first;
                    return SubjectBox(appointment: appointment);
                  },
                  onTap: (CalendarTapDetails details) {
                    if (details.targetElement == CalendarElement.appointment) {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return DialogAddLecture(
                              addBool: false,
                              startTime: details.appointments[0].startTime,
                              endTime: details.appointments[0].endTime,
                              location: ((details.appointments[0].location)
                                  .split(" ("))[0],
                              subjectId: details.appointments[0].subject,
                              subjectName:
                                  details.appointments[0].notes.split('*')[1],
                              type: (((details.appointments[0].location)
                                      .split(" ("))[1])
                                  .substring(0, 6),
                              day: checkDay(details.appointments[0].startTime),
                              lectureId:
                                  details.appointments[0].notes.split('*')[0],
                              userId: widget.teacher.id(),
                            );
                          });
                    }
                  },
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(color: Colors.grey))),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.grey,
                        size: 16,
                      ),
                      Text(
                        'Add your lecture class',
                        style: TextStyle(
                          color: Colors.grey,
                          // fontWeight: FontWeight.w200,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return DialogAddLecture(
                            addBool: true,
                            startTime: DateTime(2021, 4, 4, 8, 00),
                            endTime: DateTime(2021, 4, 4, 12, 00),
                            location: "",
                            subjectId: "",
                            subjectName: "",
                            type: "",
                            day: 0,
                            userId: widget.teacher.id(),
                          );
                        });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

_AppointmentDataSource _getCalendarDataSourceMon() {
  List<Appointment> appointments = <Appointment>[];
  appointments.add(Appointment(
    startTime: DateTime(2021, 4, 5, 10, 30, 0, 0, 0),
    endTime: DateTime(2021, 4, 5, 12, 30, 0, 0, 0)
    // .add(Duration(minutes: 120))
    ,
    subject: 'MTH102',
    color: Colors.purple.shade200,
    startTimeZone: '',
    endTimeZone: '',
    location: 'CB2312 (Hybrid)',
    notes: 'Mathematics II',
  ));
  return _AppointmentDataSource(appointments);
}

_AppointmentDataSource _getCalendarDataSourceTue() {
  List<Appointment> appointments = <Appointment>[];
  appointments.add(Appointment(
    startTime: DateTime(2021, 4, 6, 10, 30, 0, 0, 0),
    endTime: DateTime(2021, 4, 6, 12, 00, 0, 0, 0),
    subject: 'CSC217',
    color: Colors.purple.shade200,
    startTimeZone: '',
    endTimeZone: '',
    location: 'CB2308 (Hybrid)',
    notes: 'Operating Systems',
  ));

  appointments.add(Appointment(
    startTime: DateTime(2021, 4, 6, 13, 30, 0, 0, 0),
    endTime: DateTime(2021, 4, 6, 16, 30, 0, 0, 0),
    subject: 'CSC231',
    color: Colors.purple.shade200,
    startTimeZone: '',
    endTimeZone: '',
    location: 'CB2306 (Online)',
    notes: 'Agile Software Engineering',
  ));
  return _AppointmentDataSource(appointments);
}

_AppointmentDataSource _getCalendarDataSourceWed() {
  List<Appointment> appointments = <Appointment>[];
  appointments.add(Appointment(
    startTime: DateTime(2021, 4, 7, 9, 00, 0, 0, 0),
    endTime: DateTime(2021, 4, 7, 12, 00, 0, 0, 0),
    subject: 'LNG322',
    color: Colors.purple.shade200,
    startTimeZone: '',
    endTimeZone: '',
    location: 'CB2305 (Online)',
    notes: 'Academic Writting',
  ));
  return _AppointmentDataSource(appointments);
}

_AppointmentDataSource _getCalendarDataSourceThu() {
  List<Appointment> appointments = <Appointment>[];
  appointments.add(Appointment(
    startTime: DateTime(2021, 4, 8, 10, 30, 0, 0, 0),
    endTime: DateTime(2021, 4, 8, 12, 30, 0, 0, 0),
    subject: 'MTH102',
    color: Colors.purple.shade200,
    startTimeZone: '',
    endTimeZone: '',
    location: 'CB2301 (Hybrid)',
    notes: 'Mathematics II',
  ));
  appointments.add(Appointment(
    startTime: DateTime(2021, 4, 8, 14, 00, 0, 0, 0),
    endTime: DateTime(2021, 4, 8, 18, 00, 0, 0, 0),
    subject: 'CSC234',
    color: Colors.purple.shade200,
    startTimeZone: '',
    endTimeZone: '',
    location: 'Classroom 4/2 (Online)',
    notes: 'Mobile Application',
  ));
  return _AppointmentDataSource(appointments);
}

_AppointmentDataSource _getCalendarDataSourceFri() {
  List<Appointment> appointments = <Appointment>[];
  appointments.add(Appointment(
    startTime: DateTime(2021, 4, 9, 8, 30, 0, 0, 0),
    endTime: DateTime(2021, 4, 9, 11, 30, 0, 0, 0),
    subject: 'GEN351',
    color: Colors.purple.shade200,
    startTimeZone: '',
    endTimeZone: '',
    location: '(Online)',
    notes: 'Management and Leadership',
  ));

  appointments.add(Appointment(
    startTime: DateTime(2021, 4, 9, 12, 50, 0, 0, 0),
    endTime: DateTime(2021, 4, 9, 14, 20, 0, 0, 0),
    subject: 'CSC217',
    color: Colors.purple.shade200,
    startTimeZone: '',
    endTimeZone: '',
    location: 'CB2306 (Hybrid)',
    notes: 'Operating Systems',
  ));
  return _AppointmentDataSource(appointments);
}

// _AppointmentDataSource _getCalendarDataSource() {
//   List<Appointment> appointments = <Appointment>[];

//   return _AppointmentDataSource(appointments);
// }

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}

// ListView.builder(
//   padding: EdgeInsets.only(top: 0, right: 40, bottom: 5, left: 40),
//   // controller: widget.tabController,
//   itemBuilder: (ctx, i) => Container(
//     padding: EdgeInsets.only(top: 10, right: 0, bottom: 10, left: 10),
//     child: Row(
//       children: [
//         Container(
//             width: 50,
//             child: Text(
//               timeFormat(i),
//               style: TextStyle(
//                 fontSize: 10,
//                 color: Color(0xffB9B9B9),
//               ),
//             )),
//         Expanded(
//           child: Divider(
//             thickness: 1.2,
//             indent: 10,
//             endIndent: 10,
//             color: Color(0xff9C8CBE),
//           ),
//         ),
//       ],
//     ),
//   ),
//   itemCount: 25,
// ),
