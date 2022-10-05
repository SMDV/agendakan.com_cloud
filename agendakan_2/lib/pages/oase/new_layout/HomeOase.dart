import 'package:agendakan_2/pages/oase/new_layout/youtube_plugin.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hovering/hovering.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                // onTap: () {},
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
                        fontWeight: FontWeight.w700,
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
          //Slider Image
          Container(
            child: CarouselSlider(
                items: [
                  'images/poster_1.png',
                  'images/poster_2.png',
                  'images/poster_3.png',
                  'images/poster_4.png'
                ].map((e) {
                  return Builder(builder: (context) {
                    return Container(
                      child: Image(
                        image: AssetImage(e.toString()),
                        fit: BoxFit.cover,
                      ),
                      // color: Colors.blue,
                      width: MediaQuery.of(context).size.width,
                    );
                  });
                }).toList(),
                options: CarouselOptions(
                  //aspectRatio: 2.0,
                  //enlargeCenterPage: true,
                  viewportFraction: 1,
                  scrollDirection: Axis.horizontal,
                  autoPlay: true,
                )),
            // color: Colors.red,
            // width: MediaQuery.of(context).size.width,
            //height: MediaQuery.of(context).size.height,
          ),
          //What IS SIGNATURE
          Container(
            // height: MediaQuery.of(context).size.height / 20,
            width: MediaQuery.of(context).size.width,
            // padding: EdgeInsets.all(70),
            child: Image(
              image: AssetImage("images/header_title_signautre.png"),
              fit: BoxFit.fill,
            ),
          ),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding: (MediaQuery.of(context).size.width >= 1100)
                    ? EdgeInsets.all(130)
                    : EdgeInsets.all(10),
                child: Image(
                  image: AssetImage("images/Deskrip1.png"),
                  fit: BoxFit.fill,
                ),
                // color: Colors.red,
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/BG1.png'), fit: BoxFit.fill)),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              // constraints:
              //     BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            ),
          ),

          //Guest Star
          // if (MediaQuery.of(context).size.width <= 1100) ...[
          if (false) ...[
            AspectRatio(
              aspectRatio: 16 / 10,
              child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/BG2.png'),
                          fit: BoxFit.fill)),
                  padding: EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height:
                                      (MediaQuery.of(context).size.width <= 500)
                                          ? 30
                                          : 70,
                                  child: Image(
                                    image: AssetImage("images/HeaderGS.png"),
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    detailGS(context);
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    constraints: BoxConstraints(maxWidth: 700),
                                    width: MediaQuery.of(context).size.width /
                                        5 *
                                        3,
                                    height: MediaQuery.of(context).size.width /
                                        5 *
                                        2,
                                    decoration: BoxDecoration(
                                        color: Color(0xffd2c5b5).withOpacity(1),
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "images/pamungkas1.jpg"))),
                                  ),
                                ),
                                Spacer(),
                              ]),
                        ]),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height),
            )
          ] else ...[
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.width / 16,
                      // (MediaQuery.of(context).size.width <= 500) ? 30 : 70,
                      child: Image(
                        image: AssetImage("images/HeaderGS.png"),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Spacer(),
                        Container(
                          width: MediaQuery.of(context).size.width / 5 * 4,
                          child: SingleChildScrollView(
                            // physics: const AlwaysScrollableScrollPhysics(),
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.offAllNamed(
                                            "/SignatureeFestival/gueststar");
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3,
                                        height:
                                            MediaQuery.of(context).size.width /
                                                3,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'images/pamungkas_resize2.png'),
                                                fit: BoxFit.fill)),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 25,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.offAllNamed(
                                            "/SignatureeFestival/gueststar");
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3,
                                        height:
                                            MediaQuery.of(context).size.width /
                                                3,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'images/sal_1.png'),
                                                fit: BoxFit.fill)),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 25,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.offAllNamed(
                                            "/SignatureeFestival/gueststar");
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3,
                                        height:
                                            MediaQuery.of(context).size.width /
                                                3,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'images/nadin1.jpg'),
                                                fit: BoxFit.fill)),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 25,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.offAllNamed(
                                            "/SignatureeFestival/gueststar");
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3,
                                        height:
                                            MediaQuery.of(context).size.width /
                                                3,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'images/coldiac1.jpg'),
                                                fit: BoxFit.fill)),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                        Spacer(),
                        // Text(">"),
                      ],
                    ),
                    Spacer()
                  ],
                ),
                // color: Color(0xffC4C4C4),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/BG2.png'), fit: BoxFit.fill)),
                height: MediaQuery.of(context).size.height,
              ),
            ),
          ],
          //Sponsor
          // Container(
          //   padding: EdgeInsets.fromLTRB(20, 80, 20, 0),
          //   child: Column(children: [
          //     Container(
          //       height: 120,
          //       child: Image(
          //         image: AssetImage("images/HeaderSponsor.png"),
          //         fit: BoxFit.fill,
          //       ),
          //     ),
          //   ]),
          //   color: Colors.white,
          //   width: MediaQuery.of(context).size.width,
          //   height: MediaQuery.of(context).size.height,
          // ),
          //MAPS
          AspectRatio(
            aspectRatio: 16 / 8,
            child: InkWell(
              child: Container(
                child: Stack(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Text("data"),
                    // InkWell(
                    //   child:
                    // Container(
                    //   width: MediaQuery.of(context).size.width,
                    //   height: MediaQuery.of(context).size.height,
                    //   child: Image(
                    //     image: AssetImage("images/map_dump3.jpg"),
                    //     fit: BoxFit.cover,
                    //   ),
                    // ),
                    // ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      // padding: EdgeInsets.all(80),
                      child: Container(
                        // height: 100,
                        width: MediaQuery.of(context).size.width / 4,
                        child: Image(
                            fit: BoxFit.fitWidth,
                            //height: 80,
                            image: AssetImage("images/HeaderOurMaps.png")),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/map_dump3.jpg'),
                        fit: BoxFit.fill)),
                // color: Colors.cyan,
                width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height,
              ),
              onTap: () async {
                if (await canLaunchUrl(
                    Uri.parse("https://g.page/kusumahotels?share"))) {
                  await launchUrl(
                      Uri.parse("https://g.page/kusumahotels?share"));
                } else {
                  throw 'Could not launch maps';
                }
              },
            ),
          ),
          //Photo Location
          AspectRatio(
            aspectRatio: 16 / 8,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 2,
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage("images/Deskrip2_Lokasi.png"),
                        ),
                      )),
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      child: CarouselSlider(
                          items: [
                            // 'images/location_image1.jpg',
                            'images/location_image2.jpg',
                            // 'images/location_image3.jpg',
                            'images/location_image4.jpg',
                            'images/location_image5.jpg',
                            'images/location_image6.jpg',
                            'images/location_image7.jpg',
                            'images/location_image8.jpg',
                            'images/location_image9.jpg',
                            'images/location_image10.jpg',
                          ].map((e) {
                            return Builder(builder: (context) {
                              return Image(
                                image: AssetImage(e.toString()),
                                fit: BoxFit.fitHeight,
                              );
                            });
                          }).toList(),
                          options: CarouselOptions(
                            // height: MediaQuery.of(context).size.height,
                            aspectRatio: 1,
                            //enlargeCenterPage: true,
                            // autoPlayAnimationDuration:
                            //     Duration(milliseconds: 800),
                            viewportFraction: 1,
                            scrollDirection: Axis.horizontal,
                            autoPlay: true,
                          )),
                    ),
                  )
                ],
              ),
              // color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          //Youtube Preview
          // Container(
          //   child: Center(
          //       child: Container(
          //     width: MediaQuery.of(context).size.width / 2,
          //     child: YoutubePlayerIFrame(
          //       controller: _controller,
          //       aspectRatio: 16 / 9,
          //     ),
          //   )),
          //   color: Colors.white,
          //   height: MediaQuery.of(context).size.height / 3 * 2,
          // ),
          //Book Now Button Redirect to Book Page
          // AspectRatio(
          //   aspectRatio: 16 / 8,
          //   child:
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
          // ),
          //Footer
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

YoutubePlayerController _controller = YoutubePlayerController(
  initialVideoId: '',
  params: YoutubePlayerParams(
    playlist: ['UWXC0DHIIfQ', 'TfmQMODqQ'], // Defining custom playlist
    startAt: Duration(seconds: 0),
    showControls: true,
    showFullscreenButton: true,
  ),
);

void detailGS(BuildContext context) {
  Get.defaultDialog(
      title: "",
      titlePadding: EdgeInsets.zero,
      backgroundColor: Color(0xffF7EDE5),
      radius: 0,
      contentPadding: (MediaQuery.of(context).size.width <= 1100)
          ? EdgeInsets.zero
          : EdgeInsets.fromLTRB(25, 0, 25, 5),
      content: Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("images/pamungkas2.jpg"))),
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
          // Image(
          //   image: AssetImage("images/pamungkas2.jpg"),
          //   fit: BoxFit.fitHeight,
          // ),
          Spacer(),
          // if (MediaQuery.of(context).size.width <= 1100) ...[
          if (MediaQuery.of(context).size.width <= 1100) ...[
            Container(
              padding: EdgeInsets.fromLTRB(15, 10, 15, 15),
              child: Column(children: [
                // Text(
                //   "Pamungkas",
                //   textAlign: TextAlign.justify,
                //   style: TextStyle(
                //       color: Colors.white,
                //       fontFamily: 'Syne',
                //       fontSize:
                //           (MediaQuery.of(context).size.width >= 700) ? 40 : 20),
                // ),
                Container(
                    width: 200,
                    child: Image(
                      image: AssetImage("images/pamungkas_logo.png"),
                    )),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Pamungkas, seorang penyanyi, produser rekaman, penulis lagu serta aktor ini bakalan tampil di depan kalian semua. Singkat cerita nih, Pamungkas  yang punya nama lengkap Rizki Rahmahadian Pamungkas ini pernah jadi gitaris Potenzio sebagai awal karirnya di dunia musik. Hingga kini Pamungkas berhasil mendapatkan gelar sebagai artis lokal pertama yang paling didengarkan di Spotify Indonesia selama dua tahun berturut-turut. Yuk meng-“To The Bone” bareng di Signaturee Festival 23 Juli nanti…",
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
                      image: AssetImage("images/pamungkas_logo.png"),
                    )),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Pamungkas, seorang penyanyi, produser rekaman, penulis lagu serta aktor ini bakalan tampil di depan kalian semua. Singkat cerita nih, Pamungkas  yang punya nama lengkap Rizki Rahmahadian Pamungkas ini pernah jadi gitaris Potenzio sebagai awal karirnya di dunia musik. Hingga kini Pamungkas berhasil mendapatkan gelar sebagai artis lokal pertama yang paling didengarkan di Spotify Indonesia selama dua tahun berturut-turut. Yuk meng-“To The Bone” bareng di Signaturee Festival 23 Juli nanti…",
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
