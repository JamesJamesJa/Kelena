import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppointmentBox extends StatelessWidget {
  final String textLine1;
  final String textLine2;
  final String status;
  const AppointmentBox({this.textLine1, this.textLine2, this.status});
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 10),

        // color: Colors.red,
        width: MediaQuery.of(context).size.width * 0.9,
        // decoration: BoxDecoration(
        //   // borderRadius: BorderRadius.circular(10),
        //   border: Border(
        //     bottom: BorderSide(
        //       color: Color(0xff9C8CBE),
        //       width: 1,
        //     ),
        //   ),
        // ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(textLine1,
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  color: Color(0xff67676C),
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w400))),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(textLine2,
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  color: Color(0xff67676C),
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w400))),
                    ),
                  ],
                ),
                Text(status,
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            color: (status == "Approved")
                                ? Color(0xff9C8CBE)
                                : (status == "Rejected")
                                    ? Color(0xffFFD5CD)
                                    : Color(0xffC9C9C9),
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400))),
              ],
            ),
            Divider(
              color: Color(0xff9C8CBE),
              thickness: 1,
              indent: 50,
              endIndent: 50,
            )
          ],
        ));
  }
}
