import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kelena/providers/teacher.dart';
import 'package:kelena/widgets/instructor/dialogEditTeacherSubject.dart';
import 'package:kelena/widgets/student/dialogAddLecture.dart';
import 'package:kelena/widgets/student/subjectBox.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../student/subjectBox.dart';

class FirstComeBody extends StatefulWidget {
  final TabController tabController;
  final Teacher teacher;
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
      var length = 0;
      if (widget.teacher != null) {
        length = widget.teacher.lectureLength();
      }
      for (var i = 0; i < length; i++) {
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
                            return DialogEditTeacherSubject(
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
                            return DialogEditTeacherSubject(
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
                            return DialogEditTeacherSubject(
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
                            return DialogEditTeacherSubject(
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
                            return DialogEditTeacherSubject(
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
                            return DialogEditTeacherSubject(
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
                            return DialogEditTeacherSubject(
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

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}
