import 'package:flutter/material.dart';
import 'package:kelena/screens/student.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedTabIndex;
  final Function changeIndex;
  final bool isPop;
  const BottomNavBar(
      {this.selectedTabIndex, this.changeIndex, this.isPop = false});
  Widget build(BuildContext context) {
    //Bottom Nav Bar Widget
    return new Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.white),
      child: SizedBox(
        height: 54,
        child: new BottomNavigationBar(
          currentIndex: selectedTabIndex,
          onTap: (_) {
            changeIndex(_);
            if (isPop) {
              if (selectedTabIndex == 0) {
                Navigator.pop(context);
                print("Kuay");
              } else {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Student()));
                print("asd");
              }
            }
          },
          items: [
            BottomNavigationBarItem(
                icon: selectedTabIndex == 0
                    ? Icon(
                        Icons.person,
                        size: 26,
                        color: Color(0xFF8675A9),
                      )
                    : Icon(
                        Icons.person_outline,
                        size: 26,
                        color: Color(0xFF8675A9),
                      ),
                title: Text("Instructors",
                    style: TextStyle(fontSize: 11, color: Color(0xFF8675A9)))),
            BottomNavigationBarItem(
                icon: selectedTabIndex == 1
                    ? Icon(
                        Icons.favorite,
                        size: 26,
                        color: Color(0xFF8675A9),
                      )
                    : Icon(
                        Icons.favorite_outline,
                        size: 26,
                        color: Color(0xFF8675A9),
                      ),
                title: Text("Favorite",
                    style: TextStyle(fontSize: 11, color: Color(0xFF8675A9)))),
            BottomNavigationBarItem(
                icon: selectedTabIndex == 2
                    ? Icon(
                        Icons.calendar_today,
                        size: 26,
                        color: Color(0xFF8675A9),
                      )
                    : Icon(
                        Icons.calendar_today_outlined,
                        size: 26,
                        color: Color(0xFF8675A9),
                      ),
                title: Text("Calendar",
                    style: TextStyle(fontSize: 11, color: Color(0xFF8675A9)))),
          ],
        ),
      ),
    );
  }
}
