import 'package:agendakan_2/pages/gkm_2023/Repository/gkm_2023_api.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';

class GKMHome2023 extends StatefulWidget {
  const GKMHome2023({super.key});

  @override
  State<GKMHome2023> createState() => _GKMHome2023State();
}

class _GKMHome2023State extends State<GKMHome2023> {
  final List<String> priceHardcode = ['*Rp. 139.000', 'Coming Soon', 'Coming Soon', 'Coming Soon'];
  final data_store = GetStorage();
  GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          // color: Colors.red,
          child: FloatingActionButton(
            // child: Container(width: MediaQuery.of(context).size.width / 3),
            shape: const BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                side: BorderSide(width: 0.75, color: Colors.blue)),
            backgroundColor: Colors.black,
            child: Container(
              width: MediaQuery.of(context).size.width / 4,
              child: Image(image: AssetImage(('images/2023_button_book_now.png'))),
              // decoration: BoxDecoration(
              //     image: DecorationImage(
              //         image: AssetImage('images/2023_button_book_now.png'), fit: BoxFit.fill))
            ),
            onPressed: () async {
              final _provider = GKM_2023_API();
              dynamic data = await _provider.getAllStatusTicket();
              print(data);
              Get.defaultDialog(
                  title: '',
                  titleStyle: TextStyle(fontSize: 1),
                  backgroundColor: Color(0xff808080),
                  content: Container(
                      padding: EdgeInsets.all(5),
                      height: MediaQuery.of(context).size.height / 1.5,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 30, right: 30, top: 20),
                            child: Image(image: AssetImage('images/2023_button_book_now.png')),
                          ),
                          Spacer(),
                          Container(
                            height: MediaQuery.of(context).size.height / 2.25,
                            width: MediaQuery.of(context).size.width,
                            child: GridView.builder(
                                padding: EdgeInsets.all(20),
                                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 400,
                                    childAspectRatio: 4 / 2,
                                    crossAxisSpacing: 40,
                                    mainAxisSpacing: 40),
                                itemCount: 4,
                                itemBuilder: ((context, index) {
                                  return GestureDetector(
                                    onTap: () async {
                                      final _provider = GKM_2023_API();
                                      dynamic data = await _provider.getAllStatusTicket();
                                      if (data['presale${index + 1}'] != 'buka') {
                                        Get.defaultDialog(
                                            title: 'Peringatan!',
                                            content: const Text(
                                                'Ticket sudah habis, atau penjualan sudah ditutup'));
                                      } else {
                                        // final data_store = GetStorage();
                                        // if (data_store.read('token') == null) {
                                        //   Get.toNamed('/loginpage');
                                        // }else{
                                        data_store.write("jenis_tiket", 'presale${index + 1}');
                                        Get.toNamed("/gkm_2023/ticket_form");
                                        // }
                                      }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Color(0xffFFF9E0),
                                          image: (data['presale${index + 1}'] == 'tutup')
                                              ? const DecorationImage(
                                                  image: AssetImage('images/sold_out.png'))
                                              : null,
                                          border: Border.all(color: Colors.blue, width: 2.5),
                                          borderRadius: BorderRadius.all(Radius.circular(20))),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          FittedBox(
                                              fit: BoxFit.cover,
                                              child: Text(
                                                "PRESALE ${index + 1}",
                                                style: const TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 25,
                                                    color: Color(0xff4181ED)),
                                              )),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          FittedBox(
                                              fit: BoxFit.cover,
                                              child: Text(priceHardcode[index],
                                                  style: const TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      fontWeight: FontWeight.w700,
                                                      fontSize: 20,
                                                      color: Color(0xffFF9C1A))))
                                        ],
                                      ),
                                      // height: 160,
                                      // width: MediaQuery.of(context).size.width / 3,
                                      // color: Colors.primaries[index],
                                    ),
                                  );
                                })),
                          ),
                          Spacer(),
                        ],
                      )
                      // child: ListView.builder(
                      //     itemCount: 5,
                      //     itemBuilder: ((context, index) {
                      //       return Container(
                      //         height: 160,
                      //         width: 160,
                      //         color: Colors.primaries[index],
                      //       );
                      //     })),
                      ));
            },
          ),
        ),
      ),
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
                    style: TextStyle(fontSize: 20, fontFamily: 'Syne', fontWeight: FontWeight.w800),
                  )),
                  onTap: () {
                    if (data_store.read("isAdmin") == 1) {
                      Get.offAndToNamed('/gkm_2023/ticket_list');
                    } else {
                      Get.offAndToNamed('/gkm_2023/ticket_list');
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
                    style: TextStyle(fontSize: 20, fontFamily: 'Syne', fontWeight: FontWeight.w800),
                  )),
                  onTap: () {
                    data_store.remove('token');
                    data_store.remove('isAdmin');
                    data_store.remove('acara');
                    Get.offAllNamed("/gkm_2023");
                  },
                ),
              ),
            ] else ...[
              Container(
                decoration: BoxDecoration(border: Border(top: BorderSide(), bottom: BorderSide())),
                child: ListTile(
                  title: Center(
                      child: Text(
                    "LOG IN",
                    style: TextStyle(fontSize: 20, fontFamily: 'Syne', fontWeight: FontWeight.w800),
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
          //NavBar
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
                              borderRadius: BorderRadius.all(Radius.circular(10))),
                        ),
                      ),
                      onTap: () {
                        if (data_store.read("isAdmin") == 1) {
                          Get.offAndToNamed('/gkm_2023/ticket_list');
                        } else {
                          Get.toNamed('/gkm_2023/ticket_list');
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
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                      ),
                      onTap: () {
                        data_store.remove('token');
                        data_store.remove('isAdmin');
                        data_store.remove('acara');
                        Get.offAllNamed("/gkm_2023");
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ] else ...[
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
                            borderRadius: BorderRadius.all(Radius.circular(10))),
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
                            borderRadius: BorderRadius.all(Radius.circular(10))),
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
            height: MediaQuery.of(context).size.width / 2,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/gkm_2023_slider_bg.png'), fit: BoxFit.fill)),
            child: CarouselSlider(
                items: [
                  'images/gkm_2023_slider_assets(1).jpg',
                  'images/gkm_2023_slider_assets(2).jpg',
                  'images/gkm_2023_slider_assets(3).jpg',
                  'images/gkm_2023_slider_assets(4).jpg',
                  'images/gkm_2023_slider_assets(5).jpg',
                  'images/gkm_2023_slider_assets(6).jpg',
                  'images/gkm_2023_slider_assets(7).jpg',
                  'images/gkm_2023_slider_assets(8).jpg',
                ].map((e) {
                  return Builder(builder: (context) {
                    return Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 5.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          image: DecorationImage(image: AssetImage(e), fit: BoxFit.cover)),
                      // child: Image(
                      //   image: AssetImage(e.toString()),
                      //   fit: BoxFit.fill,
                      // ),
                      // color: Colors.blue,
                      // width: MediaQuery.of(context).size.width,
                    );
                  });
                }).toList(),
                options: CarouselOptions(
                  aspectRatio: 4,
                  //enlargeCenterPage: true,
                  viewportFraction: 0.3,
                  scrollDirection: Axis.horizontal,
                  autoPlay: true,
                )),
            // color: Color(0xff4181ED),
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
                                        width: MediaQuery.of(context).size.width / 4,
                                        height: MediaQuery.of(context).size.width / 5,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            image: DecorationImage(
                                                image: AssetImage('images/fipfest_gs_comingsoon.png'),
                                                fit: BoxFit.fill),
                                            borderRadius: BorderRadius.all(Radius.circular(20))),
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
                                        width: MediaQuery.of(context).size.width / 4,
                                        height: MediaQuery.of(context).size.width / 5,
                                        decoration: BoxDecoration(
                                            // color: Colors.white,
                                            image: DecorationImage(
                                                image: AssetImage('images/fipfest_gs_comingsoon.png'),
                                                fit: BoxFit.fill),
                                            borderRadius: BorderRadius.all(Radius.circular(20))),
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
                                        width: MediaQuery.of(context).size.width / 4,
                                        height: MediaQuery.of(context).size.width / 5,
                                        decoration: BoxDecoration(
                                            // color: Color(0xffF1F1F1),
                                            image: DecorationImage(
                                                image: AssetImage('images/fipfest_gs_comingsoon.png'),
                                                fit: BoxFit.scaleDown),
                                            borderRadius: BorderRadius.all(Radius.circular(20))),
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
                // color: Color(0xffFFBD66),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/gkm_2023_gueststar_bg.png"), fit: BoxFit.fill)),
                // height: MediaQuery.of(context).size.height,
              ),
            ),
          ],
          //Deskripsi
          AspectRatio(
            aspectRatio: 16 / 8,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/gkm_2023_desc_bg.png"), fit: BoxFit.fill)),
            ),
          ),
          

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
                          image: AssetImage("images/gkm_logo_main_footer.png"),
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
                                  "https://instagram.com/gkmfebum?igshid=YmMyMTA2M2Y="))) {
                                await launchUrl(Uri.parse(
                                    "https://instagram.com/gkmfebum?igshid=YmMyMTA2M2Y="));
                              } else {
                                throw 'Could not launch tiktok.com/@signaturee.festival';
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
                Center(child: Image(image: AssetImage("images/footer_bottom_reserved.png"))),
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
