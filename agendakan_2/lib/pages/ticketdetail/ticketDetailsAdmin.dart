import 'dart:typed_data';
import 'package:agendakan_2/plugins/ApiPlugin.dart';
//import 'package:agendakan_2/plugins/Api_Image.dart';
//import 'package:agendakan_2/plugins/DataTable.dart';
import 'package:agendakan_2/plugins/loadData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
//import 'package:image_picker/image_picker.dart';
//import 'package:provider/provider.dart';
import '../dashboard/widgets/top_nav.dart';
import 'dart:html' as html;

class MyTabController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'E - Receipt'),
    Tab(text: 'Tata Cara Pembayaran'),
  ];

  late TabController controller;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}

class TicketDetailsAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    String local_token = "";
    final MyTabController _tabx = Get.put(MyTabController());
    final LoadDataController dataControl = Get.put(LoadDataController());
    final LoadImageController imageControl = Get.put(LoadImageController());
    final data_store = GetStorage();
    if (data_store.read('token') != null) {
      local_token = data_store.read('token');
    }
//not done
    // if (local_token == "") {
    //   Get.toNamed("/");
    // }
    // else if (Get.arguments == null) {
    //   print("no data");
    //   Get.toNamed("/ticketlist");
    // }

    var dataTicket;
    String id = "";
    if (Get.arguments != null) {
      data_store.write("data_ticket", Get.arguments);
    }

    if (data_store.read("data_ticket") != null) {
      id = data_store.read("data_ticket");
    }
    dataControl.loadPembayaran(id);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45),
        child: topNavBar(),
      ),
      body: Row(
        children: [
          // dataControl.obx(
          //     (state) => Text(dataControl.data['success'].toString()),
          //     onLoading: CircularProgressIndicator()),
          Expanded(
              flex: 6,
              child: Container(
                color: Color(0xffF6F6F6),
                padding: EdgeInsets.fromLTRB(29, 20, 29, 41),
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      constraints: BoxConstraints(
                          minHeight: 350, maxWidth: 399, minWidth: 350),
                      child: Column(
                        children: [
                          Expanded(
                              child: Container(
                                  constraints: BoxConstraints(
                                      minHeight: 350, minWidth: 350),
                                  // width: 350,
                                  // height: 350,
                                  // decoration: BoxDecoration(
                                  //     image: DecorationImage(
                                  //         image: AssetImage('images/bg_oase2.jpg'),
                                  //         fit: BoxFit.cover)),
                                  color: Colors.orange,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Image(
                                              fit: BoxFit.contain,
                                              image: AssetImage(
                                                  'images/poster3.jpg'),
                                              height: 210,
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Container(
                                              child: Text(
                                                "We The Fest",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              ),
                                            )
                                          ]),
                                    ],
                                  )
                                  //color: Colors.orange,
                                  )),
                          Expanded(
                              child: Container(
                            child: Column(children: [
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(width: 1.5))),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              child: Text(
                                                  "Jiexpo Kemayoran, Jakarta"),
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
                                              Icons.calendar_month,
                                              size: 15,
                                            ),
                                            Container(
                                              child:
                                                  Text("14 - 16 Agustus 2020"),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    //color: Colors.green,
                                  )),
                              Expanded(
                                  flex: 4,
                                  child: dataControl.obx(
                                    (state) {
                                      if (dataControl.data['data']
                                              ['status_pembelian'] ==
                                          "paid") {
                                        return Container(
                                          child: Column(children: [
                                            Container(
                                                padding: EdgeInsets.fromLTRB(
                                                    0, 48, 0, 5),
                                                child: Text("Ticket Approval")),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                ElevatedButton(
                                                    onPressed: () async {
                                                      final _provider =
                                                          ApiPlugin();
                                                      var data =
                                                          await _provider.post5(
                                                              data_store.read(
                                                                  "token"),
                                                              int.parse(id));
                                                      Get.offAndToNamed(
                                                          "/ticketlistAdmin");
                                                    },
                                                    child: Icon(Icons.check)),
                                                SizedBox(
                                                  width: 50,
                                                ),
                                                ElevatedButton(
                                                    onPressed: () async {
                                                      final _provider =
                                                          ApiPlugin();
                                                      var data =
                                                          await _provider.post6(
                                                              data_store.read(
                                                                  "token"),
                                                              int.parse(id));
                                                      Get.offAndToNamed(
                                                          "/ticketlistAdmin");
                                                    },
                                                    child: Icon(Icons.close)),
                                              ],
                                            ),
                                          ]),
                                          // color: Colors.amber,
                                        );
                                      } else if (dataControl.data['data']
                                              ['status_pembelian'] ==
                                          "approved") {
                                        return Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [Text("Data Approved!")],
                                        );
                                      } else {
                                        return Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text("Havent Paid / Expired!"),
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.red),
                                                onPressed: () async {
                                                  final _provider = ApiPlugin();
                                                  var data =
                                                      await _provider.post6(
                                                          data_store
                                                              .read("token"),
                                                          int.parse(id));
                                                  Get.offAndToNamed(
                                                      "/ticketlistAdmin");
                                                },
                                                child: Icon(Icons.close)),
                                          ],
                                        );
                                      }
                                    },
                                  ))
                            ]),
                            color: Colors.white,
                          ))
                        ],
                      ),
                    )),
                    Expanded(
                        flex: 3,
                        child: Container(
                          alignment: Alignment.topCenter,
                          height: double.infinity,
                          constraints: BoxConstraints(maxWidth: 400),
                          margin: EdgeInsets.fromLTRB(61, 51, 68, 0),
                          padding: EdgeInsets.fromLTRB(110, 33, 0, 0),
                          color: Colors.white,
                          child: dataControl.obx((state) =>
                              (SingleChildScrollView(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Order Details",
                                            style: TextStyle(
                                                color: Color(0xff4181ED),
                                                fontSize: 20),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 45,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Text("Kode Pembelian")),
                                          Text(": "),
                                          Expanded(
                                              flex: 2,
                                              child: Text("" +
                                                  dataControl.data['data']
                                                      ['kode_pembelian']))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(child: Text("Jenis Tiket")),
                                          Text(": "),
                                          Expanded(
                                              flex: 2,
                                              child: Text("" +
                                                  dataControl.data['data']
                                                          ['tiket'][0]
                                                          ['jenis_tiket']
                                                      .toString()
                                                      .toUpperCase()))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(child: Text("Email")),
                                          Text(": "),
                                          Expanded(
                                              flex: 2,
                                              child: Text("" +
                                                  dataControl.data['data']
                                                      ['email_pemesan']))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text("Order Details"),
                                          ),
                                          Text(": "),
                                          Expanded(
                                              flex: 2,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Text("Tiket 1"),
                                                  ),
                                                  Expanded(
                                                    child: Row(children: [
                                                      Text("Rp."),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(dataControl
                                                          .data["data"]["tiket"]
                                                              [0]["harga_tiket"]
                                                          .toString())
                                                    ]),
                                                  ),
                                                ],
                                              ))
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(""),
                                          ),
                                          Text("  "),
                                          Expanded(
                                              flex: 2,
                                              child: Row(
                                                children: [
                                                  if (dataControl.data['data']
                                                              ['tiket'][0]
                                                          ['addons'] ==
                                                      "1") ...[
                                                    Expanded(
                                                      child: Text("Add Ons"),
                                                    ),
                                                    Expanded(
                                                      child: Row(
                                                        children: [
                                                          Text("Rp."),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(dataControl
                                                              .data["data"]
                                                                  ["tiket"][0][
                                                                  "harga_addons"]
                                                              .toString()),
                                                        ],
                                                      ),
                                                    ),
                                                  ]
                                                ],
                                              ))
                                        ],
                                      ),
                                      if (dataControl.data["data"]
                                              ["id_kupon"] !=
                                          null) ...[
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text("Coupon"),
                                            ),
                                            Text(": "),
                                            Expanded(
                                                flex: 2,
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                        child: Text("(" +
                                                            dataControl
                                                                .data["data"][
                                                                    "nama_kupon"]
                                                                .toString() +
                                                            ")")),
                                                  ],
                                                ))
                                          ],
                                        ),
                                        if (dataControl.data["data"]
                                                ["potongan"] !=
                                            null) ...[
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(""),
                                              ),
                                              Text("  "),
                                              Expanded(
                                                  flex: 2,
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        child: Row(children: [
                                                          // Spacer(),
                                                          Text(dataControl
                                                              .data["data"][
                                                                  "potongan_persen"]
                                                              .toString()),
                                                          Text(" %"),
                                                          SizedBox(
                                                            width: 3,
                                                          ),
                                                        ]),
                                                      ),
                                                      Expanded(
                                                        child: Row(children: [
                                                          // Spacer(),
                                                          Text("-  Rp.",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .green)),
                                                          SizedBox(
                                                            width: 3,
                                                          ),
                                                          Text(
                                                              dataControl
                                                                  .data["data"][
                                                                      "potongan"]
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .green))
                                                        ]),
                                                      ),
                                                    ],
                                                  ))
                                            ],
                                          ),
                                        ],
                                      ],
                                      SizedBox(
                                        height: 30,
                                      ),
                                      if (dataControl.data['data']
                                              ['jumlah_tiket'] !=
                                          1) ...[
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(""),
                                            ),
                                            Text("  "),
                                            Expanded(
                                                flex: 2,
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Text("Tiket 2"),
                                                    ),
                                                    Expanded(
                                                        child: Row(
                                                      children: [
                                                        Text("Rp."),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        if (dataControl.data[
                                                                    "data"][
                                                                "jumlah_tiket"] >=
                                                            2) ...[
                                                          Text(dataControl
                                                              .data["data"]
                                                                  ["tiket"][1][
                                                                  "harga_tiket"]
                                                              .toString())
                                                        ],
                                                      ],
                                                    )),
                                                  ],
                                                ))
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(""),
                                            ),
                                            Text("  "),
                                            Expanded(
                                                flex: 2,
                                                child: Row(
                                                  children: [
                                                    if (dataControl.data['data']
                                                                ['tiket'][1]
                                                            ['addons'] ==
                                                        "1") ...[
                                                      Expanded(
                                                        child: Text("Add Ons"),
                                                      ),
                                                      Expanded(
                                                        child: Row(
                                                          children: [
                                                            Text("Rp."),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(dataControl
                                                                .data["data"]
                                                                    ["tiket"][1]
                                                                    [
                                                                    "harga_addons"]
                                                                .toString()),
                                                          ],
                                                        ),
                                                      ),
                                                    ]
                                                  ],
                                                ))
                                          ],
                                        ),
                                      ],
                                      SizedBox(
                                        height: 30,
                                      ),
                                      if (dataControl.data['data']
                                              ['jumlah_tiket'] ==
                                          3) ...[
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(""),
                                            ),
                                            Text("  "),
                                            Expanded(
                                                flex: 2,
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Text("Tiket 3"),
                                                    ),
                                                    Expanded(
                                                        child: Row(
                                                      children: [
                                                        Text("Rp."),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        if (dataControl.data[
                                                                    "data"][
                                                                "jumlah_tiket"] ==
                                                            3) ...[
                                                          Text(dataControl
                                                              .data["data"]
                                                                  ["tiket"][2][
                                                                  "harga_tiket"]
                                                              .toString())
                                                        ],
                                                      ],
                                                    )),
                                                  ],
                                                ))
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(""),
                                            ),
                                            Text("  "),
                                            Expanded(
                                                flex: 2,
                                                child: Container(
                                                  // decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: Colors.black))),
                                                  child: Row(
                                                    children: [
                                                      if (dataControl.data[
                                                                      'data']
                                                                  ['tiket'][2]
                                                              ['addons'] ==
                                                          "1") ...[
                                                        Expanded(
                                                          child:
                                                              Text("Add Ons"),
                                                        ),
                                                        Expanded(
                                                          child: Row(
                                                            children: [
                                                              Text("Rp."),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              Text(dataControl
                                                                  .data["data"]
                                                                      ["tiket"]
                                                                      [2][
                                                                      "harga_addons"]
                                                                  .toString()),
                                                            ],
                                                          ),
                                                        ),
                                                      ]
                                                    ],
                                                  ),
                                                ))
                                          ],
                                        ),
                                      ],
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text("Pajak"),
                                          ),
                                          Text(": "),
                                          Expanded(
                                              flex: 2,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Text("10 %"),
                                                  ),
                                                  Expanded(
                                                    child: Row(children: [
                                                      // Spacer(),
                                                      Text("Rp."),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(dataControl
                                                          .data["data"]
                                                              ["total_pajak"]
                                                          .toString())
                                                    ]),
                                                  ),
                                                ],
                                              ))
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(""),
                                          ),
                                          Text("  "),
                                          Expanded(
                                              flex: 2,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    border: Border(
                                                        bottom: BorderSide(
                                                            width: 1,
                                                            color:
                                                                Colors.black))),
                                                child: Row(
                                                  children: [],
                                                ),
                                              )),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text("Total"),
                                          ),
                                          Text(": "),
                                          Expanded(
                                              flex: 2,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(""),
                                                  ),
                                                  Expanded(
                                                      child: Row(
                                                    children: [
                                                      Text("Rp."),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(dataControl
                                                          .data['data']
                                                              ['total_harga']
                                                          .toString())
                                                    ],
                                                  )),
                                                ],
                                              ))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 35,
                                      ),
                                      Row(
                                        children: [
                                          Text("Bukti Transaksi "),
                                          Text(" :  "),
                                          Expanded(
                                              flex: 2,
                                              child: Row(
                                                children: [
                                                  dataControl.obx(
                                                    (state) => Row(
                                                      children: [
                                                        if (dataControl.data[
                                                                    'data'][
                                                                'bukti_pembayaran'] !=
                                                            null) ...[
                                                          InkWell(
                                                            onTap: () {
                                                              Get.defaultDialog(
                                                                title:
                                                                    "Bukti Pembayaran",
                                                                content:
                                                                    Container(
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height -
                                                                      200,
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      2,
                                                                  decoration: BoxDecoration(
                                                                      image: DecorationImage(
                                                                          image:
                                                                              NetworkImage("https://backend.agendakan.com/api/get-bukti/" + dataControl.data['data']['bukti_pembayaran']),
                                                                          fit: BoxFit.fitHeight)),
                                                                ),
                                                              );
                                                            },
                                                            child: Container(
                                                              height: 150,
                                                              width: 150,
                                                              decoration: BoxDecoration(
                                                                  image: DecorationImage(
                                                                      image: NetworkImage("https://backend.agendakan.com/api/get-bukti/" +
                                                                          dataControl.data['data']
                                                                              [
                                                                              'bukti_pembayaran']),
                                                                      fit: BoxFit
                                                                          .fill)),
                                                            ),
                                                          ),
                                                        ] else ...[
                                                          Text(
                                                              "No image Uploaded Yet")
                                                        ]
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              )),
                                        ],
                                      ),
                                    ]),
                              ))),
                        ))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
