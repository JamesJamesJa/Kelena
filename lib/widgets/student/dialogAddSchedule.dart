import 'package:flutter/material.dart';

class DialogAddSchedule extends StatefulWidget {
  @override
  _DialogAddScheduleState createState() => new _DialogAddScheduleState();
}

class _DialogAddScheduleState extends State<DialogAddSchedule> {
  @override
  Widget build(BuildContext context) {
    Map<String, bool> onWhat = {
      'Onsite': false,
      'Online': false,
      'Hybrid': false,
    };
    int onWhatSelected = -1;
    return Scaffold(
        body: Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 30,
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
                  top: 40,
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
                    Navigator.of(context).pop();
                    // showDialog(
                    //     context: context,
                    //     builder: (context) {
                    //       return DialogAddSchedule();
                    //     });
                  },
                ),
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            height: 60,
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Subject ID',
                hintText: 'Add subject id',
              ),
              // onSaved: (String value) {
              //   // This optional block of code can be used to run
              //   // code when the user saves the form.
              // },
              // validator: (String value) {
              //   return (value != null && value.contains('@'))
              //       ? 'Do not use the @ char.'
              //       : null;
              // },
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            height: 60,
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Subject Name',
                hintText: 'Add subject name',
              ),
              // onSaved: (String value) {
              //   // This optional block of code can be used to run
              //   // code when the user saves the form.
              // },
              // validator: (String value) {
              //   return (value != null && value.contains('@'))
              //       ? 'Do not use the @ char.'
              //       : null;
              // },
            ),
          ),
          // Container(
          //   width: MediaQuery.of(context).size.width * 0.7,
          //   height: 60,
          //   child: Row(
          //     children: [
          //       CheckboxListTile(
          //           title: Text('Onsite'),
          //           value: onWhat['Onsite'],
          //           activeColor: Colors.pink,
          //           checkColor: Colors.white,
          //           onChanged: (bool value) {
          //             setState(() {
          //               onWhat['Onsite'] = value;
          //             });
          //           })
          //     ],
          //   ),
          // ),
          Container(),
          Container(),
          Container(),
        ],
      ),
    ));
  }
}
