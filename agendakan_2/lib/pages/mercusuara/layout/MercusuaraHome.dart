import 'package:agendakan_2/pages/mercusuara/controller/BuyTicketMercusuara.dart';
import 'package:agendakan_2/pages/mercusuara/controller/CheckTicketMercusuara.dart';
import 'package:agendakan_2/pages/oase/BuyTicket.dart';
import 'package:agendakan_2/pages/oase/new_layout/youtube_plugin.dart';
import 'package:agendakan_2/plugins/AvailabilityTicket.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hovering/hovering.dart';

class MercusuaraHome extends StatefulWidget {
  const MercusuaraHome({Key? key}) : super(key: key);

  @override
  State<MercusuaraHome> createState() => _MercusuaraHomeState();
}

class _MercusuaraHomeState extends State<MercusuaraHome> {
  final data_store = GetStorage();
  final CheckTicketMercusuara ticketControl = Get.put(CheckTicketMercusuara());
  GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    ticketControl.checkAllTicket();
    return Title(
      color: Colors.white,
      title: "Agendakan.com x Mercusuara",
      child: Scaffold(
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
                      height: 55,
                      child: Image(
                        image: AssetImage("images/logo_mercusuara.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              if (data_store.read("token") != null) ...[
                Container(
                  decoration: BoxDecoration(
                      border: Border(top: BorderSide(), bottom: BorderSide())),
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
                        Get.offAndToNamed('/mercusuara/ticketlistAdmin');
                      } else {
                        Get.offAndToNamed('/mercusuara/ticketlist');
                      }
                    },
                  ),
                ),
                Container(
                  decoration:
                      BoxDecoration(border: Border(bottom: BorderSide())),
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
                      Get.offAllNamed("/mercusuara");
                    },
                  ),
                ),
              ] else ...[
                Container(
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(), top: BorderSide())),
                  child: ListTile(
                    title: Column(
                      children: [
                        Center(
                            child: Text(
                          "LOG IN /",
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Syne',
                              fontWeight: FontWeight.w800),
                        )),
                        Center(
                            child: Text(
                          "SIGN UP",
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Syne',
                              fontWeight: FontWeight.w800),
                        )),
                      ],
                    ),
                    onTap: () {
                      Get.offAllNamed("/mercusuara/loginpage");
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
                      Get.offAllNamed("/mercusuara");
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
                            image: AssetImage("images/logo_mercusuara.png"),
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
                color: Color(0xffE8C41E),
                height: MediaQuery.of(context).size.height / 12,
                constraints: BoxConstraints(maxHeight: 100),
              )
            ] else ...[
              Container(
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.offAllNamed("/mercusuara");
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
                            width: 30,
                          ),
                          Container(
                            // color: Colors.red,
                            height: 45,
                            child: Image(
                              image: AssetImage("images/logo_mercusuara.png"),
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
                          // color: Color(0xffBCBEC0),
                          fontFamily: 'Syne',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      onTap: () {
                        Get.offAllNamed("/mercusuara");
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
                                  color: Color(0xff231F20),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: 'Syne',
                                ),
                              ),
                              Text(
                                "LIST",
                                style: TextStyle(
                                  color: Color(0xff231F20),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: 'Syne',
                                ),
                              ),
                            ],
                          ),
                          width: 150,
                          color: Colors.white.withOpacity(0.75),
                        ),
                        onTap: () {
                          if (data_store.read("isAdmin") == 1) {
                            Get.offAndToNamed('/mercusuara/ticketlistAdmin');
                          } else {
                            Get.offAndToNamed('/mercusuara/ticketlist');
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
                                  color: Color(0xffBCBEC0),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: 'Syne',
                                ),
                              ),
                            ],
                          ),
                          width: 150,
                          color: Color(0xff383838),
                        ),
                        onTap: () {
                          data_store.remove('token');
                          data_store.remove('isAdmin');
                          Get.offAllNamed("/mercusuara");
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
                                  color: Color(0xffBCBEC0),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: 'Syne',
                                ),
                              ),
                              Text(
                                "SIGN UP",
                                style: TextStyle(
                                  color: Color(0xffBCBEC0),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: 'Syne',
                                ),
                              )
                            ],
                          ),
                          width: 150,
                          color: Color(0xff383838),
                        ),
                        onTap: () {
                          Get.offAllNamed("/mercusuara/loginpage");
                        },
                      )
                    ],
                  ],
                ),
                color: Color(0xffE8C41E),
                height: MediaQuery.of(context).size.height / 12,
                constraints: BoxConstraints(maxHeight: 100),
              ),
            ],
            //Slider Image
            Container(
              child: CarouselSlider(
                  items: [
                    'images/poster_mercusuara_1.jpg',
                    'images/poster_mercusuara_2.jpg',
                    'images/poster_mercusuara_3.jpg',
                    'images/poster_mercusuara_4.jpg',
                    'images/poster_mercusuara_5.jpg',
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

            AspectRatio(
              aspectRatio: 16 / 8,
              child: Container(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  // padding: (MediaQuery.of(context).size.width >= 1100)
                  //     ? EdgeInsets.all(130)
                  //     : EdgeInsets.all(10),
                  child: Image(
                    image: AssetImage("images/desc_mercusuara.jpg"),
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
            if (false)
              ...[]
            else ...[
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.width / 16,
                        // (MediaQuery.of(context).size.width <= 500) ? 30 : 70,
                        child: FittedBox(
                          fit: BoxFit.fitHeight,
                          child: Text(
                            "Guest Star",
                            style: TextStyle(
                                fontSize: 60,
                                fontFamily: 'Syne',
                                fontWeight: FontWeight.w800,
                                color: Color(0xffE8C41E)),
                          ),
                        ),
                        // Image(
                        //   image: AssetImage("images/HeaderGS.png"),
                        //   fit: BoxFit.fitHeight,
                        // ),
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Spacer(),
                          Container(
                            width: MediaQuery.of(context).size.width / 5 * 4,
                            child: Align(
                              alignment: Alignment.center,
                              // physics: const AlwaysScrollableScrollPhysics(),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          // Get.offAllNamed(
                                          //     "/SignatureeFestival/gueststar");
                                        },
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'images/iksan.png'),
                                                  fit: BoxFit.fill)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              //scrollDirection: Axis.horizontal,
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
                          image: AssetImage('images/gs_mercusuara_bg.jpg'),
                          fit: BoxFit.fill)),
                  height: MediaQuery.of(context).size.height,
                ),
              ),
            ],
            //Photo Location
            AspectRatio(
              aspectRatio: 16 / 8,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        // flex: 2,
                        child: Container(
                      height: MediaQuery.of(context).size.height,
                      child: Image(
                        fit: BoxFit.fill,
                        image: AssetImage("images/Tgl_Lokasi_Full.jpg"),
                      ),
                    )),
                  ],
                ),
                // color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
            ),
            ticketControl.obx((state) => AspectRatio(
                  aspectRatio: 16 / 8,
                  child: Container(
                    child: Center(
                      child: InkWell(
                        onTap: (ticketControl.data['presale'] != "buka")
                            ? () {
                                Get.defaultDialog(
                                    content: Text("Ticket Habis!"));
                              }
                            : () {
                                beliTicket(context);
                              },
                        child: Container(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // if (ticketControl.data['early-bird'] != "tutup") ...[
                              Text(
                                "Beli sekarang",
                                style: TextStyle(
                                    color: Color(0xff383838),
                                    fontSize:
                                        MediaQuery.of(context).size.width /
                                            150 *
                                            3,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Syne'),
                              ),
                              Text(
                                "Rp. 50.000",
                                style: TextStyle(
                                    color: Color(0xff383838),
                                    fontSize:
                                        MediaQuery.of(context).size.width /
                                            150 *
                                            3,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Syne'),
                              ),
                              Text(
                                "(for 1 people)",
                                style: TextStyle(
                                    color: Color(0xff383838),
                                    fontSize:
                                        MediaQuery.of(context).size.width /
                                            150 *
                                            3,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Syne'),
                              ),
                            ],
                          ),
                          // constraints: BoxConstraints(maxWidth: 300),
                          width: MediaQuery.of(context).size.width / 12 * 3,
                          height: MediaQuery.of(context).size.width / 24 * 3,
                          decoration: BoxDecoration(
                              // color: Colors.grey,
                              color: Color(0xffE8C41E),
                              image: (ticketControl.data['presale'] != "buka")
                                  ? DecorationImage(
                                      image: AssetImage("images/sold_out.png"))
                                  : null,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                      ),
                    ),
                    // color: Colors.lightBlue,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/book_mercusuara_bg.jpg'),
                            fit: BoxFit.fill)),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                  ),
                )),
          ]),
        ),
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

void beliTicket(BuildContext context) {
  Get.defaultDialog(
      title: "Book Ticket",
      contentPadding: EdgeInsets.fromLTRB(40, 0, 40, 0),
      content: Expanded(
        child: SingleChildScrollView(
            child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Row(
                children: [Text("Silahkan isi data berikut : ")],
              ),
              BuyTicketMercusuaraPage(title: "")
            ],
          ),
        )),
      ));
}
