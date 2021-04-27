import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kelena/main.dart';
import 'package:kelena/models/user.dart';
import 'package:kelena/screens/instructorList.dart';
import 'package:kelena/widgets/student/bottomNavBar.dart';
import 'package:kelena/screens/favoriteInstructor.dart';
import 'package:kelena/screens/studentSchedule.dart';

class Student extends StatefulWidget {
  @override
  _StudentState createState() => _StudentState();
}

class _StudentState extends State<Student> with SingleTickerProviderStateMixin {
  int _selectedTabIndex = 0;
  User student = User(
    id: "id1",
    name: "Thanawat Benjachatriroj",
    email: "thanawat.bcr@gmail.com",
    role: "student",
    lectures: [
      LectureDetails(
        id: "lec1",
        subjectId: "MTH102",
        name: "Mathematics II",
        room: "CB2312",
        day: "Mon",
        from: "10:30",
        to: "12:30",
        type: "Hybrid",
      ),
      LectureDetails(
        id: "lec2",
        subjectId: "CSC217",
        name: "Operating Systems",
        room: "CB2308",
        day: "Tue",
        from: "10:30",
        to: "12:00",
        type: "Hybrid",
      ),
      LectureDetails(
        id: "lec3",
        subjectId: "CSC231",
        name: "Agile Software Engineering",
        room: "CB2306",
        day: "Mon",
        from: "13:30",
        to: "16:30",
        type: "Online",
      ),
      LectureDetails(
        id: "lec4",
        subjectId: "LNG322",
        name: "Academic Writting",
        room: "CB2305",
        day: "Wed",
        from: "09:00",
        to: "12:00",
        type: "Online",
      ),
      LectureDetails(
        id: "lec5",
        subjectId: "MTH102",
        name: "Mathematics II",
        room: "CB2301",
        day: "Thu",
        from: "10:30",
        to: "12:30",
        type: "Hybrid",
      ),
      LectureDetails(
        id: "lec6",
        subjectId: "CSC234",
        name: "Mobile Application",
        room: "Classroom 4/2",
        day: "Thu",
        from: "14:00",
        to: "18:00",
        type: "Online",
      ),
      LectureDetails(
        id: "lec7",
        subjectId: "GEN351",
        name: "Management and Leadership",
        room: "SCL261",
        day: "Fri",
        from: "08:30",
        to: "11:30",
        type: "Online",
      ),
      LectureDetails(
        id: "lec8",
        subjectId: "CSC217",
        name: "Operating Systems",
        room: "CB2306",
        day: "Fri",
        from: "12:50",
        to: "14:20",
        type: "Hybrid",
      ),
    ],
    favoriteLectures: [
      FavoriteLectureLists(lectureId: "teacher1"),
      // FavoriteLectureLists(lectureId: "teacher2"),
    ],
    appointments: [
      AppointmentDetails(id: "app1", lectureId: "lec2", status: "Approved"),
      AppointmentDetails(id: "app2", lectureId: "lec3", status: "Rejected"),
      AppointmentDetails(id: "app3", lectureId: "lec1", status: "Pending"),
    ],
  );
  List<User> teachers = [
    User(
      id: "teacher1",
      name: "Ben Malaja",
      email: "ben.mala@gmail.com",
      role: "teacher",
      lectures: [
        LectureDetails(
          id: "lec2",
          subjectId: "CSC217",
          name: "Operating Systems",
          room: "CB2308",
          day: "Tue",
          from: "10:30",
          to: "12:00",
          type: "Hybrid",
        ),
        LectureDetails(
          id: "lec8",
          subjectId: "CSC217",
          name: "Operating Systems",
          room: "CB2306",
          day: "Fri",
          from: "12:50",
          to: "14:20",
          type: "Hybrid",
        ),
      ],
    ),
    User(
      id: "teacher2",
      name: "Noname Nolastname",
      email: "no.no@gmail.com",
      role: "teacher",
      lectures: [
        LectureDetails(
          id: "lec1",
          subjectId: "MTH102",
          name: "Mathematics II",
          room: "CB2312",
          day: "Mon",
          from: "10:30",
          to: "12:30",
          type: "Hybrid",
        ),
        LectureDetails(
          id: "lec5",
          subjectId: "MTH102",
          name: "Mathematics II",
          room: "CB2301",
          day: "Thu",
          from: "10:30",
          to: "12:30",
          type: "Hybrid",
        ),
        LectureDetails(
          id: "lec9",
          subjectId: "MTH103",
          name: "Mathematics I",
          room: "CB2306",
          day: "Fri",
          from: "10:50",
          to: "12:20",
          type: "Hybrid",
        ),
      ],
    ),
  ];
  List<User> favTeacher = [];
  void filterFavTeacher() {
    for (var i = 0; i < teachers.length; i++) {
      for (var j = 0; j < student.favoriteLectures.length; j++) {
        if (teachers[i].id == student.favoriteLectures[j].lectureId) {
          favTeacher.add(teachers[i]);
          // print("asd");
        }
      }
    }
  }

  @override
  void initState() {
    filterFavTeacher();
    super.initState();
  }

  @override
  _changeIndex(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          (_selectedTabIndex == 0)
              ? InstructorList(
                  selectedTabIndex: _selectedTabIndex,
                  changeIndex: _changeIndex,
                  teachers: teachers,
                  student: student)
              : (_selectedTabIndex == 1)
                  ? FavoriteInstructor(
                      selectedTabIndex: _selectedTabIndex,
                      changeIndex: _changeIndex,
                      teachers: favTeacher,
                      student: student,
                    )
                  : StudentSchedule()
        ],
      ),

      //Bottom Nav Bar
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.white),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
              ),
            ],
          ),
          height: MediaQuery.of(context).size.height * 0.09,
          child: BottomNavBar(
              selectedTabIndex: _selectedTabIndex, changeIndex: _changeIndex),
        ),
      ),
    );
  }
}
