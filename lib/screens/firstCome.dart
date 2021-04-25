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
    return Scaffold(
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
