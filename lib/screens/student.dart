import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kelena/widgets/bottomNavBar.dart';
import 'package:kelena/widgets/firstComeNavBar.dart';

import 'package:kelena/widgets/studentNavBar.dart';
import '../widgets/studentNavBar.dart';

class Student extends StatefulWidget {
  @override
  _StudentState createState() => _StudentState();
}

class _StudentState extends State<Student> with SingleTickerProviderStateMixin {
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
          StudentNavBar(
            tabIndex: _selectedTabIndex,
          )
          // FirstComeNavBar()
        ],
      ),

      //Bottom Nav Bar
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.white //White Color
            // canvasColor: Color(0xFF8675A9), //Purple Color
            ),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
              ),
            ],
            // color: Colors.white,
            // border: Border(
            //   top: BorderSide(color: Color(0xff8675A9), width: 2.0),
            // )
          ),
          height: MediaQuery.of(context).size.height * 0.09,
          child: BottomNavBar(
              selectedTabIndex: _selectedTabIndex, changeIndex: _changeIndex),
        ),
        // BottomNavigationBar(
        //   currentIndex: _selectedTabIndex,
        //   onTap: _changeIndex,
        //   items: [
        //     BottomNavigationBarItem(
        //         icon: _selectedTabIndex == 0
        //             ? Icon(
        //                 Icons.person,
        //                 size: 26,
        //                 color: Color(0xFF8675A9),
        //               )
        //             : Icon(
        //                 Icons.person_outline,
        //                 size: 26,
        //                 color: Color(0xFF8675A9),
        //               ),
        //         title: Text("Instructors",
        //             style:
        //                 TextStyle(fontSize: 11, color: Color(0xFF8675A9)))),
        //     BottomNavigationBarItem(
        //         icon: _selectedTabIndex == 1
        //             ? Icon(
        //                 Icons.favorite,
        //                 size: 26,
        //                 color: Color(0xFF8675A9),
        //               )
        //             : Icon(
        //                 Icons.favorite_outline,
        //                 size: 26,
        //                 color: Color(0xFF8675A9),
        //               ),
        //         title: Text("Favorite",
        //             style:
        //                 TextStyle(fontSize: 11, color: Color(0xFF8675A9)))),
        //     BottomNavigationBarItem(
        //         icon: _selectedTabIndex == 2
        //             ? Icon(
        //                 Icons.calendar_today,
        //                 size: 26,
        //                 color: Color(0xFF8675A9),
        //               )
        //             : Icon(
        //                 Icons.calendar_today_outlined,
        //                 size: 26,
        //                 color: Color(0xFF8675A9),
        //               ),
        //         title: Text("Calendar",
        //             style:
        //                 TextStyle(fontSize: 11, color: Color(0xFF8675A9)))),
        //   ],
        // ),
      ),
    );
  }
}
