import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:kelena/providers/student.dart';

class DialogAddAppointment extends StatefulWidget {
  @override
  _DialogAddAppointmentState createState() => new _DialogAddAppointmentState();
}

class _DialogAddAppointmentState extends State<DialogAddAppointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 20,
                  left: 20,
                ),
                child: IconButton(
                  icon: Icon(Icons.close),
                  color: Colors.grey,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 20,
                  right: 40,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xff8675A9),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          side: BorderSide(color: Color(0xff8675A9)))),
                  child: Container(
                    // padding: EdgeInsets.only(top: 0, bottom: 0),
                    child: Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.white,
                        // fontWeight: FontWeight.w200,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  onPressed: () {
                    // student.addLecture("lec10", "MTH999", "Mathematics II",
                    //     "CB2312", "Mon", "5:30", "06:30", "Hybrid");
                    Navigator.of(context).pop();
                    // print("$student");
                    // showDialog(
                    //     context: context,
                    //     builder: (context) {
                    //       return DialogAddSchedule();
                    //     });
                  },
                ),
              ),
            ],
            // onTap: () {
            //             showModalBottomSheet(
            //                 context: context,
            //                 builder: (context) {
            //                   return DialogAddAppointment();
            //                 });
            //           },
          ),
          Text("asdd"),
          Container(),
          Container(),
        ],
      ),
    ));
  }
}
