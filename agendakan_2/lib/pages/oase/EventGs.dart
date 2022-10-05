import 'package:agendakan_2/pages/dashboard/widgets/top_nav.dart';
import 'package:agendakan_2/pages/oase/BuyTicket.dart';
import 'package:agendakan_2/pages/oase/mobileView.dart';
import 'package:agendakan_2/plugins/loadData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';

class EventGs extends StatelessWidget {
  const EventGs({Key? key}) : super(key: key);

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
                                                "Guest Star",
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Get.toNamed(
                                                  "/oasesignature/tickets");
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
                                                "Tickets",
                                                // style: TextStyle(
                                                //     color: Colors.blue,
                                                //     fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                          )
                                        ],
                                      )),
                                  SizedBox(
                                    height: 44,
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Get.defaultDialog();
                                            },
                                            child: Container(
                                              width: 208,
                                              height: 208,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          'images/pamungkas.jpg'),
                                                      fit: BoxFit.fill)),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 28,
                                          ),
                                          Text("PAMUNGKAS"),
                                          SizedBox(
                                            height: 45,
                                          ),
                                          Container(
                                            width: 122,
                                            height: 122,
                                            decoration: BoxDecoration(
                                                color: Color(0xffFF9C1A),
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        'images/comingsoon.png'),
                                                    fit: BoxFit.fill)),
                                          ),
                                          SizedBox(
                                            height: 28,
                                          ),
                                          Text("Coming Soon")
                                        ],
                                      ),
                                      SizedBox(
                                        width: 35,
                                      ),
                                      Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Get.defaultDialog();
                                            },
                                            child: Container(
                                              width: 208,
                                              height: 208,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          'images/isyana.jpg'),
                                                      fit: BoxFit.fill)),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 28,
                                          ),
                                          Text("ISYANA SARASVATI"),
                                          SizedBox(
                                            height: 45,
                                          ),
                                          Container(
                                            width: 122,
                                            height: 122,
                                            decoration: BoxDecoration(
                                                color: Color(0xffFF9C1A),
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        'images/comingsoon.png'),
                                                    fit: BoxFit.fill)),
                                          ),
                                          SizedBox(
                                            height: 28,
                                          ),
                                          Text("Coming Soon")
                                        ],
                                      ),
                                      SizedBox(
                                        width: 35,
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                            width: 208,
                                            height: 208,
                                            decoration: BoxDecoration(
                                                color: Color(0xffFF9C1A),
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        'images/comingsoon.png'),
                                                    fit: BoxFit.fill)),
                                          ),
                                          SizedBox(
                                            height: 28,
                                          ),
                                          Text("Coming Soon"),
                                          SizedBox(
                                            height: 45,
                                          ),
                                          Container(
                                            width: 122,
                                            height: 122,
                                            decoration: BoxDecoration(
                                                color: Color(0xffFF9C1A),
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        'images/comingsoon.png'),
                                                    fit: BoxFit.fill)),
                                          ),
                                          SizedBox(
                                            height: 28,
                                          ),
                                          Text("Coming Soon")
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
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
