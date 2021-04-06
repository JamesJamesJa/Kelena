import 'package:flutter/material.dart';
import 'package:kelena/widgets/subjectBox.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'subjectBox.dart';

class FirstComeBody extends StatefulWidget {
  final TabController tabController;
  const FirstComeBody({Key key, this.tabController}) : super(key: key);
  @override
  _FirstComeBodyState createState() => _FirstComeBodyState();
}

class _FirstComeBodyState extends State<FirstComeBody> {
  Widget build(BuildContext context) {
    CalendarController _calendarController;
    @override
    initState() {
      _calendarController = CalendarController();
      _calendarController.selectedDate = DateTime(2020, 04, 5);
      super.initState();
    }

    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      // width: double.infinity,
      color: Colors.white,
      child: TabBarView(
        controller: widget.tabController,
        children: [
          SfCalendar(
            view: CalendarView.day,
            headerHeight: 0,
            viewHeaderHeight: 0,
            // allowViewNavigation: true,
            showCurrentTimeIndicator: false,
            // onTap: showSubjectDetail(),
            // dataSource: _getCalendarDataSource(),
            minDate: DateTime(2021, 04, 04, 0, 0, 0),
            maxDate: DateTime(2021, 04, 04, 23, 59, 59),
            initialDisplayDate: DateTime(2021, 04, 04, 09, 30, 00),
            controller: _calendarController,
            appointmentBuilder: (context, calendarAppointmentDetails) {
              final Appointment appointment =
                  calendarAppointmentDetails.appointments.first;
              return SubjectBox(appointment: appointment);
            },
          ),
          SfCalendar(
            view: CalendarView.day,
            headerHeight: 0,
            viewHeaderHeight: 0,
            dataSource: _getCalendarDataSourceMon(),
            showCurrentTimeIndicator: false,
            minDate: DateTime(2021, 04, 05, 0, 0, 0),
            maxDate: DateTime(2021, 04, 05, 23, 59, 59),
            initialDisplayDate: DateTime(2021, 04, 05, 09, 30, 00),
            controller: _calendarController,
            appointmentBuilder: (context, calendarAppointmentDetails) {
              final Appointment appointment =
                  calendarAppointmentDetails.appointments.first;
              return SubjectBox(appointment: appointment);
            },
          ),
          SfCalendar(
            view: CalendarView.day,
            headerHeight: 0,
            viewHeaderHeight: 0,
            dataSource: _getCalendarDataSourceTue(),
            showCurrentTimeIndicator: false,
            minDate: DateTime(2021, 04, 06, 0, 0, 0),
            maxDate: DateTime(2021, 04, 06, 23, 59, 59),
            initialDisplayDate: DateTime(2021, 04, 06, 09, 30, 00),
            controller: _calendarController,
            appointmentBuilder: (context, calendarAppointmentDetails) {
              final Appointment appointment =
                  calendarAppointmentDetails.appointments.first;
              return SubjectBox(appointment: appointment);
            },
          ),
          SfCalendar(
            view: CalendarView.day,
            headerHeight: 0,
            viewHeaderHeight: 0,
            dataSource: _getCalendarDataSourceWed(),
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
          ),
          SfCalendar(
            view: CalendarView.day,
            headerHeight: 0,
            viewHeaderHeight: 0,
            dataSource: _getCalendarDataSourceThu(),
            showCurrentTimeIndicator: false,
            minDate: DateTime(2021, 04, 08, 0, 0, 0),
            maxDate: DateTime(2021, 04, 08, 23, 59, 59),
            initialDisplayDate: DateTime(2021, 04, 08, 09, 30, 00),
            controller: _calendarController,
            appointmentBuilder: (context, calendarAppointmentDetails) {
              final Appointment appointment =
                  calendarAppointmentDetails.appointments.first;
              return SubjectBox(appointment: appointment);
            },
          ),
          SfCalendar(
            view: CalendarView.day,
            headerHeight: 0,
            viewHeaderHeight: 0,
            dataSource: _getCalendarDataSourceFri(),
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
          ),
          SfCalendar(
            view: CalendarView.day,
            headerHeight: 0,
            viewHeaderHeight: 0,
            // dataSource: _getCalendarDataSource(),
            showCurrentTimeIndicator: false,
            minDate: DateTime(2021, 04, 10, 0, 0, 0),
            maxDate: DateTime(2021, 04, 10, 23, 59, 59),
            initialDisplayDate: DateTime(2021, 04, 10, 09, 30, 00),
            controller: _calendarController,
            appointmentBuilder: (context, calendarAppointmentDetails) {
              final Appointment appointment =
                  calendarAppointmentDetails.appointments.first;
              return SubjectBox(appointment: appointment);
            },
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
