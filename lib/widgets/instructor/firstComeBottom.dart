import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

import '../student/dialogAddSchedule.dart';

class FirstComeBottom extends StatefulWidget {
  // final TabController tabController;
  // const FirstComeNavBar({Key key, this.tabController}) : super(key: key);
  @override
  _FirstComeBottomState createState() => _FirstComeBottomState();
}

class _FirstComeBottomState extends State<FirstComeBottom> {
  final List<Widget> myTabs = [
    Tab(text: "SUN"),
    Tab(text: "MON"),
    Tab(text: "TUE"),
    Tab(text: "WED"),
    Tab(text: "THU"),
    Tab(text: "FRI"),
    Tab(text: "SAT"),
  ];
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide(color: Colors.grey))),
              child: Row(
                children: [
                  Icon(
                    Icons.add,
                    color: Colors.grey,
                    size: 16,
                  ),
                  Text(
                    'Add your lecture class',
                    style: TextStyle(
                      color: Colors.grey,
                      // fontWeight: FontWeight.w200,
                      fontSize: 12,
                    ),
                  )
                ],
              ),
              onPressed: () {
                // showDialog(
                //     context: context,
                //     builder: (context) {
                //       return DialogAddSchedule();
                //     });
              },
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color(0xff8675A9),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: BorderSide(color: Color(0xff8675A9)))),
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    'Finish',
                    style: TextStyle(
                      color: Colors.white,
                      // fontWeight: FontWeight.w200,
                      fontSize: 12,
                    ),
                  ),
                ),
                onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

// overflow: Overflow.visible,

// children: <Widget>[
//   Form(
//     key: _formKey,
//     child: Column(
//       mainAxisSize: MainAxisSize.min,
//       children: <Widget>[
//         Padding(
//           padding: EdgeInsets.all(8.0),
//           child: TextFormField(),
//         ),
//         Padding(
//           padding: EdgeInsets.all(8.0),
//           child: TextFormField(),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: RaisedButton(
//             child: Text("Submitß"),
//             onPressed: () {
//               if (_formKey.currentState.validate()) {
//                 _formKey.currentState.save();
//               }
//             },
//           ),
//         )
//       ],
//     ),
//   ),
//   Positioned(
//     right: -40.0,
//     top: -40.0,
//     child: InkResponse(
//       onTap: () {
//         Navigator.of(context).pop();
//       },
//       child: CircleAvatar(
//         child: Icon(Icons.close),
//         backgroundColor: Colors.red,
//       ),
//     ),
//   ),
// ],
