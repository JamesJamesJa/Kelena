import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:kelena/providers/teachers.dart';
import 'package:kelena/widgets/instructor-list/dialogSubjectDetails.dart';
import 'package:kelena/widgets/student/subjectBox.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../student/subjectBox.dart';

class InstructorScheduleBody extends StatefulWidget {
  final TabController tabController;
  final String id;
  final Teachers teachers;
  final int index;
  const InstructorScheduleBody(
      {Key key, this.tabController, this.id, this.teachers, this.index})
      : super(key: key);
  @override
  _InstructorScheduleBodyState createState() => _InstructorScheduleBodyState();
}

class _InstructorScheduleBodyState extends State<InstructorScheduleBody> {
  Widget build(BuildContext context) {
    final List<Widget> myTabs = [
      Tab(text: "WED"),
      Tab(text: "THU"),
      Tab(text: "FRI"),
      Tab(text: "SAT"),
      Tab(text: "SUN"),
      Tab(text: "MON"),
      Tab(text: "TUE"),
    ];
    CalendarController _calendarController;

    _AppointmentDataSource _getCalendarDataSource() {
      List<Appointment> appointments = <Appointment>[];
      for (var i = 0; i < widget.teachers.lectureLength(widget.index); i++) {
        appointments.add(Appointment(
          startTime: DateTime(
              2021,
              4,
              4 + widget.teachers.day(widget.index, i),
              widget.teachers.fromHr(widget.index, i),
              widget.teachers.fromMn(widget.index, i),
              0,
              0,
              0),
          endTime: DateTime(
              2021,
              4,
              4 + widget.teachers.day(widget.index, i),
              widget.teachers.toHr(widget.index, i),
              widget.teachers.toMn(widget.index, i),
              0,
              0,
              0),
          subject: widget.teachers.subjectId(widget.index, i),
          color: Colors.purple.shade200,
          location:
              "${widget.teachers.room(widget.index, i)} (${widget.teachers.type(widget.index, i)})",
          notes: widget.teachers.lecId(widget.index, i) +
              "*" +
              widget.teachers.subjectName(widget.index, i) +
              "*" +
              widget.teachers.id(widget.index),
        ));
      }
      return _AppointmentDataSource(appointments);
    }

    return Container(
      padding: EdgeInsets.only(top: 10),
      height: MediaQuery.of(context).size.height * 0.72,
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
            padding: EdgeInsets.only(top: 10),
            height: MediaQuery.of(context).size.height * 0.55,
            width: MediaQuery.of(context).size.width * 0.9,
            child: TabBarView(
              controller: widget.tabController,
              children: [
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
                            return DialogSubjectDetails(
                              index: widget.index,
                              lectureId:
                                  details.appointments[0].notes.split('*')[0],
                              lecturerId:
                                  details.appointments[0].notes.split('*')[2],
                              subjectId: details.appointments[0].subject,
                              subjectName:
                                  details.appointments[0].notes.split('*')[1],
                              from: DateFormat('hh:mm a')
                                  .format(details.appointments[0].startTime),
                              to: DateFormat('hh:mm a')
                                  .format(details.appointments[0].endTime),
                              location: details.appointments[0].location,
                              teacherName: widget.teachers.name(widget.index),
                              day: "Wednesday",
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
                            return DialogSubjectDetails(
                              index: widget.index,
                              lectureId:
                                  details.appointments[0].notes.split('*')[0],
                              lecturerId:
                                  details.appointments[0].notes.split('*')[2],
                              subjectId: details.appointments[0].subject,
                              subjectName:
                                  details.appointments[0].notes.split('*')[1],
                              from: DateFormat('hh:mm a')
                                  .format(details.appointments[0].startTime),
                              to: DateFormat('hh:mm a')
                                  .format(details.appointments[0].endTime),
                              location: details.appointments[0].location,
                              teacherName: widget.teachers.name(widget.index),
                              day: "Thursday",
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
                            return DialogSubjectDetails(
                              index: widget.index,
                              lectureId:
                                  details.appointments[0].notes.split('*')[0],
                              lecturerId:
                                  details.appointments[0].notes.split('*')[2],
                              subjectId: details.appointments[0].subject,
                              subjectName:
                                  details.appointments[0].notes.split('*')[1],
                              from: DateFormat('hh:mm a')
                                  .format(details.appointments[0].startTime),
                              to: DateFormat('hh:mm a')
                                  .format(details.appointments[0].endTime),
                              location: details.appointments[0].location,
                              teacherName: widget.teachers.name(widget.index),
                              day: "Friday",
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
                            return DialogSubjectDetails(
                              index: widget.index,
                              lectureId:
                                  details.appointments[0].notes.split('*')[0],
                              lecturerId:
                                  details.appointments[0].notes.split('*')[2],
                              subjectId: details.appointments[0].subject,
                              subjectName:
                                  details.appointments[0].notes.split('*')[1],
                              from: DateFormat('hh:mm a')
                                  .format(details.appointments[0].startTime),
                              to: DateFormat('hh:mm a')
                                  .format(details.appointments[0].endTime),
                              location: details.appointments[0].location,
                              teacherName: widget.teachers.name(widget.index),
                              day: "Saturday",
                            );
                          });
                    }
                  },
                ),
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
                    return SubjectBox(
                      appointment: appointment,
                    );
                  },
                  onTap: (CalendarTapDetails details) {
                    if (details.targetElement == CalendarElement.appointment) {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return DialogSubjectDetails(
                              index: widget.index,
                              lectureId:
                                  details.appointments[0].notes.split('*')[0],
                              lecturerId:
                                  details.appointments[0].notes.split('*')[2],
                              subjectId: details.appointments[0].subject,
                              subjectName:
                                  details.appointments[0].notes.split('*')[1],
                              from: DateFormat('hh:mm a')
                                  .format(details.appointments[0].startTime),
                              to: DateFormat('hh:mm a')
                                  .format(details.appointments[0].endTime),
                              location: details.appointments[0].location,
                              teacherName: widget.teachers.name(widget.index),
                              day: "Sunday",
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
                            return DialogSubjectDetails(
                              index: widget.index,
                              lectureId:
                                  details.appointments[0].notes.split('*')[0],
                              lecturerId:
                                  details.appointments[0].notes.split('*')[2],
                              subjectId: details.appointments[0].subject,
                              subjectName:
                                  details.appointments[0].notes.split('*')[1],
                              from: DateFormat('hh:mm a')
                                  .format(details.appointments[0].startTime),
                              to: DateFormat('hh:mm a')
                                  .format(details.appointments[0].endTime),
                              location: details.appointments[0].location,
                              teacherName: widget.teachers.name(widget.index),
                              day: "Monday",
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
                    );
                  },
                  onTap: (CalendarTapDetails details) {
                    if (details.targetElement == CalendarElement.appointment) {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return DialogSubjectDetails(
                              index: widget.index,
                              lectureId:
                                  details.appointments[0].notes.split('*')[0],
                              lecturerId:
                                  details.appointments[0].notes.split('*')[2],
                              subjectId: details.appointments[0].subject,
                              subjectName:
                                  details.appointments[0].notes.split('*')[1],
                              from: DateFormat('hh:mm a')
                                  .format(details.appointments[0].startTime),
                              to: DateFormat('hh:mm a')
                                  .format(details.appointments[0].endTime),
                              location: details.appointments[0].location,
                              teacherName: widget.teachers.name(widget.index),
                              day: "Tuesday",
                            );
                          });
                    }
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
