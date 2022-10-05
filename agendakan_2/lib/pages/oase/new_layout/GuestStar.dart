import 'dart:js';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hovering/hovering.dart';
import 'package:url_launcher/url_launcher.dart';

class GuestStarPage extends StatefulWidget {
  const GuestStarPage({Key? key}) : super(key: key);

  @override
  State<GuestStarPage> createState() => _GuestStarPageState();
}

class _GuestStarPageState extends State<GuestStarPage> {
  final data_store = GetStorage();
  GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      endDrawer: Drawer(
        backgroundColor: Color(0xffF7EDE5),
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: Row(
                children: [
                  Spacer(),
                  Container(
                    height: 90,
                    child: Image(
                      image: AssetImage("images/icon-01.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "X",
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        fontSize: 30),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 40,
                    child: Image(
                      image: AssetImage("images/signature.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(top: BorderSide(), bottom: BorderSide())),
              child: ListTile(
                title: Center(
                    child: Text(
                  "HOME",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Syne',
                      fontWeight: FontWeight.w800),
                )),
                onTap: () {
                  Get.offAllNamed("/SignatureeFestival");
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(border: Border(bottom: BorderSide())),
              child: ListTile(
                title: Center(
                    child: Text(
                  "GUEST STAR",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Syne',
                      fontWeight: FontWeight.w800),
                )),
                //onTap: () {},
              ),
            ),
            Container(
              decoration: BoxDecoration(border: Border(bottom: BorderSide())),
              child: ListTile(
                title: Center(
                    child: Text(
                  "TICKET",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Syne',
                      fontWeight: FontWeight.w800),
                )),
                onTap: () {
                  Get.offAllNamed("/SignatureeFestival/tickets");
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(border: Border(bottom: BorderSide())),
              child: ListTile(
                title: Center(
                    child: Text(
                  "CONTACT US",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Syne',
                      fontWeight: FontWeight.w800),
                )),
                onTap: () {
                  Get.offAllNamed("/SignatureeFestival/contactus");
                },
              ),
            ),
            if (data_store.read("token") != null) ...[
              Container(
                decoration: BoxDecoration(border: Border(bottom: BorderSide())),
                child: ListTile(
                  title: Center(
                      child: Text(
                    "TICKET LIST",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Syne',
                        fontWeight: FontWeight.w800),
                  )),
                  onTap: () {
                    if (data_store.read("isAdmin") == 1) {
                      Get.offAndToNamed('/ticketlistAdmin');
                    } else {
                      Get.offAndToNamed('/ticketlist');
                    }
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(border: Border(bottom: BorderSide())),
                child: ListTile(
                  title: Center(
                      child: Text(
                    "LOG OUT",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Syne',
                        fontWeight: FontWeight.w800),
                  )),
                  onTap: () {
                    data_store.remove('token');
                    data_store.remove('isAdmin');
                    Get.offAllNamed("/SignatureeFestival");
                  },
                ),
              ),
            ] else ...[
              Container(
                decoration: BoxDecoration(border: Border(bottom: BorderSide())),
                child: ListTile(
                  title: Center(
                      child: Text(
                    "LOG IN",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Syne',
                        fontWeight: FontWeight.w800),
                  )),
                  onTap: () {
                    Get.offAllNamed("/loginpage");
                  },
                ),
              ),
            ],
            SizedBox(
              height: 30,
            ),
            ListTile(
              // alignment: Alignment.center,
              title: Text(
                "© 2021 - 2022 agendakan.com | All right reserved",
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          //Nav Bar
          if (MediaQuery.of(context).size.width <= 1100) ...[
            Container(
              child: Row(children: [
                Spacer(),
                InkWell(
                  onTap: () {
                    Get.offAllNamed("/");
                  },
                  child: Row(
                    children: [
                      Container(
                        child: Image(
                          image: AssetImage("images/icon-01.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "X",
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            fontSize: 30),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 40,
                        child: Image(
                          image: AssetImage("images/signature.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                InkWell(
                    onTap: () {
                      _key.currentState?.openEndDrawer();
                      //Scaffold.of(context).openEndDrawer();
                    },
                    child: Container(child: Icon(Icons.menu))),
                SizedBox(
                  width: 20,
                )
              ]),
              color: Color(0xffF5F5E9),
              height: MediaQuery.of(context).size.height / 12,
              constraints: BoxConstraints(maxHeight: 100),
            )
          ] else ...[
            Container(
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.offAllNamed("/");
                    },
                    child: Row(
                      children: [
                        Container(
                          child: Image(
                            image: AssetImage("images/icon-01.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "X",
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              fontSize: 30),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Container(
                          height: 60,
                          child: Image(
                            image: AssetImage("images/signature.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    child: Text(
                      "HOME",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Syne',
                        // fontWeight: FontWeight.w700,
                      ),
                    ),
                    onTap: () {
                      Get.offAllNamed("/SignatureeFestival");
                    },
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  InkWell(
                    child: Text(
                      "GUEST STAR",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Syne',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    // onTap: () {
                    //   Get.offAllNamed("/SignatureeFestival/gueststar");
                    // },
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  InkWell(
                    child: Text(
                      "TICKET",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Syne',
                      ),
                    ),
                    onTap: () {
                      Get.offAllNamed("/SignatureeFestival/tickets");
                    },
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  InkWell(
                    child: Text(
                      "CONTACT US",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Syne',
                      ),
                    ),
                    onTap: () {
                      Get.offAllNamed("/SignatureeFestival/contactus");
                    },
                  ),
                  Spacer(),
                  if (data_store.read("token") != null) ...[
                    InkWell(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "TICKET",
                              style: TextStyle(
                                color: Color(0xffF05930).withOpacity(0.75),
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'Syne',
                              ),
                            ),
                            Text(
                              "LIST",
                              style: TextStyle(
                                color: Color(0xffF05930).withOpacity(0.75),
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'Syne',
                              ),
                            ),
                          ],
                        ),
                        width: 150,
                        color: Colors.white.withOpacity(0.5),
                      ),
                      onTap: () {
                        if (data_store.read("isAdmin") == 1) {
                          Get.offAndToNamed('/ticketlistAdmin');
                        } else {
                          Get.offAndToNamed('/ticketlist');
                        }
                      },
                    ),
                    InkWell(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "LOG OUT",
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.75),
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'Syne',
                              ),
                            ),
                          ],
                        ),
                        width: 150,
                        color: Color(0xffF05930),
                      ),
                      onTap: () {
                        data_store.remove('token');
                        data_store.remove('isAdmin');
                        Get.offAllNamed("/SignatureeFestival");
                      },
                    )
                  ] else ...[
                    InkWell(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "LOG IN /",
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.75),
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'Syne',
                              ),
                            ),
                            Text(
                              "SIGN UP",
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.75),
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'Syne',
                              ),
                            )
                          ],
                        ),
                        width: 150,
                        color: Color(0xffF05930),
                      ),
                      onTap: () {
                        Get.offAllNamed("/loginpage");
                      },
                    )
                  ],
                ],
              ),
              color: Color(0xffF5F5E9),
              height: MediaQuery.of(context).size.height / 12,
              constraints: BoxConstraints(maxHeight: 100),
            ),
          ],
          // if (MediaQuery.of(context).size.width <= 1100) ...[
          if (true) ...[
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    padding: EdgeInsets.only(top: 20),
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/BG1.png'),
                            fit: BoxFit.fill)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(),
                        Expanded(
                            flex: 1,
                            child: Image(image: AssetImage("images/flwr.png"))),
                        Spacer(),
                        Expanded(
                            flex: 5,
                            child: Image(
                                image:
                                    AssetImage("images/header_gs_page.png"))),
                        Spacer(),
                        Expanded(
                            flex: 1,
                            child: Image(image: AssetImage("images/arw.png"))),
                        Spacer(),
                      ],
                    ),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 8 * 2,
                    ),
                    Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width / 3,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              child: Row(children: [
                                Expanded(
                                    flex: 3,
                                    child: InkWell(
                                      onTap: () {
                                        detailgs(1, context);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'images/pamungkas_resize1.png'),
                                                fit: BoxFit.fill),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                      ),
                                    )),
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                        // color: Colors.white,
                                        )),
                              ]),
                              // color: Colors.red,
                              width: MediaQuery.of(context).size.width / 5 * 4,
                              height: MediaQuery.of(context).size.width / 3,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  // color: Colors.red,
                                  width: MediaQuery.of(context).size.width /
                                      5 *
                                      1.5,
                                  // color: Colors.red,
                                  child: FittedBox(
                                    fit: BoxFit.fill,
                                    child: Text(
                                      "Pamungkas",
                                      style: TextStyle(
                                          shadows: [
                                            Shadow(
                                              offset: Offset(-3, -3),
                                              blurRadius: 3.0,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                            )
                                          ],
                                          fontSize: 40,
                                          fontFamily: 'Syne',
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 5 * 1,
                                  // color: Colors.red,
                                  child: FittedBox(
                                    fit: BoxFit.fill,
                                    child: Text(
                                      "Guest Star",
                                      style: TextStyle(
                                          shadows: [
                                            Shadow(
                                              offset: Offset(-3, -3),
                                              blurRadius: 2.0,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                            )
                                          ],
                                          fontSize: 40,
                                          fontFamily: 'Syne',
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 15 * 1,
                    ),
                    Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width / 3,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              child: Row(children: [
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          // color: Colors.grey,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                    )),
                                Expanded(
                                    flex: 3,
                                    child: InkWell(
                                      onTap: () {
                                        detailgs(2, context);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'images/sal_2.png'),
                                                fit: BoxFit.fill),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        // color: Colors.grey,
                                      ),
                                    )),
                              ]),
                              // color: Colors.red,
                              width: MediaQuery.of(context).size.width / 5 * 4,
                              height: MediaQuery.of(context).size.width / 3,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width /
                                      5 *
                                      1.5,
                                  // color: Colors.red,
                                  child: FittedBox(
                                    fit: BoxFit.fill,
                                    child: Text(
                                      "Sal Priadi",
                                      style: TextStyle(
                                          shadows: [
                                            Shadow(
                                              offset: Offset(-3, -3),
                                              blurRadius: 3.0,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                            )
                                          ],
                                          fontSize: 40,
                                          fontFamily: 'Syne',
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 5 * 1,
                                  // color: Colors.red,
                                  child: FittedBox(
                                    fit: BoxFit.fill,
                                    child: Text(
                                      "Guest Star",
                                      style: TextStyle(
                                          shadows: [
                                            Shadow(
                                              offset: Offset(-3, -3),
                                              blurRadius: 2.0,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                            )
                                          ],
                                          fontSize: 40,
                                          fontFamily: 'Syne',
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 15 * 1,
                    ),
                    Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width / 3,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              child: Row(children: [
                                Expanded(
                                    flex: 3,
                                    child: InkWell(
                                      onTap: () {
                                        detailgs(3, context);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'images/nadin2.jpg'),
                                                fit: BoxFit.fill),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                      ),
                                    )),
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                        // color: Colors.white,
                                        )),
                              ]),
                              // color: Colors.red,
                              width: MediaQuery.of(context).size.width / 5 * 4,
                              height: MediaQuery.of(context).size.width / 3,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  // color: Colors.red,
                                  width: MediaQuery.of(context).size.width /
                                      5 *
                                      1.5,
                                  // color: Colors.red,
                                  child: FittedBox(
                                    fit: BoxFit.fill,
                                    child: Text(
                                      "Nadin Amizah",
                                      style: TextStyle(
                                          shadows: [
                                            Shadow(
                                              offset: Offset(-3, -3),
                                              blurRadius: 6.0,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                            )
                                          ],
                                          // color:
                                          //     Color.fromARGB(255, 48, 47, 47),
                                          fontSize: 40,
                                          fontFamily: 'Syne',
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 5 * 1,
                                  // color: Colors.red,
                                  child: FittedBox(
                                    fit: BoxFit.fill,
                                    child: Text(
                                      "Guest Star",
                                      style: TextStyle(
                                          shadows: [
                                            Shadow(
                                              offset: Offset(-2, -2),
                                              blurRadius: 6.0,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                            )
                                          ],
                                          fontSize: 40,
                                          fontFamily: 'Syne',
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 15 * 1,
                    ),
                    Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width / 3,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              child: Row(children: [
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          // color: Colors.grey,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                    )),
                                Expanded(
                                    flex: 3,
                                    child: InkWell(
                                      onTap: () {
                                        detailgs(4, context);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'images/coldiac2.jpg'),
                                                fit: BoxFit.fill),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        // color: Colors.grey,
                                      ),
                                    )),
                              ]),
                              // color: Colors.red,
                              width: MediaQuery.of(context).size.width / 5 * 4,
                              height: MediaQuery.of(context).size.width / 3,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width /
                                      5 *
                                      1.5,
                                  // color: Colors.red,
                                  child: FittedBox(
                                    fit: BoxFit.fill,
                                    child: Text(
                                      "COLDIAC",
                                      style: TextStyle(
                                          shadows: [
                                            Shadow(
                                              offset: Offset(-1, -1),
                                              blurRadius: 7.0,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                            )
                                          ],
                                          fontSize: 40,
                                          fontFamily: 'Syne',
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 5 * 1,
                                  // color: Colors.red,
                                  child: FittedBox(
                                    fit: BoxFit.fill,
                                    child: Text(
                                      "Guest Star",
                                      style: TextStyle(
                                          shadows: [
                                            Shadow(
                                              offset: Offset(-1, -1),
                                              blurRadius: 5.0,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                            )
                                          ],
                                          fontSize: 40,
                                          fontFamily: 'Syne',
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 15 * 2,
                    ),
                  ]),
                ),
              ],
            ),
          ] else ...[
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 180, 0, 0),
                    alignment: Alignment.topCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(image: AssetImage("images/flwr.png")),
                        SizedBox(
                          width: 60,
                        ),
                        Image(image: AssetImage("images/header_gs_page.png")),
                        SizedBox(
                          width: 60,
                        ),
                        Image(image: AssetImage("images/arw.png")),
                      ],
                    ),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/BG1.png'),
                            fit: BoxFit.fill)),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(123, 0, 123, 0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 3 * 2,
                      ),
                      Container(
                        // color: Colors.green,
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.defaultDialog(
                                    title: "Guest Star",
                                    backgroundColor: Color(0xffF7EDE5),
                                    radius: 0,
                                    contentPadding:
                                        EdgeInsets.fromLTRB(25, 0, 25, 5),
                                    content: Container(
                                      // color: Colors.green,
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height -
                                              130,
                                      child: Column(children: [
                                        Row(
                                          children: [
                                            Spacer(),
                                            InkWell(
                                                onTap: () {
                                                  Get.back();
                                                },
                                                child: Icon(
                                                  Icons.close,
                                                  size: 42,
                                                )),
                                            SizedBox(
                                              width: 30,
                                            )
                                          ],
                                        ),
                                        Spacer(),
                                        Container(
                                          padding:
                                              EdgeInsets.fromLTRB(40, 0, 50, 0),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                    child: Center(
                                                        child: Image(
                                                            image: AssetImage(
                                                                'images/ARDHITOPRAMONO.png')))),
                                                Expanded(
                                                    child: Center(
                                                        child: Text(
                                                  "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tin",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily: 'Syne',
                                                      fontSize: 24),
                                                ))),
                                              ]),
                                          color: Color(0xffF3753E),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 300,
                                        )
                                      ]),
                                    ));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Image(
                                    image: AssetImage('images/comingsoon.png')),
                                height: MediaQuery.of(context).size.height / 2,
                                width:
                                    MediaQuery.of(context).size.width / 5 * 2,
                                //color: Colors.grey,
                              ),
                            ),
                            Positioned.fill(
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Coming Soon",
                                          style: TextStyle(
                                              fontSize: 40,
                                              fontFamily: 'Syne',
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text("Guest Star",
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontFamily: 'Syne',
                                                fontWeight: FontWeight.w400)),
                                      ],
                                    ))),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 5,
                      ),
                      Container(
                        // color: Colors.green,
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Image(
                                    image: AssetImage('images/comingsoon.png')),
                                height: MediaQuery.of(context).size.height / 2,
                                width:
                                    MediaQuery.of(context).size.width / 5 * 2,
                                //color: Colors.grey,
                              ),
                            ),
                            Positioned.fill(
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Coming Soon",
                                          style: TextStyle(
                                              fontSize: 40,
                                              fontFamily: 'Syne',
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text("Guest Star",
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontFamily: 'Syne',
                                                fontWeight: FontWeight.w400)),
                                      ],
                                    ))),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 5,
                      ),
                      Container(
                        // color: Colors.green,
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Image(
                                    image: AssetImage('images/comingsoon.png')),
                                height: MediaQuery.of(context).size.height / 2,
                                width:
                                    MediaQuery.of(context).size.width / 5 * 2,
                                //color: Colors.grey,
                              ),
                            ),
                            Positioned.fill(
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Coming Soon",
                                          style: TextStyle(
                                              fontSize: 40,
                                              fontFamily: 'Syne',
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text("Guest Star",
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontFamily: 'Syne',
                                                fontWeight: FontWeight.w400)),
                                      ],
                                    ))),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 5,
                      ),
                      Container(
                        // color: Colors.green,
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Image(
                                    image: AssetImage('images/comingsoon.png')),
                                height: MediaQuery.of(context).size.height / 2,
                                width:
                                    MediaQuery.of(context).size.width / 5 * 2,
                                //color: Colors.grey,
                              ),
                            ),
                            Positioned.fill(
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Coming Soon",
                                          style: TextStyle(
                                              fontSize: 40,
                                              fontFamily: 'Syne',
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text("Guest Star",
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontFamily: 'Syne',
                                                fontWeight: FontWeight.w400)),
                                      ],
                                    ))),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 5,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
          //book ticket
          AspectRatio(
            aspectRatio: 16 / 8,
            child: Container(
              child: Center(
                child: HoverWidget(
                  onHover: (event) {},
                  hoverChild: InkWell(
                    child: Container(
                      height: MediaQuery.of(context).size.width / 7,
                      // color: Colors.red,
                      child: Image(
                          fit: BoxFit.fitHeight,
                          image: AssetImage("images/booknow_hover.png")),
                    ),
                    onTap: () {
                      Get.offAllNamed("/SignatureeFestival/tickets");
                    },
                  ),
                  child: InkWell(
                    onTap: () {
                      Get.offAllNamed("/SignatureeFestival/tickets");
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.width / 12,
                      // color: Colors.red,
                      child: Image(
                          fit: BoxFit.fitWidth,
                          image: AssetImage("images/Booknow_normal.png")),
                    ),
                  ),
                ),
              ),
              // color: Colors.lightBlue,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/BG4.png'), fit: BoxFit.fill)),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          //footer
          if (MediaQuery.of(context).size.width <= 1100) ...[
            //footer mobile
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
              child: Column(children: [
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    Get.offAllNamed("/SignatureeFestival");
                  },
                  child: Row(
                    children: [
                      Spacer(),
                      Container(
                        // color: Colors.white,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Color(0xffF5F5E9),
                          shape: BoxShape.circle,
                        ),
                        child: Image(
                          image: AssetImage("images/icon-01.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "X",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 70,
                        child: Image(
                          image: AssetImage("images/signature.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () {
                    Get.offAllNamed("/SignatureeFestival");
                  },
                  child: Text(
                    "Home",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Syne',
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    Get.offAllNamed("/SignatureeFestival/gueststar");
                  },
                  child: Text(
                    "Guest Star",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Syne',
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    Get.offAllNamed("/SignatureeFestival/tickets");
                  },
                  child: Text(
                    "Tickets",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Syne',
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    Get.offAllNamed("/SignatureeFestival/contactus");
                  },
                  child: Text(
                    "Contact Us",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Syne',
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  padding: EdgeInsets.only(top: 30),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () async {
                            if (await canLaunchUrl(Uri.parse(
                                "https://www.tiktok.com/@signaturee.festival"))) {
                              await launchUrl(Uri.parse(
                                  "https://www.tiktok.com/@signaturee.festival"));
                            } else {
                              throw 'Could not launch tiktok.com/@signaturee.festival';
                            }
                          },
                          child: Icon(
                            FontAwesomeIcons.tiktok,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () async {
                            if (await canLaunchUrl(Uri.parse(
                                "https://youtube.com/channel/UC1aJNWcTfXBUph02HKr6zLQ"))) {
                              await launchUrl(Uri.parse(
                                  "https://youtube.com/channel/UC1aJNWcTfXBUph02HKr6zLQ"));
                            } else {
                              throw 'Could not launch youtube';
                            }
                          },
                          child: Icon(
                            FontAwesomeIcons.youtube,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () async {
                            if (await canLaunchUrl(Uri.parse(
                                "https://instagram.com/signaturee.festival?igshid=YmMyMTA2M2Y="))) {
                              await launchUrl(Uri.parse(
                                  "https://instagram.com/signaturee.festival?igshid=YmMyMTA2M2Y="));
                            } else {
                              throw 'Could not launch signaturee.festival';
                            }
                          },
                          child: Icon(
                            FontAwesomeIcons.instagram,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () async {
                            if (await canLaunchUrl(
                                Uri.parse("https://wa.me/6285746970735"))) {
                              await launchUrl(
                                  Uri.parse("https://wa.me/6285746970735"));
                            } else {
                              throw 'Could not launch https://wa.me/6285746970735';
                            }
                          },
                          child: Icon(
                            FontAwesomeIcons.whatsapp,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "© 2021 - 2022 agendakan.com | All right reserved",
                      style: TextStyle(color: Colors.white),
                    )
                  ]),
                  height: 100,
                  decoration: BoxDecoration(
                      // color: Colors.white,
                      border: Border(
                          top: BorderSide(width: 1.5, color: Colors.white))),
                  // width: MediaQuery.of(context).size.width,
                  // color: Colors.green,
                ),
              ]),
            )
          ] else ...[
            //footer web
            Container(
              child: Column(children: [
                Row(
                  children: [
                    Spacer(),
                    Container(
                      // color: Colors.white,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xffF5F5E9),
                        shape: BoxShape.circle,
                      ),
                      child: Image(
                        image: AssetImage("images/icon-01.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "X",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          fontSize: 30),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Container(
                      height: 70,
                      child: Image(
                        image: AssetImage("images/signature.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    InkWell(
                      onTap: () {
                        Get.offAllNamed("/SignatureeFestival");
                      },
                      child: Text(
                        "Home",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Syne',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    InkWell(
                      onTap: () {
                        Get.offAllNamed("/SignatureeFestival/gueststar");
                      },
                      child: Text(
                        "Guest Star",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Syne',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    InkWell(
                      onTap: () {
                        Get.offAllNamed("/SignatureeFestival/tickets");
                      },
                      child: Text(
                        "Tickets",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Syne',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    InkWell(
                      onTap: () {
                        Get.offAllNamed("/SignatureeFestival/contactus");
                      },
                      child: Text(
                        "Contact Us",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Syne',
                        ),
                      ),
                    ),
                    Spacer()
                  ],
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.only(top: 30),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () async {
                            if (await canLaunchUrl(Uri.parse(
                                "https://www.tiktok.com/@signaturee.festival"))) {
                              await launchUrl(Uri.parse(
                                  "https://www.tiktok.com/@signaturee.festival"));
                            } else {
                              throw 'Could not launch tiktok.com/@signaturee.festival';
                            }
                          },
                          child: Icon(
                            FontAwesomeIcons.tiktok,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () async {
                            if (await canLaunchUrl(Uri.parse(
                                "https://youtube.com/channel/UC1aJNWcTfXBUph02HKr6zLQ"))) {
                              await launchUrl(Uri.parse(
                                  "https://youtube.com/channel/UC1aJNWcTfXBUph02HKr6zLQ"));
                            } else {
                              throw 'Could not launch youtube';
                            }
                          },
                          child: Icon(
                            FontAwesomeIcons.youtube,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () async {
                            if (await canLaunchUrl(Uri.parse(
                                "https://instagram.com/signaturee.festival?igshid=YmMyMTA2M2Y="))) {
                              await launchUrl(Uri.parse(
                                  "https://instagram.com/signaturee.festival?igshid=YmMyMTA2M2Y="));
                            } else {
                              throw 'Could not launch signaturee.festival';
                            }
                          },
                          child: Icon(
                            FontAwesomeIcons.instagram,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () async {
                            if (await canLaunchUrl(
                                Uri.parse("https://wa.me/6285746970735"))) {
                              await launchUrl(
                                  Uri.parse("https://wa.me/6285746970735"));
                            } else {
                              throw 'Could not launch https://wa.me/6285746970735';
                            }
                          },
                          child: Icon(
                            FontAwesomeIcons.whatsapp,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "© 2021 - 2022 agendakan.com | All right reserved",
                      style: TextStyle(color: Colors.white),
                    )
                  ]),
                  height: 100,
                  decoration: BoxDecoration(
                      // color: Colors.white,
                      border: Border(
                          top: BorderSide(width: 1.5, color: Colors.white))),
                  // width: MediaQuery.of(context).size.width,
                  // color: Colors.green,
                ),
                Spacer()
              ]),
              padding: EdgeInsets.fromLTRB(150, 60, 150, 60),
              color: Colors.black,
              height: MediaQuery.of(context).size.height / 2,
            ),
          ],
        ]),
      ),
    );
  }
}

void detailGS(BuildContext context, String asset, String logo, String desc) {
  Get.defaultDialog(
      title: "",
      titlePadding: EdgeInsets.zero,
      backgroundColor: Color(0xffF7EDE5),
      radius: 0,
      contentPadding: (MediaQuery.of(context).size.width <= 1100)
          ? EdgeInsets.zero
          : EdgeInsets.fromLTRB(25, 0, 25, 5),
      content: Container(
        decoration:
            BoxDecoration(image: DecorationImage(image: AssetImage(asset))),
        // color: Colors.green,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 130,
        child: Column(children: [
          Row(
            children: [
              Spacer(),
              InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.close,
                    size: 42,
                  )),
              SizedBox(
                width: 30,
              )
            ],
          ),
          Spacer(),
          // if (MediaQuery.of(context).size.width <= 1100) ...[
          if (MediaQuery.of(context).size.width <= 1100) ...[
            Container(
              padding: EdgeInsets.fromLTRB(15, 10, 15, 15),
              child: Column(children: [
                Container(
                    // height: 50,
                    width: 200,
                    child: Image(
                      // height: 50,
                      image: AssetImage(logo),
                    )),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        desc,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Syne',
                            fontSize: (MediaQuery.of(context).size.width >= 700)
                                ? 20
                                : 12),
                      ),
                    ),
                  ],
                )
              ]),
              color: Color(0xffF3753E),
              width: MediaQuery.of(context).size.width,
            ),
          ] else ...[
            Container(
              padding: EdgeInsets.fromLTRB(25, 20, 25, 25),
              child: Column(children: [
                Container(
                    width: 400,
                    child: Image(
                      image: AssetImage(logo),
                    )),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        desc,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Syne',
                            fontSize: (MediaQuery.of(context).size.width >= 700)
                                ? 20
                                : 12),
                      ),
                    ),
                  ],
                )
              ]),
              color: Color(0xffF3753E),
              width: MediaQuery.of(context).size.width,
            ),
          ]
        ]),
      ));
}

void detailgs(int i, BuildContext context) {
  String asset1 = "images/pamungkas2.jpg";
  String logo1 = "images/pamungkas_logo.png";
  String desc1 =
      "Pamungkas, seorang penyanyi, produser rekaman, penulis lagu serta aktor ini bakalan tampil di depan kalian semua. Singkat cerita nih, Pamungkas  yang punya nama lengkap Rizki Rahmahadian Pamungkas ini pernah jadi gitaris Potenzio sebagai awal karirnya di dunia musik. Hingga kini Pamungkas berhasil mendapatkan gelar sebagai artis lokal pertama yang paling didengarkan di Spotify Indonesia selama dua tahun berturut-turut. Yuk meng-“To The Bone” bareng di Signaturee Festival 23 Juli nanti…";
  String asset2 = "images/sal_3.png";
  String logo2 = "images/sal_logo.png";
  String desc2 =
      "Salmantyo Ashrizky Priadi yang lebih dikenal  Sal Priadi bakal tampil juga di Signaturee Festival nih. Single perdana “Kultusan” jadi awal Sal Priadi di skena musik Indonesia. Suaranya yang khas dengan balutan suara beratnya bikin para pendengarnya makin tersentuh waktu dengerin lagunya. Let’s go, kita bersenandung bareng Sal Priadi di Signaturee Festival 2022!!!";
  String asset3 = "images/nadin3.jpg";
  String logo3 = "images/logo_nadin.png";
  String desc3 =
      "Please welcome, Nadin Amizah, our next performer\nLahir di Bandung, 28 Mei 2000, penyanyi muda ini sudah memulai perjalanan penulisan lagunya sebelum umur 17 tahun. Nadin banyak menuliskan lirik tentang apa yang ia rasakan dengan balutan frasa yang bisa menggambarkan perasaan yang tak bisa dituliskan. Mari bersendu bersama Nadin Amizah di Signaturee Festival 2022!!!";
  String asset4 = "images/coldiac1.jpg";
  String logo4 = "images/coldiac_logo.png";
  String desc4 =
      "Yes, Last but not least, here we go COLDIAC. Band indie pop kebanggaan Kota Malang. Berdiri pada tahun 2015, Coldiac pernah mencuri perhatian public nasional lantaran meraih nominasi AMI Awards edisi 2018 dan 2020. Nantikan lantunan music yang sopan meluncur menuju gendang telinga bersama COLDIAC di Signaturee Festival 2022!";

  if (i == 1) {
    detailGS(context, asset1, logo1, desc1);
  } else if (i == 2) {
    detailGS(context, asset2, logo2, desc2);
  } else if (i == 3) {
    detailGS(context, asset3, logo3, desc3);
  } else if (i == 4) {
    detailGS(context, asset4, logo4, desc4);
  }
}
