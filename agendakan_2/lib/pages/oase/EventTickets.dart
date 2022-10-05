import 'package:agendakan_2/pages/dashboard/widgets/top_nav.dart';
import 'package:agendakan_2/pages/oase/BuyTicket.dart';
import 'package:agendakan_2/pages/oase/mobileView.dart';
import 'package:agendakan_2/plugins/loadData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';

class EventTickets extends StatelessWidget {
  const EventTickets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45),
        child: topNavBar(),
      ),
      body: Column(children: [
        if (screenSize >= 1300) ...[
          Expanded(
              flex: 30,
              child: Container(
                constraints: BoxConstraints(maxWidth: 1360),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/bg_oase.jpg'),
                        fit: BoxFit.cover)),
                child: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(82, 55, 82, 49),
                  child: Column(children: [
                    Container(
                      width: double.infinity,
                      height: 789,
                      //color: Colors.green,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('images/bg_oase2.jpg'),
                                      fit: BoxFit.cover)),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image(
                                      fit: BoxFit.fill,
                                      image: AssetImage('images/poster3.jpg'),
                                      height: 540,
                                      width: 320,
                                    ),
                                  ]),
                              //color: Colors.orange,
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child: Container(
                              child: Container(
                                margin: EdgeInsets.fromLTRB(60, 33, 32, 33),
                                //color: Colors.red,
                                child: Column(children: [
                                  Row(children: [
                                    Container(
                                      //decoration: BoxDecoration(color: Colors.blue),
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              primary: Colors.blue),
                                          onPressed: () {},
                                          child: Text("Featured")),
                                    ),
                                  ]),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(children: [
                                    Container(
                                      child: Text(
                                        "Oase Festival",
                                        style: TextStyle(fontSize: 24),
                                      ),
                                    )
                                  ]),
                                  Row(children: [
                                    Container(
                                      child: Text(
                                        "Drive-in Concert",
                                        style: TextStyle(fontSize: 24),
                                      ),
                                    )
                                  ]),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Get.toNamed(
                                                  "/oasesignature/detailevents");
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              width: 110,
                                              // decoration: BoxDecoration(
                                              //     border: Border(
                                              //         bottom: BorderSide(
                                              //             color: Colors.blue,
                                              //             width: 3))),
                                              child: Text(
                                                "Event Detail",
                                                // style: TextStyle(
                                                //     color: Colors.blue,
                                                //     fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Get.toNamed("/oasesignature/gs");
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              width: 110,
                                              // decoration: BoxDecoration(
                                              //     border: Border(
                                              //         bottom: BorderSide(
                                              //             color: Colors.blue,
                                              //             width: 3))),
                                              child: Text(
                                                "Guest Star",
                                                // style: TextStyle(
                                                //     color: Colors.blue,
                                                //     fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {},
                                            child: Container(
                                              alignment: Alignment.center,
                                              width: 110,
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                      bottom: BorderSide(
                                                          color: Colors.blue,
                                                          width: 3))),
                                              child: Text(
                                                "Tickets",
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          )
                                        ],
                                      )),

                                  SizedBox(
                                    height: 44,
                                  ),
                                  Row(
                                    children: [Text("Ticket Pre Condition : ")],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 31,
                                      ),
                                      Text(
                                          "• Setiap akun dapat membeli tiket hingga maksimal 3 tiket per transaksi")
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 31,
                                      ),
                                      Text(
                                          "• Satu tiket berlaku untuk 2 orang dan dapat add-ons maksimal menjadi 3 orang per tiket")
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 31,
                                      ),
                                      Text(
                                          "• Tidak bisa menggunakan nomor identitas yang sama di tiket yang berbeda")
                                    ],
                                  ),

                                  SizedBox(
                                    height: 89,
                                  ),
                                  Row(
                                    children: [Text("Ticket Availability : ")],
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
                                        Column(
                                          children: [
                                            ElevatedButton(
                                              child: Column(children: [
                                                Text(
                                                  "Pre-Sale 1",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "Rp. 200.000",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                              ]),
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                  primary: Color(0xffE5E5E5),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 35,
                                                      vertical: 20),
                                                  minimumSize: Size(200, 75)),
                                            ),
                                            SizedBox(
                                              height: 32,
                                            ),
                                            ElevatedButton(
                                              child: Column(children: [
                                                Text(
                                                  "Pre-Sale 1",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "Rp. 250.000",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                              ]),
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                  primary: Color(0xffE5E5E5),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 35,
                                                      vertical: 20),
                                                  minimumSize: Size(200, 75)),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 53,
                                        ),
                                        Column(
                                          children: [
                                            ElevatedButton(
                                              child: Column(children: [
                                                Text(
                                                  "Pre-Sale 2",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "Rp. 250.000",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                              ]),
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                  primary: Color(0xff38ED34),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 35,
                                                      vertical: 20),
                                                  minimumSize: Size(200, 75)),
                                            ),
                                            SizedBox(
                                              height: 32,
                                            ),
                                            ElevatedButton(
                                              child: Column(children: [
                                                Text(
                                                  "Coming soon",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black),
                                                ),
                                                // SizedBox(
                                                //   height: 5,
                                                // ),
                                                // Text(
                                                //   "Rp. 200.000",
                                                //   style: TextStyle(
                                                //       fontSize: 20,
                                                //       color: Colors.black),
                                                // ),
                                                // SizedBox(
                                                //   height: 5,
                                                // ),
                                              ]),
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                  primary: Color(0xffE5E5E5),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 35,
                                                      vertical: 20),
                                                  minimumSize: Size(200, 75)),
                                            ),
                                          ],
                                        ),
                                      ]),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          Get.defaultDialog(
                                              title: "Book Ticket",
                                              content: Container(
                                                height: 550,
                                                width: 700,
                                                alignment: Alignment.topCenter,
                                                padding: EdgeInsets.all(20),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          width: 150,
                                                          height: 200,
                                                          constraints:
                                                              BoxConstraints(
                                                                  maxWidth: 200,
                                                                  maxHeight:
                                                                      250),
                                                          decoration: BoxDecoration(
                                                              image: DecorationImage(
                                                                  image: AssetImage(
                                                                      'images/poster2.jpg'),
                                                                  fit: BoxFit
                                                                      .fill)),
                                                        ),
                                                        SizedBox(
                                                          width: 40,
                                                        ),
                                                        Container(
                                                          height: 220,
                                                          child:
                                                              Column(children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "We The Fest",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          32),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 40,
                                                            ),
                                                            Row(
                                                              children: [
                                                                Column(
                                                                  children: [
                                                                    Icon(Icons
                                                                        .location_on),
                                                                    Text("")
                                                                  ],
                                                                ),
                                                                Column(
                                                                  children: [
                                                                    Text(
                                                                        "Jiexpo Kemayoran"),
                                                                    Text(
                                                                        "Jakarta, Indonesia"),
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [],
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Row(
                                                              children: [
                                                                Icon(Icons
                                                                    .calendar_today),
                                                                Text(
                                                                    "14 - 16 Agustus 2020"),
                                                              ],
                                                            ),
                                                          ]),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        const Text(
                                                          'Silahkan isi formulir : ',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 12,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Container(
                                                      height: 250,
                                                      width: 700,
                                                      child: BuyTicketPage(
                                                          title: ""),
                                                    ),
                                                  ],
                                                ),
                                              ));
                                          //Get.toNamed("/ticketform");
                                        },
                                        child: Text("BUY NOW"),
                                        style: ElevatedButton.styleFrom(
                                            primary: Color(0xffFF9C1A),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 35, vertical: 20),
                                            minimumSize: Size(86, 36)),
                                      ),
                                    ],
                                  )
                                  // Row(children: [
                                  //   Spacer(),
                                  //   Container(
                                  //     child: Row(
                                  //       children: [
                                  //         Icon(Icons.arrow_back),
                                  //         Icon(Icons.arrow_forward)
                                  //       ],
                                  //     ),
                                  //   )
                                  // ]),
                                ]),
                              ),
                              color: Color(0xffFFF9E0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 49,
                    ),
                  ]),
                ),
              )),
          Expanded(
              flex: 3,
              child: Container(
                color: Colors.blue,
              )),
          Expanded(
              flex: 1,
              child: Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("© 2021 - 2022 agendakan.com | All right reserved")
                    ]),
                color: Colors.blue,
              ))
        ] else ...[
          mobileView(screenSize),
          Container(
            height: MediaQuery.of(context).size.height / 20,
            width: screenSize,
            color: Color(0xffFFF9E0),
            child: ElevatedButton(
                onPressed: () {
                  Get.defaultDialog(
                      title: "Book Ticket",
                      content: Expanded(
                        child: SingleChildScrollView(
                            child: Column(
                          children: [
                            Row(
                              children: [Text("Ticket Pre Condition : ")],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Text(
                                      "• Setiap akun dapat membeli tiket hingga maksimal 3 tiket per transaksi"),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Text(
                                      "• Satu tiket berlaku untuk 2 orang dan dapat add-ons maksimal menjadi 3 orang per tiket"),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Text(
                                      "• Tidak bisa menggunakan nomor identitas yang sama di tiket yang berbeda"),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [Text("Silahkan isi data berikut : ")],
                            ),
                            BuyTicketPage(title: "")
                          ],
                        )),
                      ));
                },
                child: Text("BOOK NOW")),
          )
        ],
      ]),
    );
  }
}
