import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kelena/main.dart';
import 'package:kelena/models/user.dart';
import 'package:kelena/providers/teachers.dart';
import 'package:kelena/screens/instructorList.dart';
import 'package:kelena/widgets/student/bottomNavBar.dart';
import 'package:kelena/screens/favoriteInstructor.dart';
import 'package:kelena/screens/studentSchedule.dart';

class StudentPage extends StatefulWidget {
  final Teachers teachers;
  const StudentPage({Key key, this.teachers}) : super(key: key);
  @override
  _StudentPageState createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage>
    with SingleTickerProviderStateMixin {
  int _selectedTabIndex = 0;
  User student = User(
    id: "id1",
    name: "Thanawat Benjachatriroj",
    email: "thanawat.bcr@gmail.com",
    role: "student",
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

  @override
  void initState() {
    // teachers.addLecturer("teacher1", "Ben Malaja", "ben.mala@gmail.com");
    // teachers.addLecture("teacher1", "lec2", "CSC217", "Operating Systems",
    //     "CB2308", "Tue", "10:30", "12:00", "Hybrid");
    // teachers.addLecture("teacher1", "lec8", "CSC217", "Operating Systems",
    //     "CB2306", "Fri", "12:50", "14:20", "Hybrid");
    // teachers.addLecturer("teacher2", "Non Nontra", "non.nontra@gmail.com");
    // teachers.addLecture("teacher2", "lec1", "MTH102", "Mathematics II",
    //     "CB2301", "Mon", "10:30", "12:30", "Hybrid");
    // teachers.addLecture("teacher2", "lec5", "MTH102", "Mathematics II",
    //     "CB2304", "Thu", "12:30", "12:30", "Hybrid");
    // teachers.addLecture("teacher2", "lec9", "MTH103", "Mathematics III",
    //     "CB2306", "Fri", "10:50", "12:20", "Hybrid");
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
                  // teachers: teachers,
                  // student: student,
                )
              : (_selectedTabIndex == 1)
                  ? FavoriteInstructor(
                      selectedTabIndex: _selectedTabIndex,
                      changeIndex: _changeIndex,
                      // teachers: favTeacher,
                      // student: student,
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
