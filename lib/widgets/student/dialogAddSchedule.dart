import 'package:flutter/material.dart';

class DialogAddSchedule extends StatefulWidget {
  @override
  _DialogAddScheduleState createState() => new _DialogAddScheduleState();
}

class _DialogAddScheduleState extends State<DialogAddSchedule> {
  @override
  Widget build(BuildContext context) {
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
                    child: Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
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
            ),
          ),
        ],
      ),
    ));
  }
}
