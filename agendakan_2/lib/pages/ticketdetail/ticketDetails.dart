import 'dart:html';
import 'dart:typed_data';
import 'package:agendakan_2/plugins/ApiPlugin.dart';
import 'package:agendakan_2/plugins/Api_Image.dart';
import 'package:agendakan_2/plugins/DataTable.dart';
import 'package:agendakan_2/plugins/loadData.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../dashboard/widgets/top_nav.dart';
import 'dart:html' as html;
import 'package:intl/intl.dart';

class ticketDetailsPage extends StatefulWidget {
  const ticketDetailsPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ticketDetailsPage> createState() => _ticketDetailsPageState();
}

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

class _ticketDetailsPageState extends State<ticketDetailsPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    String _image = "";
    String local_token = "";
    final MyTabController _tabx = Get.put(MyTabController());
    final LoadDataController dataControl = Get.put(LoadDataController());
    final LoadImageController imageControl = Get.put(LoadImageController());
    final screenSize = MediaQuery.of(context).size.width;
    final data_store = GetStorage();
    //print(_image);
    if (data_store.read('token') != null) {
      local_token = data_store.read('token');
    }
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
    //print(id);
    dataControl.loadPembayaran(id);
    //dataControl.id = id;
    //dataTicket = dataControl.data;

    //print(dataTicket);
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
          if (screenSize >= 1350) ...[
            Container(
              //width: 258,
              child: Column(children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      constraints: BoxConstraints(minWidth: 265),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white),
                                  child: Container(
                                    padding: EdgeInsets.all(5),
                                    child: Icon(
                                      Icons.person_rounded,
                                      color: Colors.blue,
                                      size: 40,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Welcome back,",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "" + data_store.read("nama_user"),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ],
                            ),
                          ]),
                      color: Colors.blue,
                    )),
                Expanded(
                    flex: 5,
                    child: Container(
                      color: Colors.white,
                    ))
              ]),
            ),
          ],
          if (screenSize < 800) ...[
            Expanded(
              child: dataControl.obx(
                  (state) => SingleChildScrollView(
                        child: Container(
                          //color: Colors.white,
                          //padding: EdgeInsets.all(25),
                          child: Column(children: [
                            // SizedBox(
                            //   height: 40,
                            // ),
                            Container(
                                color: Colors.white,
                                padding: EdgeInsets.all(25),
                                child: Column(
                                  children: [
                                    // SizedBox(
                                    //   height: 20,
                                    // ),
                                    Text("Tata Cara Pembayaran"),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Text("1."),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Expanded(
                                          child: Text(
                                              "Pembayaran dilakukan dengan cara Transfer ke Rekening di bawah ini : "),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 40,
                                        ),
                                        // Text("1."),
                                        // SizedBox(
                                        //   width: 15,
                                        // ),
                                        SelectableText(
                                            "Mandiri : 1370020675126\nA.n Alif Aulia Muhammad"),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 40,
                                        ),
                                        // Text("2."),
                                        // SizedBox(
                                        //   width: 15,
                                        // ),
                                        SelectableText(
                                            "BCA : 8610713841\nA.n Alif Aulia Muhammad"),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 40,
                                        ),
                                        // Text("3."),
                                        // SizedBox(
                                        //   width: 15,
                                        // ),
                                        SelectableText(
                                            "BRI : 057901048851507\nA.n M. Daffa Lazuardi P"),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text("2."),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Expanded(
                                          child: Text(
                                              "Harap mencantumkan kode pembayaran dalam deskripsi transfer atau dengan menulis kode pembayaran pada slip transfer"),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text("3."),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Expanded(
                                          child: Text(
                                              "Melakukan upload bukti transfer ke halaman Ticket dan menunggu Verifikasi Admin"),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text("4."),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Expanded(
                                          child: Text(
                                              "E-Ticket diterbitkan maksimal 1 X 24 Jam setelah bukti pembayaran ter-verifikasi."),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text("5."),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Expanded(
                                          child: Text(
                                              "Jika mengalami kendala, silahkan menghubungi Contact Person kami di: +6285746970735 (WA message only)"),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                )),
                            SizedBox(
                              height: 40,
                            ),

                            Container(
                              color: Colors.white,
                              padding: EdgeInsets.all(25),
                              child: Column(children: [
                                Text("E-Receipt"),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Expanded(child: Text("Kode Pembayaran")),
                                    Text(": "),
                                    Expanded(
                                        flex: 2,
                                        child: Row(
                                          children: [
                                            SelectableText("" +
                                                dataControl.data['data']
                                                    ['kode_pembelian']),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            ElevatedButton(
                                                onPressed: () {
                                                  Clipboard.setData(ClipboardData(
                                                          text: dataControl
                                                                  .data['data'][
                                                              'kode_pembelian']))
                                                      .then((value) => Get.snackbar(
                                                          "Notification",
                                                          "Kode Pembelian telah di copy!"));
                                                },
                                                child: Text("Copy"))
                                          ],
                                        ))
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
                                              child: Text("Rp. " +
                                                  dataControl.data["data"]
                                                          ["tiket"][0]
                                                          ["harga_tiket"]
                                                      .toString()),
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
                                                    ['tiket'][0]['addons'] ==
                                                "1") ...[
                                              Expanded(
                                                child: Text("Add Ons"),
                                              ),
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    Text("Rp. " +
                                                        dataControl.data["data"]
                                                                ["tiket"][0]
                                                                ["harga_addons"]
                                                            .toString()),
                                                    // if (dataTicket['data']['ticket'][0]['addons'] >=
                                                    //     1) ...[
                                                    //   Text(dataTicket["data"]["tiket"][0]["harga_tiket"].toString())
                                                    // ]
                                                  ],
                                                ),
                                              ),
                                            ]
                                          ],
                                        ))
                                  ],
                                ),
                                if (dataControl.data["data"]["id_kupon"] !=
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
                                                      dataControl.data["data"]
                                                              ["nama_kupon"]
                                                          .toString() +
                                                      ")")),
                                            ],
                                          ))
                                    ],
                                  ),
                                  if (dataControl.data["data"]["potongan"] !=
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
                                                        .data["data"]
                                                            ["potongan_persen"]
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
                                                            color:
                                                                Colors.green)),
                                                    SizedBox(
                                                      width: 3,
                                                    ),
                                                    Text(
                                                        dataControl.data["data"]
                                                                ["potongan"]
                                                            .toString(),
                                                        style: TextStyle(
                                                            color:
                                                                Colors.green))
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
                                if (dataControl.data['data']['jumlah_tiket'] !=
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
                                                  Text("Rp. "),
                                                  if (dataControl.data["data"]
                                                          ["jumlah_tiket"] >=
                                                      2) ...[
                                                    Text(dataControl
                                                        .data["data"]["tiket"]
                                                            [1]["harga_tiket"]
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
                                                      ['tiket'][1]['addons'] ==
                                                  "1") ...[
                                                Expanded(
                                                  child: Text("Add Ons"),
                                                ),
                                                Expanded(
                                                  child: Row(
                                                    children: [
                                                      Text("Rp. " +
                                                          dataControl
                                                              .data["data"]
                                                                  ["tiket"][1][
                                                                  "harga_addons"]
                                                              .toString()),
                                                      // if (dataTicket['data']['ticket'][0]['addons'] >=
                                                      //     1) ...[
                                                      //   Text(dataTicket["data"]["tiket"][0]["harga_tiket"].toString())
                                                      // ]
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
                                if (dataControl.data['data']['jumlah_tiket'] ==
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
                                                  Text("Rp. "),
                                                  if (dataControl.data["data"]
                                                          ["jumlah_tiket"] ==
                                                      3) ...[
                                                    Text(dataControl
                                                        .data["data"]["tiket"]
                                                            [2]["harga_tiket"]
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
                                                if (dataControl.data['data']
                                                            ['tiket'][2]
                                                        ['addons'] ==
                                                    "1") ...[
                                                  Expanded(
                                                    child: Text("Add Ons"),
                                                  ),
                                                  Expanded(
                                                    child: Row(
                                                      children: [
                                                        Text("Rp. " +
                                                            dataControl
                                                                .data["data"]
                                                                    ["tiket"][2]
                                                                    [
                                                                    "harga_addons"]
                                                                .toString()),
                                                        // if (dataTicket['data']['ticket'][0]['addons'] >=
                                                        //     1) ...[
                                                        //   Text(dataTicket["data"]["tiket"][0]["harga_tiket"].toString())
                                                        // ]
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
                                              child: Text(
                                                  "10 % dari total pembelian"),
                                            ),
                                            Expanded(
                                              child: Row(children: [
                                                // Spacer(),
                                                Text("+ Rp.",
                                                    style: TextStyle(
                                                        color: Colors.red)),
                                                SizedBox(
                                                  width: 3,
                                                ),
                                                Text(
                                                    dataControl.data["data"]
                                                            ["total_pajak"]
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.red))
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
                                                      color: Colors.black))),
                                          child: Row(
                                            children: [],
                                          ),
                                        ))
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
                                                Text("Rp. "),
                                                Text(dataControl.data['data']
                                                        ['total_harga']
                                                    .toString())
                                              ],
                                            )),
                                          ],
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                if (dataControl.data['data']
                                        ['status_pembelian'] ==
                                    "paid") ...[
                                  Text("Menunggu Approval Dari System..")
                                ] else if (dataControl.data['data']
                                        ['status_pembelian'] ==
                                    "cancelled") ...[
                                  Text(
                                      "Ticket telah di Cancel dari system, silahkan menghubungi CS yang telah tercantum di Tata cara pembayaran")
                                ] else if (dataControl.data['data']
                                        ['status_pembelian'] ==
                                    "approved")
                                  ...[]
                                else if (dataControl.data['data']
                                        ['batas_waktu'] !=
                                    null) ...[
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                            "Silahkan segera melakukan pembayaran dan mengunggah bukti pembayaran sebelum :"),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Text(DateFormat("EEE, d MMM yyyy HH:mm:ss")
                                      .format(DateTime.parse(dataControl
                                          .data['data']['batas_waktu'])))
                                ] else ...[
                                  Text(
                                      "Waktu Pembayaran Telah melebihi tenggat waktu, silahkan menghubungi CS Agendakan / Signaturee Festival")
                                ],
                                Row(
                                  children: [
                                    Text("Bukti Transaksi"),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    dataControl.obx((state) => Row(children: [
                                          Column(
                                            children: [
                                              if (dataControl.data['data']
                                                      ['status_pembelian'] ==
                                                  "approved") ...[
                                                ElevatedButton(
                                                    onPressed: (() async {
                                                      ApiPlugin _provider =
                                                          ApiPlugin();
                                                      var hasil =
                                                          await _provider.get6(
                                                              data_store.read(
                                                                  "token"),
                                                              dataControl
                                                                  .data["data"]
                                                                      ['id']
                                                                  .toString());
                                                      html.AnchorElement
                                                          anchorElement =
                                                          new html.AnchorElement(
                                                              href: "https://backend.agendakan.com/storage/pdf/E-Ticket(" +
                                                                  dataControl.data[
                                                                          'data']
                                                                      [
                                                                      'kode_pembelian'] +
                                                                  ").pdf");
                                                      anchorElement.download =
                                                          "https://backend.agendakan.com/storage/pdf/E-Ticket(" +
                                                              dataControl.data[
                                                                      'data'][
                                                                  'kode_pembelian'] +
                                                              ").pdf";
                                                      anchorElement.click();
                                                    }),
                                                    child: Text(
                                                        "Download E-Ticket"))
                                              ] else if (dataControl
                                                          .data['data']
                                                      ['bukti_pembayaran'] !=
                                                  null) ...[
                                                InkWell(
                                                  onTap: () {
                                                    Get.defaultDialog(
                                                      title: "Bukti Pembayaran",
                                                      content: Container(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            2,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            2,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                image: NetworkImage(
                                                                    "https://backend.agendakan.com/api/get-bukti/" +
                                                                        dataControl.data['data']
                                                                            [
                                                                            'bukti_pembayaran']),
                                                                fit: BoxFit
                                                                    .fill)),
                                                      ),
                                                    );
                                                  },
                                                  child: Container(
                                                    height: 50,
                                                    width: 50,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                                "https://backend.agendakan.com/api/get-bukti/" +
                                                                    dataControl.data[
                                                                            'data']
                                                                        [
                                                                        'bukti_pembayaran']),
                                                            fit: BoxFit.fill)),
                                                  ),
                                                ),
                                              ],
                                              if (dataControl.data['data']
                                                      ['status_pembelian'] !=
                                                  "paid") ...[
                                                imageControl.obx(
                                                  (state) => Row(
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          Get.defaultDialog(
                                                            title:
                                                                "Bukti Pembayaran",
                                                            content: Container(
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height /
                                                                  2,
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  2,
                                                              decoration: BoxDecoration(
                                                                  image: DecorationImage(
                                                                      image: NetworkImage("https://backend.agendakan.com/api/get-bukti/" +
                                                                          imageControl
                                                                              .linkFile),
                                                                      fit: BoxFit
                                                                          .fill)),
                                                            ),
                                                          );
                                                        },
                                                        child: Container(
                                                          height: 250,
                                                          width: 250,
                                                          decoration: BoxDecoration(
                                                              image: DecorationImage(
                                                                  image: NetworkImage(
                                                                      "https://backend.agendakan.com/api/get-bukti/" +
                                                                          imageControl
                                                                              .linkFile),
                                                                  fit: BoxFit
                                                                      .fill)),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  onEmpty: Container(
                                                    child: Text(
                                                        "No image / Upload failed"),
                                                  ),
                                                  onLoading: (dataControl.data[
                                                                      'data'][
                                                                  'batas_waktu'] !=
                                                              null &&
                                                          dataControl.data[
                                                                      'data'][
                                                                  'status_pembelian'] ==
                                                              "waiting-payment")
                                                      ? Column(
                                                          children: [
                                                            Center(
                                                              child: Text(
                                                                  "Upload bukti harus dibawah 2 mb"),
                                                            ),
                                                            ElevatedButton(
                                                                onPressed:
                                                                    () async {
                                                                  Api_Image
                                                                      _uploadImage =
                                                                      new Api_Image();
                                                                  final file = await ImagePicker()
                                                                      .getImage(
                                                                          source:
                                                                              ImageSource.gallery);
                                                                  if (file !=
                                                                      null) {
                                                                    String
                                                                        filepath =
                                                                        file.path;
                                                                    Uint8List
                                                                        imageBytes =
                                                                        await file
                                                                            .readAsBytes();
                                                                    if (dataControl.data['data']
                                                                            [
                                                                            'id'] !=
                                                                        null) {
                                                                      print(dataControl
                                                                              .data['data']
                                                                          [
                                                                          'id']);
                                                                      imageControl.uploadFoto(
                                                                          data_store.read(
                                                                              "token"),
                                                                          filepath,
                                                                          imageBytes,
                                                                          dataControl.data['data']
                                                                              [
                                                                              'id']);
                                                                    }
                                                                    //var res = await _uploadImage.uploadImage(data_store.read("token"), filepath, imageBytes, dataControl.data['data']['id']);
                                                                    // setState(() {
                                                                    //   _image = "https://backend.agendakan.com/storage/bukti/" + dataControl.data['data']['bukti_pembayaran'];
                                                                    // });
                                                                  } else {
                                                                    print(
                                                                        'No image selected.');
                                                                  }
                                                                },
                                                                child: Text(
                                                                    "Upload foto"))
                                                          ],
                                                        )
                                                      : Text(""),
                                                ),
                                              ]
                                            ],
                                          ),
                                        ])),
                                  ],
                                ),
                              ]),
                            )
                          ]),
                        ),
                      ),
                  onLoading: Column(
                    children: [
                      Center(
                        child: CircularProgressIndicator(),
                      )
                    ],
                  )),
            )
          ] else ...[
            Expanded(
                flex: 6,
                child: Container(
                  color: Color(0xffF6F6F6),
                  padding: EdgeInsets.fromLTRB(29, 20, 29, 41),
                  child: Row(
                    children: [
                      if (screenSize >= 1000) ...[
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                                  width: (screenSize >= 1100)
                                                      ? 250
                                                      : 200,
                                                  fit: BoxFit.fitWidth,
                                                  image: AssetImage(
                                                      'images/poster_1.png'),
                                                  height: (screenSize >= 1100)
                                                      ? 210
                                                      : 100,
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Container(
                                                  child: Text(
                                                    "SIGNATUREE FESTIVAL",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 10),
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
                                                bottom:
                                                    BorderSide(width: 1.5))),
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
                                                Icon(
                                                  Icons.calendar_today,
                                                  size: 15,
                                                ),
                                                Container(
                                                  child: Text("23 Juli 2022"),
                                                ),
                                              ],
                                            ),
                                            Text("Malang, Indonesia"),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.location_on,
                                                  size: 15,
                                                ),
                                                Container(
                                                  child: Text(
                                                      "Kusuma Agro Wisata"),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        //color: Colors.green,
                                      )),
                                  dataControl.obx((state) => Expanded(
                                      flex: 2,
                                      child: Container(
                                        child: Column(children: [
                                          Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 48, 0, 5),
                                              child:
                                                  Text("Booked Ticket Type")),
                                          Container(
                                            width: 144,
                                            height: 46,
                                            decoration: BoxDecoration(
                                                color: Color(0xffA9F6FE),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5))),
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text("" +
                                                      dataControl.data['data']
                                                              ['tiket'][0]
                                                              ['jenis_tiket']
                                                          .toString()
                                                          .toUpperCase()),
                                                  Text("Rp. " +
                                                      dataControl.data['data']
                                                              ['tiket'][0]
                                                              ['harga_tiket']
                                                          .toString()),
                                                ]),
                                          )
                                        ]),
                                        // color: Colors.amber,
                                      )))
                                ]),
                                color: Colors.white,
                              ))
                            ],
                          ),
                        ))
                      ],
                      if (screenSize >= 800) ...[
                        Expanded(
                            flex: 3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(61, 51, 68, 0),
                                    child: Container(
                                      child: Container(
                                          child: Column(
                                              //mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      30, 0, 30, 0),
                                                  child: TabBar(
                                                    labelColor: Colors.blue,
                                                    unselectedLabelColor:
                                                        Colors.black,
                                                    indicator: BoxDecoration(
                                                        border: Border(
                                                            bottom: BorderSide(
                                                                width: 1.5,
                                                                color: Colors
                                                                    .blue))),
                                                    tabs: _tabx.myTabs,
                                                    controller:
                                                        _tabx.controller,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: TabBarView(
                                                      controller:
                                                          _tabx.controller,
                                                      children: [
                                                        dataControl.obx(
                                                            (state) =>
                                                                SingleChildScrollView(
                                                                  child: Column(
                                                                      children: [
                                                                        SizedBox(
                                                                          height:
                                                                              40,
                                                                        ),
                                                                        Row(
                                                                          children: [
                                                                            Expanded(child: Text("Kode Pembayaran")),
                                                                            Text(": "),
                                                                            Expanded(
                                                                                flex: 2,
                                                                                child: Row(
                                                                                  children: [
                                                                                    SelectableText("" + dataControl.data['data']['kode_pembelian']),
                                                                                    SizedBox(
                                                                                      width: 15,
                                                                                    ),
                                                                                    ElevatedButton(
                                                                                        onPressed: () {
                                                                                          Clipboard.setData(ClipboardData(text: dataControl.data['data']['kode_pembelian'])).then((value) => Get.snackbar("Notification", "Kode Pembelian telah di copy!"));
                                                                                        },
                                                                                        child: Text("Copy"))
                                                                                  ],
                                                                                ))
                                                                          ],
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              30,
                                                                        ),
                                                                        Row(
                                                                          children: [
                                                                            Expanded(child: Text("Email")),
                                                                            Text(": "),
                                                                            Expanded(
                                                                                flex: 2,
                                                                                child: Text("" + dataControl.data['data']['email_pemesan']))
                                                                          ],
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              30,
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
                                                                                      child: Row(
                                                                                        children: [
                                                                                          Text("Rp."),
                                                                                          SizedBox(
                                                                                            width: 10,
                                                                                          ),
                                                                                          Text(dataControl.data["data"]["tiket"][0]["harga_tiket"].toString())
                                                                                        ],
                                                                                      ),
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
                                                                                    if (dataControl.data['data']['tiket'][0]['addons'] == "1") ...[
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
                                                                                            Text(dataControl.data["data"]["tiket"][0]["harga_addons"].toString()),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ]
                                                                                  ],
                                                                                ))
                                                                          ],
                                                                        ),
                                                                        if (dataControl.data["data"]["id_kupon"] !=
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
                                                                                        child: Row(children: [
                                                                                          // Spacer(),
                                                                                          Text("(" + dataControl.data["data"]["nama_kupon"].toString() + ")"),
                                                                                        ]),
                                                                                      ),
                                                                                    ],
                                                                                  ))
                                                                            ],
                                                                          ),
                                                                          if (dataControl.data["data"]["potongan"] !=
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
                                                                                            Text("Potongan Coupon " + dataControl.data["data"]["potongan_persen"].toString()),
                                                                                            // SizedBox(
                                                                                            //   width: 10,
                                                                                            // ),
                                                                                            Text(" %"),
                                                                                          ]),
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: Row(children: [
                                                                                            // Spacer(),
                                                                                            Text("-  Rp.", style: TextStyle(color: Colors.green)),
                                                                                            SizedBox(
                                                                                              width: 10,
                                                                                            ),
                                                                                            Text(dataControl.data["data"]["potongan"].toString(), style: TextStyle(color: Colors.green))
                                                                                          ]),
                                                                                        ),
                                                                                      ],
                                                                                    ))
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ],
                                                                        SizedBox(
                                                                          height:
                                                                              30,
                                                                        ),
                                                                        if (dataControl.data['data']['jumlah_tiket'] !=
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
                                                                                          if (dataControl.data["data"]["jumlah_tiket"] >= 2) ...[
                                                                                            Text(dataControl.data["data"]["tiket"][1]["harga_tiket"].toString())
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
                                                                                      if (dataControl.data['data']['tiket'][1]['addons'] == "1") ...[
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
                                                                                              Text(dataControl.data["data"]["tiket"][1]["harga_addons"].toString()),
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
                                                                          height:
                                                                              30,
                                                                        ),
                                                                        if (dataControl.data['data']['jumlah_tiket'] ==
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
                                                                                          if (dataControl.data["data"]["jumlah_tiket"] == 3) ...[
                                                                                            Text(dataControl.data["data"]["tiket"][2]["harga_tiket"].toString())
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
                                                                                        if (dataControl.data['data']['tiket'][2]['addons'] == "1") ...[
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
                                                                                                Text(dataControl.data["data"]["tiket"][2]["harga_addons"].toString()),
                                                                                                // if (dataTicket['data']['ticket'][0]['addons'] >=
                                                                                                //     1) ...[
                                                                                                //   Text(dataTicket["data"]["tiket"][0]["harga_tiket"].toString())
                                                                                                // ]
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
                                                                        SizedBox(
                                                                          height:
                                                                              30,
                                                                        ),

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
                                                                                      child: Text("10 % dari total pembelian"),
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Row(children: [
                                                                                        // Spacer(),
                                                                                        Text("+ Rp.", style: TextStyle(color: Colors.red)),
                                                                                        SizedBox(
                                                                                          width: 10,
                                                                                        ),
                                                                                        Text(dataControl.data["data"]["total_pajak"].toString(), style: TextStyle(color: Colors.red))
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
                                                                                  decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: Colors.black))),
                                                                                  child: Row(
                                                                                    children: [],
                                                                                  ),
                                                                                ))
                                                                          ],
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              30,
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
                                                                                        Text("Rp. "),
                                                                                        Text(dataControl.data['data']['total_harga'].toString())
                                                                                      ],
                                                                                    )),
                                                                                  ],
                                                                                ))
                                                                          ],
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              30,
                                                                        ),
                                                                        if (dataControl.data['data']['status_pembelian'] ==
                                                                            "paid") ...[
                                                                          Text(
                                                                              "Menunggu Approval Dari System..")
                                                                        ] else if (dataControl.data['data']['status_pembelian'] ==
                                                                            "approved")
                                                                          ...[]
                                                                        else if (dataControl.data['data']['status_pembelian'] ==
                                                                            "cancelled") ...[
                                                                          Text(
                                                                              "Ticket telah di Cancel dari system, silahkan menghubungi CS yang telah tercantum di Tata cara pembayaran")
                                                                        ] else if (dataControl.data['data']['batas_waktu'] !=
                                                                            null) ...[
                                                                          Row(
                                                                            children: [
                                                                              Expanded(
                                                                                child: Text("Silahkan segera melakukan pembayaran dan mengunggah bukti pembayaran sebelum :"),
                                                                              )
                                                                            ],
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                30,
                                                                          ),
                                                                          Text(DateFormat("EEE, d MMM yyyy HH:mm:ss").format(DateTime.parse(dataControl.data['data']
                                                                              [
                                                                              'batas_waktu'])))
                                                                        ] else if (dataControl.data['data']['status_pembelian'] ==
                                                                            "cancelled") ...[
                                                                          Text(
                                                                              "Ticket telah di Cancel dari system, silahkan menghubungi CS yang telah tercantum di Tata cara pembayaran")
                                                                        ] else ...[
                                                                          Text(
                                                                              "Waktu Pembayaran Telah melebihi tenggat waktu, silahkan menghubungi CS Agendakan / Signaturee Festival")
                                                                        ],
                                                                        // Text(dataControl
                                                                        //     .data['data']['batas_waktu']
                                                                        //     .toString()),
                                                                        SizedBox(
                                                                          height:
                                                                              30,
                                                                        ),
                                                                        Row(
                                                                          children: [
                                                                            Text("Bukti Transaksi"),
                                                                            dataControl.obx((state) =>
                                                                                Row(children: [
                                                                                  Column(
                                                                                    children: [
                                                                                      if (dataControl.data['data']['status_pembelian'] == "approved") ...[
                                                                                        ElevatedButton(
                                                                                            onPressed: (() async {
                                                                                              ApiPlugin _provider = ApiPlugin();
                                                                                              var hasil = await _provider.get6(data_store.read("token"), dataControl.data["data"]['id'].toString());
                                                                                              html.AnchorElement anchorElement = new html.AnchorElement(href: "https://backend.agendakan.com/storage/pdf/E-Ticket(" + dataControl.data['data']['kode_pembelian'] + ").pdf");
                                                                                              anchorElement.download = "https://backend.agendakan.com/storage/pdf/E-Ticket(" + dataControl.data['data']['kode_pembelian'] + ").pdf";
                                                                                              anchorElement.click();
                                                                                            }),
                                                                                            child: Text("Download E-Ticket"))
                                                                                      ] else if (dataControl.data['data']['bukti_pembayaran'] != null) ...[
                                                                                        InkWell(
                                                                                          onTap: () {
                                                                                            Get.defaultDialog(
                                                                                              title: "Bukti Pembayaran",
                                                                                              content: Container(
                                                                                                height: MediaQuery.of(context).size.height / 2,
                                                                                                width: MediaQuery.of(context).size.width / 2,
                                                                                                decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("https://backend.agendakan.com/api/get-bukti/" + dataControl.data['data']['bukti_pembayaran']), fit: BoxFit.fill)),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                          child: Container(
                                                                                            height: 50,
                                                                                            width: 50,
                                                                                            decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("https://backend.agendakan.com/api/get-bukti/" + dataControl.data['data']['bukti_pembayaran']), fit: BoxFit.fill)),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                      if (dataControl.data['data']['status_pembelian'] != "approved") ...[
                                                                                        imageControl.obx(
                                                                                          (state) => Row(
                                                                                            children: [
                                                                                              InkWell(
                                                                                                onTap: () {
                                                                                                  Get.defaultDialog(
                                                                                                    title: "Bukti Pembayaran",
                                                                                                    content: Container(
                                                                                                      height: MediaQuery.of(context).size.height / 2,
                                                                                                      width: MediaQuery.of(context).size.width / 2,
                                                                                                      decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("https://backend.agendakan.com/api/get-bukti/" + imageControl.linkFile), fit: BoxFit.fill)),
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                                child: Container(
                                                                                                  height: 250,
                                                                                                  width: 250,
                                                                                                  decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("https://backend.agendakan.com/api/get-bukti/" + imageControl.linkFile), fit: BoxFit.fill)),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          onEmpty: Container(
                                                                                            child: Text("No image / Upload failed"),
                                                                                          ),
                                                                                          onLoading: (dataControl.data['data']['batas_waktu'] != null && dataControl.data['data']['status_pembelian'] == "waiting-payment")
                                                                                              ? Column(
                                                                                                  children: [
                                                                                                    Center(
                                                                                                      child: Text("Upload bukti harus dibawah 2 mb"),
                                                                                                    ),
                                                                                                    ElevatedButton(
                                                                                                        onPressed: () async {
                                                                                                          Api_Image _uploadImage = new Api_Image();
                                                                                                          final file = await ImagePicker().getImage(source: ImageSource.gallery);
                                                                                                          if (file != null) {
                                                                                                            String filepath = file.path;
                                                                                                            Uint8List imageBytes = await file.readAsBytes();
                                                                                                            if (dataControl.data['data']['id'] != null) {
                                                                                                              print(dataControl.data['data']['id']);
                                                                                                              imageControl.uploadFoto(data_store.read("token"), filepath, imageBytes, dataControl.data['data']['id']);
                                                                                                            }
                                                                                                            //var res = await _uploadImage.uploadImage(data_store.read("token"), filepath, imageBytes, dataControl.data['data']['id']);
                                                                                                            // setState(() {
                                                                                                            //   _image = "https://backend.agendakan.com/storage/bukti/" + dataControl.data['data']['bukti_pembayaran'];
                                                                                                            // });
                                                                                                          } else {
                                                                                                            print('No image selected.');
                                                                                                          }
                                                                                                        },
                                                                                                        child: Text("Upload foto"))
                                                                                                  ],
                                                                                                )
                                                                                              : Text(""),
                                                                                        ),
                                                                                      ]
                                                                                    ],
                                                                                  ),
                                                                                ])),
                                                                          ],
                                                                        ),
                                                                      ]),
                                                                ),
                                                            onLoading: Column(
                                                              children: [
                                                                Center(
                                                                  child:
                                                                      CircularProgressIndicator(),
                                                                )
                                                              ],
                                                            )),
                                                        Column(
                                                          children: [
                                                            SizedBox(
                                                              height: 40,
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text("1."),
                                                                SizedBox(
                                                                  width: 15,
                                                                ),
                                                                Expanded(
                                                                  child: Text(
                                                                      "Pembayaran dilakukan dengan cara Transfer ke Rekening di bawah ini : "),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Row(
                                                              children: [
                                                                SizedBox(
                                                                  width: 40,
                                                                ),
                                                                // Text("1."),
                                                                // SizedBox(
                                                                //   width: 15,
                                                                // ),
                                                                SelectableText(
                                                                    "Mandiri : 1370020675126\nA.n Alif Aulia Muhammad"),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Row(
                                                              children: [
                                                                SizedBox(
                                                                  width: 40,
                                                                ),
                                                                // Text("2."),
                                                                // SizedBox(
                                                                //   width: 15,
                                                                // ),
                                                                SelectableText(
                                                                    "BCA : 8610713841\nA.n Alif Aulia Muhammad"),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Row(
                                                              children: [
                                                                SizedBox(
                                                                  width: 40,
                                                                ),
                                                                // Text("3."),
                                                                // SizedBox(
                                                                //   width: 15,
                                                                // ),
                                                                SelectableText(
                                                                    "BRI : 057901048851507\nA.n M. Daffa Lazuardi P"),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text("2."),
                                                                SizedBox(
                                                                  width: 15,
                                                                ),
                                                                Expanded(
                                                                  child: Text(
                                                                      "Harap mencantumkan kode pembayaran dalam deskripsi transfer atau dengan menulis kode pembayaran pada slip transfer"),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text("3."),
                                                                SizedBox(
                                                                  width: 15,
                                                                ),
                                                                Expanded(
                                                                  child: Text(
                                                                      "Melakukan upload bukti transfer ke halaman Ticket dan menunggu Verifikasi Admin"),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text("4."),
                                                                SizedBox(
                                                                  width: 15,
                                                                ),
                                                                Expanded(
                                                                  child: Text(
                                                                      "E-Ticket diterbitkan maksimal 1 X 24 Jam setelah bukti pembayaran ter-verifikasi."),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text("5."),
                                                                SizedBox(
                                                                  width: 15,
                                                                ),
                                                                Expanded(
                                                                  child: Text(
                                                                      "Jika mengalami kendala, silahkan menghubungi Contact Person kami di: +6285746970735 (WA message only)"),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                          ],
                                                        )
                                                      ]),
                                                ),
                                              ]),
                                          margin: EdgeInsets.fromLTRB(
                                              87, 30, 79, 30),
                                          color: Colors.white),
                                      color: Colors.white,
                                    ),
                                    color: Color(0xffF6F6F6),
                                  ),
                                ),
                              ],
                            ))
                      ]
                    ],
                  ),
                ))
          ]
        ],
      ),
    );
  }
}
