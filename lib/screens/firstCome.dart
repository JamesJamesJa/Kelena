import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/instructor/firstComeNavBar.dart';
import '../widgets/instructor/firstComeBody.dart';
import '../widgets/instructor/firstComeBottom.dart';

class FirstCome extends StatefulWidget {
  @override
  _FirstComeState createState() => _FirstComeState();
}

class _FirstComeState extends State<FirstCome>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 7);
  }

  @override
  Widget build(BuildContext context) {
    return
        // DefaultTabController(
        // length: 3,
        // initialIndex: 0,
        // child:
        Scaffold(
            // appBar: AppBar(
            //   bottom: TabBar(
            //     tabs: [
            //       Text("Sun".toUpperCase(),
            //           style: GoogleFonts.montserrat(
            //               textStyle: TextStyle(
            //                   fontSize: 10.0,
            //                   color: Color(0xff8E8E93),
            //                   fontWeight: FontWeight.bold))),
            //       Tab(icon: Icon(Icons.directions_transit)),
            //       Tab(icon: Icon(Icons.directions_bike)),
            //     ],
            //   ),
            // ),
            body: Container(
      height: MediaQuery.of(context).size.height,
      // width: double.infinity,
      child: Column(children: [
        FirstComeNavBar(tabController: _tabController),
        FirstComeBody(tabController: _tabController),
        FirstComeBottom(),
      ]),
    ));
  }
}
