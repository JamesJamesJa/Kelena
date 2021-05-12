import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:kelena/providers/student.dart';
import 'package:kelena/widgets/student/dialogAddLecture.dart';
import 'package:kelena/widgets/student/dialogSubjectDetauilswithEdit.dart';
import 'package:kelena/widgets/student/subjectBox.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../student/subjectBox.dart';

class StudentScheduleBody extends StatefulWidget {
  final Student student;
  final TabController tabController;
  const StudentScheduleBody({Key key, this.tabController, this.student})
      : super(key: key);
  @override
  _StudentScheduleBodyState createState() => _StudentScheduleBodyState();
}

class _StudentScheduleBodyState extends State<StudentScheduleBody> {
  _AppointmentDataSource _getCalendarDataSource() {
    List<Appointment> appointments = <Appointment>[];
    for (var i = 0; i < widget.student.lectureLength(); i++) {
      var lecturesId = widget.student.lectureId(i);
      appointments.add(Appointment(
        startTime: DateTime(
            2021,
            4,
            4 + widget.student.day(lecturesId),
            widget.student.fromHr(lecturesId),
            widget.student.fromMn(lecturesId),
            0,
            0,
            0),
        endTime: DateTime(
            2021,
            4,
            4 + widget.student.day(lecturesId),
            widget.student.toHr(lecturesId),
            widget.student.toMn(lecturesId),
            0,
            0,
            0),
        subject: widget.student.subjectId(lecturesId),
        color: Colors.purple.shade200,
        location:
            "${widget.student.room(lecturesId)} (${widget.student.type(lecturesId)})",
        notes: widget.student.lectureId(i) +
            "*" +
            widget.student.subjectName(lecturesId),
      ));
    }
    return _AppointmentDataSource(appointments);
  }

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

    final List<Widget> myTabs = [
      Tab(text: "SUN"),
      Tab(text: "MON"),
      Tab(text: "TUE"),
      Tab(text: "WED"),
      Tab(text: "THU"),
      Tab(text: "FRI"),
      Tab(text: "SAT"),
    ];
    CalendarController _calendarController;

    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            padding: EdgeInsets.only(
              top: 10.0,
              bottom: 20,
            ),
            color: Colors.white,
            child: TabBar(
              indicatorPadding: EdgeInsets.all(3),
              labelPadding: EdgeInsets.all(0),
              controller: widget.tabController,
              labelColor: Color(0xFF8675A9),
              unselectedLabelColor: Color(0xff8E8E93),
              labelStyle: GoogleFonts.montserrat(
                  textStyle:
                      TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500)),
              unselectedLabelStyle: GoogleFonts.montserrat(
                textStyle:
                    TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
              ),
              indicatorColor: Color(0xFF8675A9),
              tabs: myTabs,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.52,
            width: MediaQuery.of(context).size.width * 0.9,
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
                            return DialogSubjectDetailswithEdit(
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
                              userId: "6GL6X9a0wFZNAxS8y1yb",
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
                            return DialogSubjectDetailswithEdit(
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
                              userId: "6GL6X9a0wFZNAxS8y1yb",
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
                            return DialogSubjectDetailswithEdit(
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
                              userId: "6GL6X9a0wFZNAxS8y1yb",
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
                            return DialogSubjectDetailswithEdit(
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
                              userId: "6GL6X9a0wFZNAxS8y1yb",
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
                            return DialogSubjectDetailswithEdit(
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
                              userId: "6GL6X9a0wFZNAxS8y1yb",
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
                            return DialogSubjectDetailswithEdit(
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
                              userId: "6GL6X9a0wFZNAxS8y1yb",
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
                            return DialogSubjectDetailswithEdit(
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
                              userId: "6GL6X9a0wFZNAxS8y1yb",
                            );
                          });
                    }
                  },
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.5,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide(
                        color: Colors.grey,
                        width: 0.6,
                      ),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                          userId: widget.student.id(),
                        );
                      });
                },
              ),
            ),
          )
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
