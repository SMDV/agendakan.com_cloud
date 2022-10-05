import 'package:flutter/material.dart';

class DetailsLayout extends StatefulWidget {
  const DetailsLayout({Key? key}) : super(key: key);

  @override
  State<DetailsLayout> createState() => _DetailsLayoutState();
}

class _DetailsLayoutState extends State<DetailsLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          //left part
          Container(
            child: Center(
              child: Container(
                width: 430,
                height: 500,
                child: Image(image: AssetImage("images/poster2.jpg")),
              ),
            ),
            width: 457,
            height: 768,
            color: Color(0xff61A4F2),
          ),
          //right part
          Container(
            padding: EdgeInsets.only(left: 42),
            child: Column(
              children: [
                Row(
                  children: [
                    Spacer(),
                    Container(
                      height: 80,
                      child: Image(
                        image: AssetImage("images/icon-01.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      width: 11,
                    ),
                    Container(
                      height: 36,
                      width: 94,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "MY TICKETS",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
                    SizedBox(
                      width: 22,
                    ),
                    Container(
                      height: 36,
                      width: 94,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "LOGOUT",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 36,
                    width: 94,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Featured",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        border: Border.all(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                ),
                SizedBox(
                  height: 36,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Oase Festival\nDrive-in Concert",
                      style: TextStyle(fontSize: 32, height: 0.95),
                    )),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                      child: Center(child: Text("Event Details")),
                      // color: Colors.red,
                      // decoration: BoxDecoration(
                      //   border: Border(
                      //       bottom: BorderSide(color: Colors.blue, width: 2)),
                      // ),
                      width: 112,
                      height: 30,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Container(
                      child: Center(
                          child: Text(
                        "Guest Star",
                        style: TextStyle(color: Colors.blue),
                      )),
                      // color: Colors.red,
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.blue, width: 2)),
                      ),
                      width: 112,
                      height: 30,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Container(
                      child: Center(child: Text("Tickets")),
                      // color: Colors.red,
                      // decoration: BoxDecoration(
                      //   border: Border(
                      //       bottom: BorderSide(color: Colors.blue, width: 2)),
                      // ),
                      width: 112,
                      height: 30,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                  ],
                ),
                Image(image: AssetImage("images/gs_temp.png"))
              ],
            ),
            width: 909,
            height: 768,
            color: Color(0xffFFF9E0),
          ),
        ],
      ),
    );
  }
}
