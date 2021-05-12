import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kelena/screens/instructorList.dart';
import 'package:kelena/widgets/student/bottomNavBar.dart';
import 'package:kelena/screens/favoriteInstructor.dart';
import 'package:kelena/screens/studentSchedule.dart';

class StudentPage extends StatefulWidget {
  @override
  _StudentPageState createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage>
    with SingleTickerProviderStateMixin {
  int _selectedTabIndex = 0;

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
                )
              : (_selectedTabIndex == 1)
                  ? FavoriteInstructor(
                      selectedTabIndex: _selectedTabIndex,
                      changeIndex: _changeIndex,
                    )
                  : StudentSchedule()
        ],
      ),
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
