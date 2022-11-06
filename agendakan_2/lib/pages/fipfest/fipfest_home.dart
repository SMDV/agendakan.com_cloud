import 'package:agendakan_2/pages/fipfest/repository/gkm_api.dart';
import 'package:agendakan_2/pages/gkm/repository/gkm_api.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FipFestHome extends StatefulWidget {
  const FipFestHome({Key? key}) : super(key: key);

  @override
  State<FipFestHome> createState() => _FipFestHome_HomeState();
}

class _FipFestHome_HomeState extends State<FipFestHome> {
  final data_store = GetStorage();
  GlobalKey<ScaffoldState> _key = GlobalKey();
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
                      Get.offAndToNamed('/fipfest/ticket_list');
                    } else {
                      Get.offAndToNamed('/fipfest/ticket_list');
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
                    data_store.remove('acara');
                    Get.offAllNamed("/fipfest");
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
                    Get.offAllNamed("/fipfest/loginpage");
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
                SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {
                    Get.offAllNamed("/");
                  },
                  child: Container(
                    child: Image(
                      image: AssetImage("images/icon-01.png"),
                      fit: BoxFit.fill,
                    ),
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
              color: Colors.white,
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
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          child: Image(
                            image: AssetImage("images/icon-01.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  if (data_store.read("token") != null) ...[
                    InkWell(
                      child: Container(
                        child: Container(
                          height: 40,
                          width: 100,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "TICKET LIST",
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
                      onTap: () {
                        if (data_store.read("isAdmin") == 1) {
                          Get.offAndToNamed('/fipfest/ticket_list');
                        } else {
                          Get.toNamed('/fipfest/ticket_list');
                        }
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
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
                      onTap: () {
                        data_store.remove('token');
                        data_store.remove('isAdmin');
                        data_store.remove('acara');
                        Get.offAllNamed("/fipfest");
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ] else ...[
                    InkWell(
                      onTap: () {
                        Get.toNamed("/fipfest/loginpage");
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
                        Get.toNamed("/fipfest/registerpage");
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
                    SizedBox(
                      width: 25,
                    )
                  ],
                ],
              ),
              color: Colors.white,
              height: MediaQuery.of(context).size.height / 12,
              constraints: BoxConstraints(maxHeight: 100),
            ),
          ],
          //Slider Image
          Container(
            child: CarouselSlider(
                items: [
                  'images/fipfest_carausel_1.png',
                  'images/fipfest_carausel_2.png',
                  'images/fipfest_carausel_3.png',
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
            color: Color(0xff4181ED),
            // width: MediaQuery.of(context).size.width,
            //height: MediaQuery.of(context).size.height,
          ),
          //Guest Star
          // if (MediaQuery.of(context).size.width <= 1100) ...[
          if (false)
            ...[]
          else ...[
            AspectRatio(
              aspectRatio: 16 / 8,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.width / 16,
                      // (MediaQuery.of(context).size.width <= 500) ? 30 : 70,
                      child: Image(
                        image: AssetImage("images/gkm_gs_logo.png"),
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
                                    // Spacer(),
                                    InkWell(
                                      // onTap: () {
                                      //   Get.offAllNamed(
                                      //       "/SignatureeFestival/gueststar");
                                      // },
                                      child: Container(
                                        child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Image.asset(
                                              "images/fipfest_gs_1.png"),
                                        ),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                4,
                                        height:
                                            MediaQuery.of(context).size.width /
                                                5,
                                        decoration: BoxDecoration(
                                            color: Color(0xffF1F1F1),
                                            // image: DecorationImage(
                                            //     image: AssetImage(
                                            //         'images/fipfest_gs_letto.png'),
                                            //     fit: BoxFit.fitWidth),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 15,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      // onTap: () {
                                      //   Get.offAllNamed(
                                      //       "/SignatureeFestival/gueststar");
                                      // },
                                      child: Container(
                                        // padding: EdgeInsets.all(
                                        //     MediaQuery.of(context).size.width /
                                        //         20),
                                        child: Image.asset(
                                            "images/fipfest_gs_2.png"),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                4,
                                        height:
                                            MediaQuery.of(context).size.width /
                                                5,
                                        decoration: BoxDecoration(
                                            color: Color(0xffF1F1F1)
                                                .withOpacity(0),
                                            // image: DecorationImage(
                                            //     image: AssetImage(
                                            //         'images/gkm_gs_comingsoon.png'),
                                            //     fit: BoxFit.scaleDown),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 15,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Spacer(),
                                    InkWell(
                                      // onTap: () {
                                      //   Get.offAllNamed(
                                      //       "/SignatureeFestival/gueststar");
                                      // },
                                      child: Container(
                                        padding: EdgeInsets.all(
                                            MediaQuery.of(context).size.width /
                                                20),
                                        child: Image.asset(
                                            "images/gkm_gs_comingsoon.png"),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                4,
                                        height:
                                            MediaQuery.of(context).size.width /
                                                5,
                                        decoration: BoxDecoration(
                                            color: Color(0xffF1F1F1),
                                            // image: DecorationImage(
                                            //     image: AssetImage(
                                            //         'images/gkm_gs_comingsoon.png'),
                                            //     fit: BoxFit.scaleDown),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                      ),
                                    ),
                                  ],
                                ),
                                // SizedBox(
                                //   width: MediaQuery.of(context).size.width / 15,
                                // ),
                                // Column(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children: [
                                //     // Spacer(),
                                //     InkWell(
                                //       // onTap: () {
                                //       //   Get.offAllNamed(
                                //       //       "/SignatureeFestival/gueststar");
                                //       // },
                                //       child: Container(
                                //         width:
                                //             MediaQuery.of(context).size.width /
                                //                 4,
                                //         height:
                                //             MediaQuery.of(context).size.width /
                                //                 5,
                                //         decoration: BoxDecoration(
                                //             color: Color(0xffF1F1F1),
                                //             image: DecorationImage(
                                //                 image: AssetImage(
                                //                     'images/gkm_gs_comingsoon.png'),
                                //                 fit: BoxFit.scaleDown),
                                //             borderRadius: BorderRadius.all(
                                //                 Radius.circular(20))),
                                //       ),
                                //     ),
                                //   ],
                                // ),
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
                color: Color(0xffFFBD66),
                height: MediaQuery.of(context).size.height,
              ),
            ),
          ],
          //Deskripsi
          AspectRatio(
            aspectRatio: 16 / 8,
            child: Row(children: [
              Container(
                padding: EdgeInsets.all(MediaQuery.of(context).size.width / 20),
                child: Image(image: AssetImage("images/fipfest_desc_left.png")),
                color: Color(0xffFF9C1A),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width / 2,
              ),
              Container(
                child: Image(
                    image:
                        AssetImage("images/fipfest_date_location_right.png")),
                color: Color(0xffFFF9E0),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width / 2,
              ),
            ]),
          ),
          //Book now
          AspectRatio(
            aspectRatio: 16 / 8,
            child: Container(
              child: Column(children: [
                Spacer(),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Image(
                    image: AssetImage("images/gkm_booknow_logo.png"),
                  ),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width / 16,
                      0,
                      MediaQuery.of(context).size.width / 16,
                      0),
                  child: Row(
                    children: [
                      Spacer(),
                      InkWell(
                        onTap: () async {
                          // Get.defaultDialog(
                          //     title: "*MAINTENANCE*",
                          //     content: Center(
                          //       child: Text(
                          //           "Please Wait! \nThis function is still in maintenance!"),
                          //     ));
                          final _provider = FipFest_API();
                          dynamic data = await _provider.get7();
                          print(data['presale1']);
                          if (data['presale1'] != "tutup") {
                            final data_store = GetStorage();
                            if (data_store.read("token") != null) {
                              data_store.write("jenis_tiket", "presale1");
                              Get.toNamed("/fipfest/ticket_form");
                            } else {
                              Get.toNamed("/fipfest/loginpage");
                            }
                          } else {
                            Get.defaultDialog(
                                content: Text("Ticket sudah Sold Out!"));
                          }
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xffFFF9E0).withOpacity(0.5),
                                border:
                                    Border.all(color: Colors.blue, width: 2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            width: MediaQuery.of(context).size.width / 4,
                            height: MediaQuery.of(context).size.width / 8,
                            child: Column(
                              children: [
                                Spacer(),
                                Container(
                                  width: MediaQuery.of(context).size.width / 8,
                                  // height: MediaQuery.of(context).size.width / 8,
                                  // child: Image(
                                  //   image: AssetImage("images/fipfest_p1.png"),
                                  //   fit: BoxFit.fitHeight,
                                  // ),
                                  // kalo sudah sold out
                                  child: Image(
                                    image: AssetImage("images/sold_out.png"),
                                    fit: BoxFit.fitHeight,
                                  ),
                                  decoration: BoxDecoration(
                                      // color: Colors.black.withOpacity(0.85),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "images/fipfest_p1.png"))),
                                ),
                                Spacer(),
                              ],
                            )),
                      ),
                      Spacer(),
                      // InkWell(
                      //   onTap: () async {
                      //     // Get.defaultDialog(
                      //     //     title: "*MAINTENANCE*",
                      //     //     content: Center(
                      //     //       child: Text(
                      //     //           "Please Wait! \nThis function is still in maintenance!"),
                      //     //     ));
                      //     final _provider = GKM_API();
                      //     dynamic data = await _provider.get7();
                      //     print(data['presale1']);
                      //     if (data['presale1'] != "tutup") {
                      //       final data_store = GetStorage();
                      //       if (data_store.read("token") != null) {
                      //         data_store.write("jenis_tiket", "presale1");
                      //         Get.toNamed("/gkm/ticket_form");
                      //       } else {
                      //         Get.toNamed("/loginpage");
                      //       }
                      //     } else {
                      //       Get.defaultDialog(
                      //           content: Text("Ticket sudah Sold Out!"));
                      //     }
                      //   },
                      //   child: Container(
                      //       decoration: BoxDecoration(
                      //           color: Color(0xffFFF9E0).withOpacity(0.5),
                      //           border:
                      //               Border.all(color: Colors.blue, width: 2),
                      //           borderRadius:
                      //               BorderRadius.all(Radius.circular(20))),
                      //       width: MediaQuery.of(context).size.width / 4,
                      //       height: MediaQuery.of(context).size.width / 8,
                      //       child: Column(
                      //         children: [
                      //           Spacer(),
                      //           Container(
                      //             width: MediaQuery.of(context).size.width / 8,
                      //             // height: MediaQuery.of(context).size.width / 8,
                      //             child: Image(
                      //               image: AssetImage("images/sold_out.png"),
                      //               fit: BoxFit.fitHeight,
                      //             ),
                      //             decoration: BoxDecoration(
                      //                 // color: Colors.black.withOpacity(0.85),
                      //                 image: DecorationImage(
                      //                     image:
                      //                         AssetImage("images/gkm_p3.png"))),
                      //           ),
                      //           Spacer(),
                      //         ],
                      //       )),
                      // ),
                      // Spacer(),
                      InkWell(
                        onTap: () async {
                          final _provider = FipFest_API();
                          dynamic data = await _provider.get7();
                          print(data['presale2']);
                          if (data['presale2'] != "tutup") {
                            final data_store = GetStorage();
                            if (data_store.read("token") != null) {
                              data_store.write("jenis_tiket", "presale2");
                              Get.toNamed("/fipfest/ticket_form");
                            } else {
                              Get.toNamed("/fipfest/loginpage");
                            }
                          } else {
                            Get.defaultDialog(
                                content: Text("Ticket sudah Sold Out!"));
                          }
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xffFFF9E0).withOpacity(0.5),
                                border:
                                    Border.all(color: Colors.blue, width: 2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            width: MediaQuery.of(context).size.width / 4,
                            height: MediaQuery.of(context).size.width / 8,
                            child: Column(
                              children: [
                                Spacer(),
                                Container(
                                  width: MediaQuery.of(context).size.width / 8,
                                  // height: MediaQuery.of(context).size.width / 8,
                                  // child: Image(
                                  //   image: AssetImage("images/fipfest_p1.png"),
                                  //   fit: BoxFit.fitHeight,
                                  // ),
                                  // kalo sudah sold out
                                  child: Image(
                                    image: AssetImage("images/fipfest_p2.png"),
                                    fit: BoxFit.fitHeight,
                                  ),
                                  decoration: BoxDecoration(
                                      // color: Colors.black.withOpacity(0.85),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "images/fipfest_p2.png"))),
                                ),
                                Spacer(),
                              ],
                            )),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                Spacer(),
                // InkWell(
                //   onTap: () async {
                //     // Get.defaultDialog(
                //     //     title: "*MAINTENANCE*",
                //     //     content: Center(
                //     //       child: Text(
                //     //           "Please Wait! \nThis function is still in maintenance!"),
                //     //     ));
                //     final _provider = GKM_API();
                //     dynamic data = await _provider.get7();
                //     print(data['presale3']);
                //     if (data['presale3'] != "tutup") {
                //       final data_store = GetStorage();
                //       if (data_store.read("token") != null) {
                //         data_store.write("jenis_tiket", "presale3");
                //         Get.toNamed("/gkm/ticket_form");
                //       } else {
                //         Get.toNamed("/loginpage");
                //       }
                //     } else {
                //       Get.defaultDialog(
                //           content: Text("Ticket sudah Sold Out!"));
                //     }
                //   },
                //   child: Container(
                //       decoration: BoxDecoration(
                //           color: Color(0xffFFF9E0).withOpacity(0.5),
                //           border: Border.all(color: Colors.blue, width: 2),
                //           borderRadius: BorderRadius.all(Radius.circular(20))),
                //       width: MediaQuery.of(context).size.width / 4,
                //       height: MediaQuery.of(context).size.width / 8,
                //       child: Column(
                //         children: [
                //           Spacer(),
                //           Container(
                //             width: MediaQuery.of(context).size.width / 8,
                //             // height: MediaQuery.of(context).size.width / 8,
                //             child: Image(
                //               image: AssetImage("images/gkm_p5.png"),
                //               fit: BoxFit.fitHeight,
                //             ),
                //             decoration: BoxDecoration(
                //                 // color: Colors.black.withOpacity(0.85),
                //                 image: DecorationImage(
                //                     image: AssetImage("images/gkm_p5.png"))),
                //           ),
                //           Spacer(),
                //         ],
                //       )),
                // ),
                Spacer(),
              ]),
              color: Color(0xffFFBD66),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
          ),

          // ),
          //Footer
          if (MediaQuery.of(context).size.width <= 1100)
            ...[]
          else ...[
            //footer web
            Container(
              child: Row(
                children: [
                  Spacer(),
                  Column(
                    children: [
                      Spacer(),
                      Container(
                        // color: Colors.white,
                        height: 150,
                        width: 150,
                        child: Image(
                          image: AssetImage("images/icon-01.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              FontAwesomeIcons.instagram,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 28,
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              FontAwesomeIcons.whatsapp,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 28,
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              FontAwesomeIcons.telegram,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 28,
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              FontAwesomeIcons.discord,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                    ],
                  ),
                  Spacer(),
                  VerticalDivider(
                    color: Colors.white,
                    thickness: 1.5,
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Spacer(),
                      Container(
                        // color: Colors.white,
                        height: 120,
                        child: Image(
                          image: AssetImage("images/fipfest_logo.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () async {
                              if (await canLaunchUrl(Uri.parse(
                                  "https://www.instagram.com/fipfest/"))) {
                                await launchUrl(Uri.parse(
                                    "https://www.instagram.com/fipfest/"));
                              } else {
                                throw 'Could not launch insta';
                              }
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                FontAwesomeIcons.instagram,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 28,
                          ),
                          InkWell(
                            onTap: () async {
                              if (await canLaunchUrl(
                                  Uri.parse("https://wa.me/6282233591076"))) {
                                await launchUrl(
                                    Uri.parse("https://wa.me/6282233591076"));
                              } else {
                                throw 'Could not launch insta';
                              }
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                FontAwesomeIcons.whatsapp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   width: 28,
                          // ),
                          // Container(
                          //   height: 40,
                          //   width: 40,
                          //   decoration: BoxDecoration(
                          //     color: Colors.black.withOpacity(0.5),
                          //     shape: BoxShape.circle,
                          //   ),
                          //   child: Icon(
                          //     FontAwesomeIcons.whatsapp,
                          //     color: Colors.white,
                          //   ),
                          // ),
                          // SizedBox(
                          //   width: 28,
                          // ),
                          // Container(
                          //   height: 40,
                          //   width: 40,
                          //   decoration: BoxDecoration(
                          //     color: Colors.black.withOpacity(0.5),
                          //     shape: BoxShape.circle,
                          //   ),
                          //   child: Icon(
                          //     FontAwesomeIcons.facebook,
                          //     color: Colors.white,
                          //   ),
                          // ),
                          // SizedBox(
                          //   width: 28,
                          // ),
                          // Container(
                          //   height: 40,
                          //   width: 40,
                          //   decoration: BoxDecoration(
                          //     color: Colors.black.withOpacity(0.5),
                          //     shape: BoxShape.circle,
                          //   ),
                          //   child: Icon(
                          //     FontAwesomeIcons.youtube,
                          //     color: Colors.white,
                          //   ),
                          // ),
                        ],
                      ),
                      Spacer()
                    ],
                  ),
                  Spacer()
                ],
              ),
              padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
              color: Color(0xff4181ED),
              height: MediaQuery.of(context).size.height / 3,
            ),
            Container(
              child: Column(children: [
                Spacer(),
                Center(
                    child: Image(
                        image:
                            AssetImage("images/footer_bottom_reserved.png"))),
                Spacer(),
              ]),
              // padding: EdgeInsets.fromLTRB(0, 40, 0, 40),
              color: Color(0xff4181ED),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 12,
            )
          ],
        ]),
      ),
    );
  }
}
