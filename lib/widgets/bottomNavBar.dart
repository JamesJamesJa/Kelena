import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedTabIndex = 0;

  List _pages = [
    Text("Instructor List"),
    Text("Instructor List"),
    Text("Your Schedule"),
  ];

  List _nameNavBar = [
    Text("Instructor List", style: TextStyle(color: Colors.white)),
    Text("Instructor List", style: TextStyle(color: Colors.white)),
    Text("Your Schedule", style: TextStyle(color: Colors.white)),
  ];

  _changeIndex(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  Widget build(BuildContext context) {
    //Bottom Nav Bar Widget
    return new Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.white //White Color
          // canvasColor: Color(0xFF8675A9), //Purple Color
          ),
      child: SizedBox(
        height: 54,
        child: new BottomNavigationBar(
          currentIndex: _selectedTabIndex,
          onTap: _changeIndex,
          items: [
            BottomNavigationBarItem(
                icon: _selectedTabIndex == 0
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
                icon: _selectedTabIndex == 1
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
                icon: _selectedTabIndex == 2
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

  // Widget build(BuildContext context) {
  //   //Bottom Nav Bar Widget
  //   return new Theme(
  //     data: Theme.of(context).copyWith(
  //       canvasColor: Color(0xFF8675A9), //Purple Color
  //     ),
  //     child: SizedBox(
  //       height: 80,
  //       child: new BottomNavigationBar(
  //         currentIndex: _selectedTabIndex,
  //         onTap: _changeIndex,
  //         items: [
  //           BottomNavigationBarItem(
  //               icon: Icon(
  //                 Icons.person,
  //                 size: 35,
  //                 color:
  //                     _selectedTabIndex == 0 ? Color(0xFFEFBBCF) : Colors.white,
  //               ),
  //               title: Text("Instructors",
  //                   style: TextStyle(
  //                       fontSize: 11,
  //                       color: _selectedTabIndex == 0
  //                           ? Color(0xFFEFBBCF) //Pink Color
  //                           : Colors.white))),
  //           BottomNavigationBarItem(
  //               icon: Icon(
  //                 Icons.favorite,
  //                 size: 35,
  //                 color:
  //                     _selectedTabIndex == 1 ? Color(0xFFEFBBCF) : Colors.white,
  //               ),
  //               title: Text("Favorite",
  //                   style: TextStyle(
  //                       fontSize: 11,
  //                       color: _selectedTabIndex == 1
  //                           ? Color(0xFFEFBBCF)
  //                           : Colors.white))),
  //           BottomNavigationBarItem(
  //               icon: Icon(
  //                 Icons.calendar_today,
  //                 size: 35,
  //                 color:
  //                     _selectedTabIndex == 2 ? Color(0xFFEFBBCF) : Colors.white,
  //               ),
  //               title: Text("Caalendar",
  //                   style: TextStyle(
  //                       fontSize: 11,
  //                       color: _selectedTabIndex == 2
  //                           ? Color(0xFFEFBBCF)
  //                           : Colors.white))),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}

// import 'package:flutter/material.dart';

// class BotNav extends StatefulWidget {
//   @override
//   _BotNavState createState() => _BotNavState();
// }

// class _BotNavState extends State<BotNav> {
//   Widget _bottomNavBar() {
//     //Bottom Nav Bar Widget
//     return new Theme(
//       data: Theme.of(context).copyWith(
//         canvasColor: Color(0xFF8675A9),
//       ),
//       child: SizedBox(
//         height: 70,
//         child: new BottomNavigationBar(
//           currentIndex: _selectedTabIndex,
//           onTap: _changeIndex,
//           items: [
//             BottomNavigationBarItem(
//                 icon: Icon(
//                   Icons.person,
//                   size: 35,
//                   color:
//                       _selectedTabIndex == 0 ? Color(0xFFEFBBCF) : Colors.white,
//                 ),
//                 title: Text("Instructors",
//                     style: TextStyle(
//                         fontSize: 11,
//                         color: _selectedTabIndex == 0
//                             ? Color(0xFFEFBBCF) //Pink Color
//                             : Colors.white))),
//             BottomNavigationBarItem(
//                 icon: Icon(
//                   Icons.favorite,
//                   size: 35,
//                   color:
//                       _selectedTabIndex == 1 ? Color(0xFFEFBBCF) : Colors.white,
//                 ),
//                 title: Text("Favorite",
//                     style: TextStyle(
//                         fontSize: 11,
//                         color: _selectedTabIndex == 1
//                             ? Color(0xFFEFBBCF)
//                             : Colors.white))),
//             BottomNavigationBarItem(
//                 icon: Icon(
//                   Icons.calendar_today,
//                   size: 35,
//                   color:
//                       _selectedTabIndex == 2 ? Color(0xFFEFBBCF) : Colors.white,
//                 ),
//                 title: Text("Caalendar",
//                     style: TextStyle(
//                         fontSize: 11,
//                         color: _selectedTabIndex == 2
//                             ? Color(0xFFEFBBCF)
//                             : Colors.white))),
//           ],
//         ),
//       ),
//     );
//   }
// }
