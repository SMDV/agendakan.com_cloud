import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data_store = GetStorage();
    GlobalKey<ScaffoldState> _key = GlobalKey();
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
                onTap: () {
                  Get.offAllNamed("/SignatureeFestival/gueststar");
                },
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
                // onTap: () {
                //   Get.offAllNamed("/SignatureeFestival/contactus");
                // },
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
          child: Column(
        children: [
          //Navbar
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
                      ),
                    ),
                    onTap: () {
                      Get.offAllNamed("/SignatureeFestival/gueststar");
                    },
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
                        fontWeight: FontWeight.w700,
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
          if (MediaQuery.of(context).size.width <= 1100) ...[
            //MOBILE
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(height: 30, image: AssetImage("images/flwr.png")),
                SizedBox(
                  width: 40,
                ),
                Text(
                  "CONTACT US",
                  style: TextStyle(
                      fontSize: 35,
                      fontFamily: 'Syne',
                      fontWeight: FontWeight.w800,
                      color: Color(0xffF05D34)),
                ),
                // Image(image: AssetImage("images/header_gs_page.png")),
                SizedBox(
                  width: 40,
                ),
                Image(height: 30, image: AssetImage("images/arw.png")),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Container(
                // padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: Image(image: AssetImage("images/BG5.png"))),
            SizedBox(
              height: 40,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Text(
                "Apabila menemui kesulitan, jangan ragu menghubungi kami melalui WhatsApp  Jam operasional dari 08:00-20:00 ",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 15, fontFamily: 'Syne'),
              ),
              // height: 170,
              // width: 450,
            ),
            SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () async {
                if (await canLaunchUrl(
                    Uri.parse("https://wa.me/6285746970735"))) {
                  await launchUrl(Uri.parse("https://wa.me/6285746970735"));
                } else {
                  throw 'Could not launch https://wa.me/6285746970735';
                }
              },
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "Whatsapp",
                  style: TextStyle(
                      color: Colors.white, fontSize: 20, fontFamily: 'Syne'),
                ),
                width: 200,
                height: 45,
                decoration: BoxDecoration(
                    color: Color(0xffF3753E),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () async {
                if (await canLaunchUrl(Uri.parse(
                    "https://instagram.com/signaturee.festival?igshid=YmMyMTA2M2Y="))) {
                  await launchUrl(Uri.parse(
                      "https://instagram.com/signaturee.festival?igshid=YmMyMTA2M2Y="));
                } else {
                  throw 'Could not launch https://instagram.com/signaturee.festival?igshid=YmMyMTA2M2Y=';
                }
              },
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "Instagram",
                  style: TextStyle(
                      color: Colors.white, fontSize: 20, fontFamily: 'Syne'),
                ),
                width: 200,
                height: 45,
                decoration: BoxDecoration(
                    color: Color(0xffF3753E),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ] else ...[
            //WEB
            SizedBox(
              height: 200,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage("images/flwr.png")),
                SizedBox(
                  width: 60,
                ),
                Text(
                  "CONTACT US",
                  style: TextStyle(
                      fontSize: 60,
                      fontFamily: 'Syne',
                      fontWeight: FontWeight.w800,
                      color: Color(0xffF05D34)),
                ),
                // Image(image: AssetImage("images/header_gs_page.png")),
                SizedBox(
                  width: 60,
                ),
                Image(image: AssetImage("images/arw.png")),
              ],
            ),
            SizedBox(
              height: 130,
            ),
            Container(
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: Image(image: AssetImage("images/BG5.png"))),
            SizedBox(
              height: 130,
            ),
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Spacer(),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Apabila menemui kesulitan, jangan ragu menghubungi kami melalui WhatsApp  Jam operasional dari 08:00-20:00 ",
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 24, fontFamily: 'Syne'),
                      ),
                      // color: Colors.red,
                      height: 170,
                      width: 450,
                    ),
                    // Spacer(),
                    // SizedBox(
                    //   width: 100,
                    // ),
                    Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () async {
                                if (await canLaunchUrl(
                                    Uri.parse("https://wa.me/6282338611163"))) {
                                  await launchUrl(
                                      Uri.parse("https://wa.me/6282338611163"));
                                } else {
                                  throw 'Could not launch https://wa.me/6282338611163';
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "Whatsapp",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: 'Syne'),
                                ),
                                width: 200,
                                height: 45,
                                decoration: BoxDecoration(
                                    color: Color(0xffF3753E),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            InkWell(
                              onTap: () async {
                                if (await canLaunchUrl(Uri.parse(
                                    "https://www.instagram.com/agendakandotcom/?hl=id"))) {
                                  await launchUrl(Uri.parse(
                                      "https://www.instagram.com/agendakandotcom/?hl=id"));
                                } else {
                                  throw 'Could not launch https://www.instagram.com/agendakandotcom/?hl=id';
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "Instagram",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: 'Syne'),
                                ),
                                width: 200,
                                height: 45,
                                decoration: BoxDecoration(
                                    color: Color(0xffF3753E),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                              ),
                            ),
                          ]),
                      // color: Colors.red,
                      height: 170,
                      width: 250,
                    ),
                    Spacer(),
                  ],
                )),
            SizedBox(
              height: 150,
            ),
          ],
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
        ],
      )),
    );
  }
}
