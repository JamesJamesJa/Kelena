import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstComeBody extends StatefulWidget {
  final TabController tabController;
  const FirstComeBody({Key key, this.tabController}) : super(key: key);
  @override
  _FirstComeBodyState createState() => _FirstComeBodyState();
}

class _FirstComeBodyState extends State<FirstComeBody> {
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      // width: double.infinity,
      color: Colors.white,
      child: TabBarView(
        controller: widget.tabController,
        children: [
          ListView.builder(
            padding: EdgeInsets.only(top: 0, right: 40, bottom: 5, left: 40),
            // controller: widget.tabController,
            itemBuilder: (ctx, i) => Container(
              padding: EdgeInsets.only(top: 10, right: 0, bottom: 10, left: 10),
              child: Row(
                children: [
                  Container(
                      width: 50,
                      child: (i < 13)
                          ? Text(
                              '$i.00 AM',
                              style: TextStyle(
                                fontSize: 10,
                                color: Color(0xffB9B9B9),
                              ),
                            )
                          : Text(
                              '$i.00 PM',
                              style: TextStyle(
                                fontSize: 10,
                                color: Color(0xffB9B9B9),
                              ),
                            )),
                  Expanded(
                    child: Divider(
                      thickness: 1.2,
                      indent: 10,
                      endIndent: 10,
                      color: Color(0xff9C8CBE),
                    ),
                  ),
                ],
              ),
            ),
            itemCount: 25,
          ),
          ListView.builder(
            padding: EdgeInsets.only(top: 0, right: 40, bottom: 5, left: 40),
            // controller: widget.tabController,
            itemBuilder: (ctx, i) => Container(
              padding: EdgeInsets.only(top: 10, right: 0, bottom: 10, left: 10),
              child: Row(
                children: [
                  Container(
                      width: 50,
                      child: (i < 13)
                          ? Text(
                              '$i.00 AM',
                              style: TextStyle(
                                fontSize: 10,
                                color: Color(0xffB9B9B9),
                              ),
                            )
                          : Text(
                              '$i.00 PM',
                              style: TextStyle(
                                fontSize: 10,
                                color: Color(0xffB9B9B9),
                              ),
                            )),
                  Expanded(
                    child: Divider(
                      thickness: 1.2,
                      indent: 10,
                      endIndent: 10,
                      color: Color(0xff9C8CBE),
                    ),
                  ),
                ],
              ),
            ),
            itemCount: 25,
          ),
          ListView.builder(
            padding: EdgeInsets.only(top: 0, right: 40, bottom: 5, left: 40),
            // controller: widget.tabController,
            itemBuilder: (ctx, i) => Container(
              padding: EdgeInsets.only(top: 10, right: 0, bottom: 10, left: 10),
              child: Row(
                children: [
                  Container(
                      width: 50,
                      child: (i < 13)
                          ? Text(
                              '$i.00 AM',
                              style: TextStyle(
                                fontSize: 10,
                                color: Color(0xffB9B9B9),
                              ),
                            )
                          : Text(
                              '$i.00 PM',
                              style: TextStyle(
                                fontSize: 10,
                                color: Color(0xffB9B9B9),
                              ),
                            )),
                  Expanded(
                    child: Divider(
                      thickness: 1.2,
                      indent: 10,
                      endIndent: 10,
                      color: Color(0xff9C8CBE),
                    ),
                  ),
                ],
              ),
            ),
            itemCount: 25,
          ),
          ListView.builder(
            padding: EdgeInsets.only(top: 0, right: 40, bottom: 5, left: 40),
            // controller: widget.tabController,
            itemBuilder: (ctx, i) => Container(
              padding: EdgeInsets.only(top: 10, right: 0, bottom: 10, left: 10),
              child: Row(
                children: [
                  Container(
                      width: 50,
                      child: (i < 13)
                          ? Text(
                              '$i.00 AM',
                              style: TextStyle(
                                fontSize: 10,
                                color: Color(0xffB9B9B9),
                              ),
                            )
                          : Text(
                              '$i.00 PM',
                              style: TextStyle(
                                fontSize: 10,
                                color: Color(0xffB9B9B9),
                              ),
                            )),
                  Expanded(
                    child: Divider(
                      thickness: 1.2,
                      indent: 10,
                      endIndent: 10,
                      color: Color(0xff9C8CBE),
                    ),
                  ),
                ],
              ),
            ),
            itemCount: 25,
          ),
          ListView.builder(
            padding: EdgeInsets.only(top: 0, right: 40, bottom: 5, left: 40),
            // controller: widget.tabController,
            itemBuilder: (ctx, i) => Container(
              padding: EdgeInsets.only(top: 10, right: 0, bottom: 10, left: 10),
              child: Row(
                children: [
                  Container(
                      width: 50,
                      child: (i < 13)
                          ? Text(
                              '$i.00 AM',
                              style: TextStyle(
                                fontSize: 10,
                                color: Color(0xffB9B9B9),
                              ),
                            )
                          : Text(
                              '$i.00 PM',
                              style: TextStyle(
                                fontSize: 10,
                                color: Color(0xffB9B9B9),
                              ),
                            )),
                  Expanded(
                    child: Divider(
                      thickness: 1.2,
                      indent: 10,
                      endIndent: 10,
                      color: Color(0xff9C8CBE),
                    ),
                  ),
                ],
              ),
            ),
            itemCount: 25,
          ),
          ListView.builder(
            padding: EdgeInsets.only(top: 0, right: 40, bottom: 5, left: 40),
            // controller: widget.tabController,
            itemBuilder: (ctx, i) => Container(
              padding: EdgeInsets.only(top: 10, right: 0, bottom: 10, left: 10),
              child: Row(
                children: [
                  Container(
                      width: 50,
                      child: (i < 13)
                          ? Text(
                              '$i.00 AM',
                              style: TextStyle(
                                fontSize: 10,
                                color: Color(0xffB9B9B9),
                              ),
                            )
                          : Text(
                              '$i.00 PM',
                              style: TextStyle(
                                fontSize: 10,
                                color: Color(0xffB9B9B9),
                              ),
                            )),
                  Expanded(
                    child: Divider(
                      thickness: 1.2,
                      indent: 10,
                      endIndent: 10,
                      color: Color(0xff9C8CBE),
                    ),
                  ),
                ],
              ),
            ),
            itemCount: 25,
          ),
          ListView.builder(
            padding: EdgeInsets.only(top: 0, right: 40, bottom: 5, left: 40),
            // controller: widget.tabController,
            itemBuilder: (ctx, i) => Container(
              padding: EdgeInsets.only(top: 10, right: 0, bottom: 10, left: 10),
              child: Row(
                children: [
                  Container(
                      width: 50,
                      child: (i < 13)
                          ? Text(
                              '$i.00 AM',
                              style: TextStyle(
                                fontSize: 10,
                                color: Color(0xffB9B9B9),
                              ),
                            )
                          : Text(
                              '$i.00 PM',
                              style: TextStyle(
                                fontSize: 10,
                                color: Color(0xffB9B9B9),
                              ),
                            )),
                  Expanded(
                    child: Divider(
                      thickness: 1.2,
                      indent: 10,
                      endIndent: 10,
                      color: Color(0xff9C8CBE),
                    ),
                  ),
                ],
              ),
            ),
            itemCount: 25,
          ),
        ],
      ),
    );
    // Container(
    //   height: MediaQuery.of(context).size.height * 0.62,
    //   color: Colors.blue,
    //   child: TabBarView(
    //     controller: widget.tabController,
    //     children: <Widget>[
    //       Column(
    //         children: <Widget>[
    //           Row(
    //             children: <Widget>[
    //               Text("08:00 AM"),
    //               Column(
    //                 children: <Widget>[
    //                   Container(
    //                     width: MediaQuery.of(context).size.width,
    //                     height: 2,
    //                     color: Colors.green,
    //                     child: Text("asd"),
    //                   ),
    //                   const Divider(
    //                     height: 20,
    //                     thickness: 5,
    //                     indent: 50,
    //                     endIndent: 20,
    //                     color: Colors.white,
    //                   ),
    //                   Container(
    //                     width: MediaQuery.of(context).size.width,
    //                     height: 2,
    //                     color: Colors.green,
    //                     child: Text("asd"),
    //                   ),
    //                   // Expanded(
    //                   //     child: Container(
    //                   //   color: Colors.green,
    //                   //   child: Text("asd"),
    //                   // )),
    //                 ],
    //               ),
    //             ],
    //           ),
    //           const Divider(
    //             height: 20,
    //             thickness: 5,
    //             indent: 20,
    //             endIndent: 20,
    //             color: Colors.black,
    //           ),
    //           Row(
    //             children: <Widget>[
    //               Text("08:00 AM"),
    //               const Divider(
    //                 height: 20,
    //                 thickness: 5,
    //                 indent: 20,
    //                 endIndent: 20,
    //                 color: Colors.black,
    //               ),
    //               Text("08:00 AM"),
    //             ],
    //           ),
    //           Row(
    //             children: <Widget>[
    //               Text("08:00 AM"),
    //               const Divider(
    //                 height: 20,
    //                 thickness: 5,
    //                 indent: 20,
    //                 endIndent: 20,
    //                 color: Colors.black,
    //               ),
    //               Text("08:00 AM"),
    //             ],
    //           ),
    //           Row(
    //             children: <Widget>[
    //               Text("08:00 AM"),
    //               const Divider(
    //                 height: 20,
    //                 thickness: 5,
    //                 indent: 20,
    //                 endIndent: 20,
    //                 color: Colors.black,
    //               ),
    //               Text("08:00 AM"),
    //             ],
    //           ),
    //           Row(
    //             children: <Widget>[
    //               Text("08:00 AM"),
    //               const Divider(
    //                 height: 20,
    //                 thickness: 5,
    //                 indent: 20,
    //                 endIndent: 20,
    //                 color: Colors.black,
    //               ),
    //               Text("08:00 AM"),
    //             ],
    //           ),
    //         ],
    //       ),
    //       Column(
    //         children: <Widget>[
    //           Row(
    //             children: <Widget>[
    //               Text("08:00 AM"),
    //               const Divider(
    //                 height: 20,
    //                 thickness: 5,
    //                 indent: 20,
    //                 endIndent: 20,
    //                 color: Colors.black,
    //               ),
    //               Text("08:00 AM"),
    //             ],
    //           )
    //         ],
    //       ),
    //       Column(
    //         children: <Widget>[
    //           Row(
    //             children: <Widget>[
    //               Text("08:00 AM"),
    //               const Divider(
    //                 height: 20,
    //                 thickness: 5,
    //                 indent: 20,
    //                 endIndent: 20,
    //                 color: Colors.black,
    //               ),
    //               Text("08:00 AM"),
    //             ],
    //           )
    //         ],
    //       ),
    //       Column(
    //         children: <Widget>[
    //           Row(
    //             children: <Widget>[
    //               Text("08:00 AM"),
    //               const Divider(
    //                 height: 20,
    //                 thickness: 5,
    //                 indent: 20,
    //                 endIndent: 20,
    //                 color: Colors.black,
    //               ),
    //               Text("08:00 AM"),
    //             ],
    //           )
    //         ],
    //       ),
    //       Column(
    //         children: <Widget>[
    //           Row(
    //             children: <Widget>[
    //               Text("08:00 AM"),
    //               const Divider(
    //                 height: 20,
    //                 thickness: 5,
    //                 indent: 20,
    //                 endIndent: 20,
    //                 color: Colors.black,
    //               ),
    //               Text("08:00 AM"),
    //             ],
    //           )
    //         ],
    //       ),
    //       Center(
    //         child: Text('It\'s sunny here'),
    //       ),
    //       Center(
    //         child: Text('It\'s cloudy here'),
    //       ),
    //     ],
    //   ),
    // ),
  }
}
