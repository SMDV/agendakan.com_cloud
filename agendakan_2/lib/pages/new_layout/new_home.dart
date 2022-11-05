import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  final CarouselController _carouselController = CarouselController();
  GlobalKey<ScaffoldState> _key = GlobalKey();
  final data_store = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      endDrawer: Drawer(
        backgroundColor: Colors.white,
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
                  Spacer(),
                ],
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
                      Get.offAndToNamed('/gkm/ticket_list');
                    } else {
                      Get.offAndToNamed('/gkm/ticket_list');
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
                    Get.offAllNamed("/gkm");
                  },
                ),
              ),
            ] else ...[
              Container(
                decoration: BoxDecoration(
                    border: Border(top: BorderSide(), bottom: BorderSide())),
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
          //Web View
          if (MediaQuery.of(context).size.width > 1360) ...[
            Container(
              height: 636,
              // width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/bg_home_default.jpg"),
                      fit: BoxFit.fitWidth)),
              child: Column(children: [
                Row(children: [
                  Container(
                    height: 100,
                    child: Image(
                      image: AssetImage("images/icon-01.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  Spacer(),
                  // Container(
                  //   // color: Colors.white,
                  //   height: 40,
                  //   width: 300,
                  //   child: TextField(
                  //     decoration: InputDecoration(
                  //         border: InputBorder.none,
                  //         hintText: "Search...",
                  //         prefixIcon: Icon(Icons.search)),
                  //   ),
                  //   decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       // border: Border.all(color: Colors.blue),
                  //       borderRadius: BorderRadius.all(Radius.circular(10))),
                  // ),
                  SizedBox(
                    width: 20,
                  ),
                  if (data_store.read("token") == null) ...[
                    InkWell(
                      onTap: () {
                        Get.toNamed("/loginpage");
                      },
                      child: Container(
                        height: 40,
                        width: 100,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "LOGIN",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.blue, width: 2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed("/register");
                      },
                      child: Container(
                        height: 40,
                        width: 100,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "REGISTER",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(color: Colors.blue, width: 2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                  ] else ...[
                    InkWell(
                      onTap: () {
                        data_store.remove('token');
                        data_store.remove('isAdmin');
                        Get.offAllNamed("/");
                      },
                      child: Container(
                        height: 40,
                        width: 100,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "LOG OUT",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(color: Colors.blue, width: 2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                  ],
                  SizedBox(
                    width: 20,
                  ),
                ]),
                Spacer(),
                Center(
                  child: Container(
                    width: 1100,
                    // color: Colors.red,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Agendakan.com",
                            style: TextStyle(
                                fontFamily: 'Josefin Sans',
                                fontSize: 40,
                                color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Image(
                                image: AssetImage("images/line_header.png"))),
                        SizedBox(
                          height: 40,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Bersama agendakan.com\n“Kelola tiket dan informasi event-mu dengan lebih mudah”",
                            style: TextStyle(
                                fontSize: 40,
                                fontFamily: 'Roboto',
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                )
                // Spacer()
              ]),
            ),
            Container(
              child: Column(children: [
                Spacer(),
                Container(
                  child: Row(children: [
                    Container(
                      // color: Colors.red,
                      margin: EdgeInsets.fromLTRB(60, 31, 27, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 25,
                            width: 85,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Featured",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                border:
                                    Border.all(color: Colors.blue, width: 2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              height: 50,
                              width: 200,
                              child: Text(
                                "Gebyar Kreativitas Mahasiswa",
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_today,
                                color: Colors.grey,
                                size: 14,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("2 Desember 2022"),
                              SizedBox(
                                width: 15,
                              ),
                              Icon(
                                Icons.location_on,
                                color: Colors.grey,
                                size: 14,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("Graha Cakrawala")
                            ],
                          ),
                          SizedBox(
                            height: 28,
                          ),
                          Container(
                            width: 500,
                            height: 80,
                            child: Text(
                                "GKM adalah salah satu program kerja dari departemen BMP BEM FEB UM yang bentuk kegiatan nya adalah berupa penampilan karya-karya dari mahasiswa dan juga subbidang yang ada di FEB UM yang dikemas dalam bentuk konser. GKM juga merupakan salah satu rangkaian dari PKKMB yang dimana GKM ialah puncak acara untuk Mahasiswa Baru itu sendiri. Selain itu GKM bertujuan untuk meningkatkan eksistensi FEB kepada khalayak UM khususnya dan khalayak umum pada umumnya. Dalam kegiatannya GKM selalu menghadirkan minimal 2 GuestStar  Ibukota setiap tahunnya dari awal GKM ini terbentuk."),
                          ),
                          SizedBox(
                            height: 11,
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed("/gkm");
                            },
                            child: Text(
                              "Lihat lebih banyak",
                              style: TextStyle(color: Color(0xff4181ED)),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            width: 550,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(Icons.arrow_back),
                                Icon(Icons.arrow_forward),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      child: Image(
                          image: AssetImage("images/gkm_poster_main.png")),
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      height: 355,
                      width: 633,
                      // color: Colors.orange,
                    )
                  ]),
                  height: 355,
                  width: 1271,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.white),
                  // color: Colors.white,
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.only(left: 49),
                  child: Row(children: [
                    Container(
                      child: Center(
                          child: Text(
                        "All Event",
                        style: TextStyle(fontSize: 24, color: Colors.blue),
                      )),
                      width: 127,
                      height: 35,
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.blue, width: 2)),
                      ),
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Container(
                      child: Center(
                          child: Text(
                        "Available",
                        style: TextStyle(fontSize: 24, color: Colors.grey),
                      )),
                      width: 127,
                      height: 35,
                      decoration: BoxDecoration(
                        border: Border(
                            // bottom: BorderSide(color: Colors.blue, width: 2)
                            ),
                      ),
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Container(
                      child: Center(
                          child: Text(
                        "Past Event",
                        style: TextStyle(fontSize: 24, color: Colors.grey),
                      )),
                      width: 127,
                      height: 35,
                      decoration: BoxDecoration(
                        border: Border(
                            // bottom: BorderSide(color: Colors.blue, width: 2)
                            ),
                      ),
                    ),
                  ]),
                  height: 79,
                  width: 1271,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.white),
                  // color: Colors.white,
                ),
                Spacer(),
                Container(
                  child: Row(children: [
                    Stack(
                      children: [
                        Container(
                          width: 1300,
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: 1280,
                              child: CarouselSlider(
                                  carouselController: _carouselController,
                                  items: [
                                    {
                                      "title": "Gebyar Kreativitas\nMahasiswa",
                                      "alamat": "Graha Cakrawala",
                                      "time": "2 Desember 2022",
                                      "image": "images/gkm_poster_main.png",
                                      "status": "BUY NOW",
                                      "link": "/gkm"
                                    },
                                    {
                                      "title": "FIPFEST",
                                      "alamat": "Graha Cakrawala",
                                      "time": "8 Desember 2022",
                                      "image": "images/fipfest_poster_main.png",
                                      "status": "BUY NOW",
                                      "link": "/fipfest"
                                    },
                                    {
                                      "title": "WEEKFEST",
                                      "alamat": "Balai Pemuda\nSurabaya",
                                      "time": "18 - 20 Desember 2022",
                                      "image":
                                          "images/weekfest_poster_main.png",
                                      "status": "BUY NOW",
                                      "link": "/weekfest"
                                    },
                                    {
                                      "title": "Signaturee",
                                      "alamat": "Kusuma Agro Wisata",
                                      "time": "23 Juli 2022",
                                      "image":
                                          "images/signatur_poster_main.jpg",
                                      "status": "SOLD!",
                                      "link": "/SignatureeFestival"
                                    },
                                    {
                                      "title": "Mercusuara",
                                      "alamat": "Droomhaven",
                                      "time": "5 Juni 2022",
                                      "image": "images/mercu_poster_main.jpg",
                                      "status": "SOLD!",
                                      "link": "/mercusuara"
                                    },
                                  ].map((e) {
                                    return Builder(builder: (context) {
                                      return Container(
                                        child: Container(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Image(
                                                    image: AssetImage(
                                                        e["image"].toString())),
                                                flex: 3,
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      e["title"].toString(),
                                                      style: TextStyle(
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                          Icons.location_on,
                                                          size: 15,
                                                          color: Colors.grey,
                                                        ),
                                                        SizedBox(
                                                          width: 3,
                                                        ),
                                                        Text(
                                                          e["alamat"]
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 15),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                          Icons.calendar_today,
                                                          size: 15,
                                                          color: Colors.grey,
                                                        ),
                                                        SizedBox(
                                                          width: 3,
                                                        ),
                                                        Text(e["time"]
                                                            .toString()),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        Get.toNamed(e["link"]
                                                            .toString());
                                                      },
                                                      child: Container(
                                                        height: 34,
                                                        width: 94,
                                                        child: Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                            e["status"]
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .blue),
                                                          ),
                                                        ),
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            border: Border.all(
                                                                color:
                                                                    Colors.blue,
                                                                width: 2),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10))),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                flex: 5,
                                              )
                                            ],
                                          ),
                                          margin:
                                              EdgeInsets.fromLTRB(40, 0, 40, 0),
                                          padding:
                                              EdgeInsets.fromLTRB(25, 0, 10, 0),
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  spreadRadius: 5,
                                                  blurRadius: 7,
                                                  offset: Offset(0,
                                                      3), // changes position of shadow
                                                ),
                                              ],
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: Color(0xff4181ED),
                                                  width: 3),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(50))),
                                        ),
                                        width:
                                            MediaQuery.of(context).size.width,
                                      );
                                    });
                                  }).toList(),
                                  options: CarouselOptions(
                                    //aspectRatio: 2.0,
                                    //enlargeCenterPage: true,
                                    viewportFraction: 0.35,
                                    scrollDirection: Axis.horizontal,
                                    autoPlay: false,
                                  )),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: InkWell(
                            onTap: () {
                              _carouselController.previousPage();
                            },
                            child: Image(
                                image: AssetImage("images/left_vector.png")),
                          ),
                        ),
                        Container(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () {
                                _carouselController.nextPage();
                              },
                              child: Image(
                                  image: AssetImage("images/right_vector.png")),
                            ),
                          ),
                          width: 1300,
                        ),
                      ],
                    )
                    // Spacer(),
                    // Container(
                    //   child: Stack(children: [
                    //     Center(
                    //       child: InkWell(
                    //         onTap: () {
                    //           Get.toNamed("/gkm");
                    //         },
                    //         child: Container(
                    //           child: Row(
                    //             children: [
                    //               Container(
                    //                 width: 122,
                    //                 height: 162,
                    //                 child: Center(
                    //                   child: Image(
                    //                     image: AssetImage(
                    //                         "images/gkm_poster_main.png"),
                    //                     fit: BoxFit.fill,
                    //                   ),
                    //                 ),
                    //               ),
                    //               SizedBox(
                    //                 width: 35,
                    //               ),
                    //               Container(
                    //                 // color: Colors.red,
                    //                 width: 200,
                    //                 child: Column(
                    //                     mainAxisAlignment:
                    //                         MainAxisAlignment.center,
                    //                     crossAxisAlignment:
                    //                         CrossAxisAlignment.center,
                    //                     children: [
                    //                       Center(
                    //                         child: Text(
                    //                           "Gebyar Kreativitas",
                    //                           style: TextStyle(fontSize: 18),
                    //                         ),
                    //                       ),
                    //                       Center(
                    //                         child: Text(
                    //                           "Mahasiswa",
                    //                           style: TextStyle(fontSize: 18),
                    //                         ),
                    //                       ),
                    //                       SizedBox(
                    //                         height: 16,
                    //                       ),
                    //                       Row(
                    //                         mainAxisAlignment:
                    //                             MainAxisAlignment.center,
                    //                         crossAxisAlignment:
                    //                             CrossAxisAlignment.center,
                    //                         children: [
                    //                           Icon(
                    //                             Icons.location_on,
                    //                             size: 15,
                    //                             color: Colors.grey,
                    //                           ),
                    //                           SizedBox(
                    //                             width: 3,
                    //                           ),
                    //                           Text(
                    //                             "Graha Cakrawala",
                    //                             style: TextStyle(fontSize: 14),
                    //                           )
                    //                         ],
                    //                       ),
                    //                       Text(
                    //                         "   Kota Malang, Jawa Timur",
                    //                         style: TextStyle(
                    //                             fontSize: 14,
                    //                             color: Colors.grey),
                    //                       ),
                    //                       Row(
                    //                         mainAxisAlignment:
                    //                             MainAxisAlignment.center,
                    //                         crossAxisAlignment:
                    //                             CrossAxisAlignment.center,
                    //                         children: [
                    //                           Icon(Icons.calendar_today,
                    //                               size: 12, color: Colors.grey),
                    //                           SizedBox(
                    //                             width: 3,
                    //                           ),
                    //                           Text(
                    //                             "2 Desember 2022",
                    //                             style: TextStyle(fontSize: 14),
                    //                           )
                    //                         ],
                    //                       ),
                    //                       SizedBox(
                    //                         height: 20,
                    //                       ),
                    //                       InkWell(
                    //                         onTap: () {
                    //                           Get.toNamed("/gkm");
                    //                         },
                    //                         child: Container(
                    //                           height: 34,
                    //                           width: 94,
                    //                           child: Align(
                    //                             alignment: Alignment.center,
                    //                             child: Text(
                    //                               "SOLD!",
                    //                               style: TextStyle(
                    //                                   color: Colors.blue),
                    //                             ),
                    //                           ),
                    //                           decoration: BoxDecoration(
                    //                               color: Colors.white,
                    //                               border: Border.all(
                    //                                   color: Colors.blue,
                    //                                   width: 2),
                    //                               borderRadius:
                    //                                   BorderRadius.all(
                    //                                       Radius.circular(10))),
                    //                         ),
                    //                       ),
                    //                     ]),
                    //               )
                    //             ],
                    //           ),
                    //           padding: EdgeInsets.fromLTRB(36, 23, 0, 33),
                    //           decoration: BoxDecoration(
                    //               borderRadius:
                    //                   BorderRadius.all(Radius.circular(15)),
                    //               color: Colors.white),
                    //           // color: Colors.white,
                    //           height: 218,
                    //           width: 403,
                    //         ),
                    //       ),
                    //     ),
                    //     Align(
                    //       alignment: Alignment.centerLeft,
                    //       child: Image(
                    //           image: AssetImage("images/left_vector.png")),
                    //     ),
                    //   ]),
                    //   height: 218,
                    //   width: 450,
                    //   // color: Colors.red,
                    // ),
                    // Spacer(),
                    // InkWell(
                    //   onTap: () {
                    //     Get.toNamed("/mercusuara");
                    //   },
                    //   child: Container(
                    //     child: Row(
                    //       children: [
                    //         Container(
                    //           width: 122,
                    //           height: 162,
                    //           child: Center(
                    //             child: Image(
                    //               image: AssetImage(
                    //                   "images/mercu_poster_main.jpg"),
                    //               fit: BoxFit.fill,
                    //             ),
                    //           ),
                    //         ),
                    //         SizedBox(
                    //           width: 35,
                    //         ),
                    //         Container(
                    //           // color: Colors.red,
                    //           width: 200,
                    //           child: Column(children: [
                    //             Text(
                    //               "Mercusuara",
                    //               style: TextStyle(fontSize: 24),
                    //             ),
                    //             SizedBox(
                    //               height: 16,
                    //             ),
                    //             Row(
                    //               mainAxisAlignment: MainAxisAlignment.center,
                    //               crossAxisAlignment: CrossAxisAlignment.center,
                    //               children: [
                    //                 Icon(
                    //                   Icons.location_on,
                    //                   size: 15,
                    //                   color: Colors.grey,
                    //                 ),
                    //                 SizedBox(
                    //                   width: 3,
                    //                 ),
                    //                 Text(
                    //                   "Droomhaven",
                    //                   style: TextStyle(fontSize: 14),
                    //                 )
                    //               ],
                    //             ),
                    //             Text(
                    //               "   Kota Malang, Jawa Timur",
                    //               style: TextStyle(
                    //                   fontSize: 14, color: Colors.grey),
                    //             ),
                    //             Row(
                    //               mainAxisAlignment: MainAxisAlignment.center,
                    //               crossAxisAlignment: CrossAxisAlignment.center,
                    //               children: [
                    //                 Icon(Icons.calendar_today,
                    //                     size: 12, color: Colors.grey),
                    //                 SizedBox(
                    //                   width: 3,
                    //                 ),
                    //                 Text(
                    //                   "5 Juni 2022",
                    //                   style: TextStyle(fontSize: 14),
                    //                 )
                    //               ],
                    //             ),
                    //             SizedBox(
                    //               height: 20,
                    //             ),
                    //             Container(
                    //               height: 34,
                    //               width: 94,
                    //               child: Align(
                    //                 alignment: Alignment.center,
                    //                 child: Text(
                    //                   "SOLD!",
                    //                   style: TextStyle(color: Colors.blue),
                    //                 ),
                    //               ),
                    //               decoration: BoxDecoration(
                    //                   color: Colors.white,
                    //                   border: Border.all(
                    //                       color: Colors.blue, width: 2),
                    //                   borderRadius: BorderRadius.all(
                    //                       Radius.circular(10))),
                    //             ),
                    //           ]),
                    //         )
                    //       ],
                    //     ),
                    //     padding: EdgeInsets.fromLTRB(36, 23, 0, 33),
                    //     height: 218,
                    //     width: 403,
                    //     decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.all(Radius.circular(15)),
                    //         color: Colors.white),
                    //     // color: Colors.white,
                    //   ),
                    // ),
                    // Spacer(),
                    // Container(
                    //   child: Stack(children: [
                    //     Center(
                    //       child: InkWell(
                    //         onTap: () {
                    //           Get.toNamed("/SignatureeFestival");
                    //         },
                    //         child: Container(
                    //           child: Row(
                    //             children: [
                    //               Container(
                    //                 width: 122,
                    //                 height: 162,
                    //                 child: Center(
                    //                   child: Image(
                    //                     image: AssetImage(
                    //                         "images/signatur_poster_main.jpg"),
                    //                     fit: BoxFit.fill,
                    //                   ),
                    //                 ),
                    //               ),
                    //               SizedBox(
                    //                 width: 35,
                    //               ),
                    //               Container(
                    //                 // color: Colors.red,
                    //                 width: 200,
                    //                 child: Column(children: [
                    //                   Center(
                    //                     child: Text(
                    //                       "Signaturee Festival",
                    //                       style: TextStyle(fontSize: 20),
                    //                     ),
                    //                   ),
                    //                   SizedBox(
                    //                     height: 16,
                    //                   ),
                    //                   Row(
                    //                     mainAxisAlignment:
                    //                         MainAxisAlignment.center,
                    //                     crossAxisAlignment:
                    //                         CrossAxisAlignment.center,
                    //                     children: [
                    //                       Icon(
                    //                         Icons.location_on,
                    //                         size: 15,
                    //                         color: Colors.grey,
                    //                       ),
                    //                       SizedBox(
                    //                         width: 3,
                    //                       ),
                    //                       Text(
                    //                         "Kusuma Agro Wisata",
                    //                         style: TextStyle(fontSize: 14),
                    //                       )
                    //                     ],
                    //                   ),
                    //                   Text(
                    //                     "   Kota Batu, Jawa Timur",
                    //                     style: TextStyle(
                    //                         fontSize: 14, color: Colors.grey),
                    //                   ),
                    //                   Row(
                    //                     mainAxisAlignment:
                    //                         MainAxisAlignment.center,
                    //                     crossAxisAlignment:
                    //                         CrossAxisAlignment.center,
                    //                     children: [
                    //                       Icon(Icons.calendar_today,
                    //                           size: 12, color: Colors.grey),
                    //                       SizedBox(
                    //                         width: 3,
                    //                       ),
                    //                       Text(
                    //                         "23 Juli 2022",
                    //                         style: TextStyle(fontSize: 14),
                    //                       )
                    //                     ],
                    //                   ),
                    //                   SizedBox(
                    //                     height: 20,
                    //                   ),
                    //                   InkWell(
                    //                     onTap: () {
                    //                       Get.toNamed(
                    //                           "/SignatureeFestival/tickets");
                    //                     },
                    //                     child: Container(
                    //                       height: 34,
                    //                       width: 94,
                    //                       child: Align(
                    //                         alignment: Alignment.center,
                    //                         child: Text(
                    //                           "SOLD!",
                    //                           style:
                    //                               TextStyle(color: Colors.blue),
                    //                         ),
                    //                       ),
                    //                       decoration: BoxDecoration(
                    //                           color: Colors.white,
                    //                           border: Border.all(
                    //                               color: Colors.blue, width: 2),
                    //                           borderRadius: BorderRadius.all(
                    //                               Radius.circular(10))),
                    //                     ),
                    //                   ),
                    //                 ]),
                    //               )
                    //             ],
                    //           ),
                    //           padding: EdgeInsets.fromLTRB(36, 23, 0, 33),
                    //           decoration: BoxDecoration(
                    //               borderRadius:
                    //                   BorderRadius.all(Radius.circular(15)),
                    //               color: Colors.white),
                    //           // color: Colors.white,
                    //           height: 218,
                    //           width: 403,
                    //         ),
                    //       ),
                    //     ),
                    //     Align(
                    //       alignment: Alignment.centerRight,
                    //       child: Image(
                    //           image: AssetImage("images/right_vector.png")),
                    //     ),
                    //   ]),
                    //   height: 218,
                    //   width: 450,
                    //   // color: Colors.red,
                    // ),
                    // Spacer(),
                  ]),
                  height: 230,
                  width: 1340,
                  // color: Colors.white,
                ),
                Spacer()
              ]),
              height: 859,
              width: MediaQuery.of(context).size.width,
              color: Colors.blue,
            ),
            Container(
              height: 221,
              width: MediaQuery.of(context).size.width,
              color: Color(0xff4181ED),
            ),
          ] else ...[
            //Mobile View
            Container(
              child: Row(children: [
                InkWell(
                  child: Image(
                    image: AssetImage("images/agendakan_logo_with_text.png"),
                    height: MediaQuery.of(context).size.width / 12,
                  ),
                ),
                Spacer(),
                InkWell(
                    onTap: () {
                      _key.currentState?.openEndDrawer();
                      //Scaffold.of(context).openEndDrawer();
                    },
                    child: Container(
                        child: Icon(
                      Icons.menu,
                      size: MediaQuery.of(context).size.width / 16,
                    ))),
                SizedBox(
                  width: 20,
                )
              ]),
              // color: Colors.white,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(bottom: BorderSide(color: Colors.black))),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width / 8,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Row(children: [
                //skipp
                Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width / 16,
                  height: MediaQuery.of(context).size.width / 1.5,
                ),
                //poster
                Container(
                  padding: EdgeInsets.fromLTRB(40, 10, 0, 10),
                  // color: Colors.white,
                  child: Image(
                      image: AssetImage("images/gkm_poster_main.png"),
                      fit: BoxFit.fitHeight),
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20))),
                  width: MediaQuery.of(context).size.width / 1.9,
                  height: MediaQuery.of(context).size.width / 1.5,
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Gebyar Kreativitas Mahasiswa",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width / 18),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: MediaQuery.of(context).size.width / 25,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 45,
                          ),
                          Text(
                            "2 December 2022",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width / 30,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: MediaQuery.of(context).size.width / 25,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 45,
                          ),
                          Text(
                            "Graha Cakrawala",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width / 30,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // color: Colors.white,
                  color: Colors.orange,
                  width: MediaQuery.of(context).size.width / 2.45,
                  height: MediaQuery.of(context).size.width / 1.5,
                ),
              ]),
              // color: Colors.orange,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width / 1.5,
            ),
            SizedBox(
              height: 50,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text(
                    "All Event",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.blue, width: 3))),
                ),
                width: 145,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: CarouselSlider(
                  items: [
                    {
                      "title": "Gebyar Kreativitas\nMahasiswa",
                      "alamat": "Graha Cakrawala",
                      "time": "2 Desember 2022",
                      "image": "images/gkm_poster_main.png",
                      "status": "BUY NOW",
                      "link": "/gkm"
                    },
                    {
                      "title": "FIPFEST",
                      "alamat": "Graha Cakrawala",
                      "time": "8 Desember 2022",
                      "image": "images/fipfest_poster_main.png",
                      "status": "BUY NOW",
                      "link": "/fipfest"
                    },
                    {
                      "title": "WEEKFEST",
                      "alamat": "Balai Pemuda\nSurabaya",
                      "time": "18 - 20 Desember 2022",
                      "image": "images/weekfest_poster_main.png",
                      "status": "BUY NOW",
                      "link": "/weekfest"
                    },
                    {
                      "title": "Signaturee",
                      "alamat": "Kusuma Agro Wisata",
                      "time": "23 Juli 2022",
                      "image": "images/signatur_poster_main.jpg",
                      "status": "SOLD!",
                      "link": "/SignatureeFestival"
                    },
                    {
                      "title": "Mercusuara",
                      "alamat": "Droomhaven",
                      "time": "5 Juni 2022",
                      "image": "images/mercu_poster_main.jpg",
                      "status": "SOLD!",
                      "link": "/mercusuara"
                    },
                  ].map((e) {
                    return Builder(builder: (context) {
                      return Container(
                        child: Container(
                          child: Row(
                            children: [
                              Expanded(
                                child: Image(
                                    image: AssetImage(e["image"].toString())),
                                flex: 3,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      e["title"].toString(),
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          size: 15,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          e["alamat"].toString(),
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.calendar_today,
                                          size: 15,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(e["time"].toString()),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.toNamed(e["link"].toString());
                                      },
                                      child: Container(
                                        height: 34,
                                        width: 94,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            e["status"].toString(),
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color: Colors.blue, width: 2),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                      ),
                                    ),
                                  ],
                                ),
                                flex: 5,
                              )
                            ],
                          ),
                          margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
                          padding: EdgeInsets.fromLTRB(25, 0, 10, 0),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              color: Colors.white,
                              border: Border.all(
                                  color: Color(0xff4181ED), width: 3),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                        ),
                        width: MediaQuery.of(context).size.width,
                      );
                    });
                  }).toList(),
                  options: CarouselOptions(
                    //aspectRatio: 2.0,
                    //enlargeCenterPage: true,
                    viewportFraction: 1,
                    scrollDirection: Axis.horizontal,
                    autoPlay: false,
                  )),
            ),
            SizedBox(
              height: 50,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text(
                    "Available",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.blue, width: 3))),
                ),
                width: 149,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: CarouselSlider(
                  items: [
                    {
                      "title": "Gebyar Kreativitas\nMahasiswa",
                      "alamat": "Graha Cakrawala",
                      "time": "2 Desember 2022",
                      "image": "images/gkm_poster_main.png",
                      "status": "BUY NOW",
                      "link": "/gkm"
                    },
                    {
                      "title": "FIPFEST",
                      "alamat": "Graha Cakrawala",
                      "time": "8 Desember 2022",
                      "image": "images/fipfest_poster_main.png",
                      "status": "BUY NOW",
                      "link": "/fipfest"
                    },
                    {
                      "title": "WEEKFEST",
                      "alamat": "Balai Pemuda\nSurabaya",
                      "time": "18 - 20 Desember 2022",
                      "image": "images/weekfest_poster_main.png",
                      "status": "BUY NOW",
                      "link": "/weekfest"
                    },
                  ].map((e) {
                    return Builder(builder: (context) {
                      return Container(
                        child: Container(
                          child: Row(
                            children: [
                              Expanded(
                                child: Image(
                                    image: AssetImage(e["image"].toString())),
                                flex: 3,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      e["title"].toString(),
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          size: 15,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          e["alamat"].toString(),
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.calendar_today,
                                          size: 15,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(e["time"].toString()),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.toNamed(e["link"].toString());
                                      },
                                      child: Container(
                                        height: 34,
                                        width: 94,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            e["status"].toString(),
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color: Colors.blue, width: 2),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                      ),
                                    ),
                                  ],
                                ),
                                flex: 5,
                              )
                            ],
                          ),
                          margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
                          padding: EdgeInsets.fromLTRB(25, 0, 10, 0),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              color: Colors.white,
                              border: Border.all(
                                  color: Color(0xff4181ED), width: 3),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                        ),
                        width: MediaQuery.of(context).size.width,
                      );
                    });
                  }).toList(),
                  options: CarouselOptions(
                    //aspectRatio: 2.0,
                    //enlargeCenterPage: true,
                    viewportFraction: 1,
                    scrollDirection: Axis.horizontal,
                    autoPlay: false,
                  )),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: Column(
                children: [
                  Spacer(),
                  Divider(
                    color: Colors.white,
                  ),
                  Text(
                    "© 2021 - 2023 agendakan.com | All right reserved",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
              color: Colors.blue,
              height: 200,
              width: MediaQuery.of(context).size.width,
            )
          ]
        ],
      )),
    );
  }
}
