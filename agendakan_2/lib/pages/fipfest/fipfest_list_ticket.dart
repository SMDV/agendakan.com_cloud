import 'package:agendakan_2/pages/fipfest/repository/gkm_api.dart';
import 'package:agendakan_2/pages/gkm/repository/gkm_api.dart';
import 'package:agendakan_2/plugins/ApiPlugin.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math';
import 'dart:html' as html;

class ListTicketFipfest extends StatefulWidget {
  const ListTicketFipfest({Key? key}) : super(key: key);

  @override
  State<ListTicketFipfest> createState() => _ListTicketFipfestState();
}

class _ListTicketFipfestState extends State<ListTicketFipfest> {
  // ApiPlugin _provider = ApiPlugin();
  GetDataController _dataControll = Get.put(GetDataController());
  String keyword = "all";
  final searchName = TextEditingController();
  GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final data_store = GetStorage();
    _dataControll.loadData(keyword);
    print(data_store.read("isAdmin"));
    int _currentSortColumn = 0;
    bool _isAscending = true;
    String ticketStatus = "All";
    String ticketType = "All";
    return _dataControll.obx(
      (state) => Scaffold(
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
                  decoration:
                      BoxDecoration(border: Border(bottom: BorderSide())),
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
                      if (data_store.read("isAdmin") == 1) {
                        Get.offAndToNamed('/fipfest');
                      } else {
                        Get.offAndToNamed('/fipfest');
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                    if (data_store.read("isAdmin") == 1) ...[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Ticket status (Admin only)"),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Icon(FontAwesomeIcons.angleLeft),
                              Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width / 2,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          Row(
                                            children: [Text("Presale 3")],
                                          ),
                                          Row(
                                            children: [
                                              Text("Sisa"),
                                              Text(" - "),
                                              Text("Terjual")
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                _dataControll._presale3sisa,
                                                style: TextStyle(
                                                    color: Colors.red),
                                              ),
                                              Text("/"),
                                              Text(
                                                _dataControll._presale3sold,
                                                style: TextStyle(
                                                    color: Colors.green),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            children: [Text("SD")],
                                          ),
                                          Row(
                                            children: [
                                              Text("Sisa"),
                                              Text(" - "),
                                              Text("Terjual")
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                _dataControll._sd1,
                                                style: TextStyle(
                                                    color: Colors.red),
                                              ),
                                              Text("/"),
                                              Text(
                                                _dataControll._sd2,
                                                style: TextStyle(
                                                    color: Colors.green),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            children: [Text("SMP")],
                                          ),
                                          Row(
                                            children: [
                                              Text("Sisa"),
                                              Text(" - "),
                                              Text("Terjual")
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                _dataControll._smp1,
                                                style: TextStyle(
                                                    color: Colors.red),
                                              ),
                                              Text("/"),
                                              Text(
                                                _dataControll._smp2,
                                                style: TextStyle(
                                                    color: Colors.green),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            children: [Text("SMA")],
                                          ),
                                          Row(
                                            children: [
                                              Text("Sisa"),
                                              Text(" - "),
                                              Text("Terjual")
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                _dataControll._sma1,
                                                style: TextStyle(
                                                    color: Colors.red),
                                              ),
                                              Text("/"),
                                              Text(
                                                _dataControll._sma2,
                                                style: TextStyle(
                                                    color: Colors.green),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Icon(FontAwesomeIcons.angleRight),
                            ],
                          ),
                        ],
                      )
                    ],
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
                ),
                PaginatedDataTable(
                  columns: [
                    DataColumn(label: Text("No")),
                    DataColumn(
                      label: Text("Name"),
                      onSort: (columnIndex, _) {
                        _currentSortColumn = columnIndex;
                        if (_isAscending == true) {
                          _isAscending = false;
                          print("Column index = " + columnIndex.toString());
                          // sort the product list in Ascending, order by Price
                          _dataControll._data.sort((productA, productB) =>
                              productB['tiket'][0]['nama_tiket'].compareTo(
                                  productA['tiket'][0]['nama_tiket']));
                        } else {
                          _isAscending = true;
                          // sort the product list in Descending, order by Price
                          _dataControll._data.sort((productA, productB) =>
                              productA['tiket'][0]['nama_tiket'].compareTo(
                                  productB['tiket'][0]['nama_tiket']));
                        }
                        _dataControll.reSync();
                        // setState(() {});
                      },
                    ),
                    DataColumn(
                      label: Text("Ticket"),
                      onSort: (columnIndex, _) {
                        _currentSortColumn = columnIndex;
                        if (_isAscending == true) {
                          _isAscending = false;
                          print("Column index = " + columnIndex.toString());
                          // sort the product list in Ascending, order by Price
                          _dataControll._data.sort((productA, productB) =>
                              productB['tiket'][0]['jenis_tiket'].compareTo(
                                  productA['tiket'][0]['jenis_tiket']));
                        } else {
                          _isAscending = true;
                          // sort the product list in Descending, order by Price
                          _dataControll._data.sort((productA, productB) =>
                              productA['tiket'][0]['jenis_tiket'].compareTo(
                                  productB['tiket'][0]['jenis_tiket']));
                        }
                        _dataControll.reSync();
                        // setState(() {});
                      },
                    ),
                    DataColumn(label: Text("Amount")),
                    DataColumn(label: Text("Price")),
                    DataColumn(label: Text("Status")),
                    // DataColumn(label: Text("Time")),
                    DataColumn(label: Text("Details")),
                    if (data_store.read("isAdmin") == 0) ...[
                      DataColumn(label: Text("Payment")),
                      DataColumn(label: Text("Download"))
                    ]
                  ],
                  sortColumnIndex: _currentSortColumn,
                  sortAscending: _isAscending,
                  source: MyData(dataSource: _dataControll._data),
                  header: Row(children: [
                    Spacer(),
                    Text("List Ticket"),
                    Spacer(),
                    DropdownButton(
                      value: ticketStatus,
                      items: <String>['All', 'Success', 'Failed']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        if (ticketStatus != newValue) {
                          ticketStatus = newValue!;
                          _dataControll.loadData(ticketStatus.toLowerCase());
                        }
                      },
                    ),
                    // ElevatedButton(
                    //     onPressed: () {
                    //       _dataControll.loadData("all");
                    //     },
                    //     child: Text("All")),
                    // SizedBox(
                    //   width: 5,
                    // ),
                    // ElevatedButton(
                    //     onPressed: () {
                    //       _dataControll.loadData("success");
                    //     },
                    //     child: Text("Success")),
                    // SizedBox(
                    //   width: 5,
                    // ),
                    // ElevatedButton(
                    //     onPressed: () {
                    //       _dataControll.loadData("failed");
                    //     },
                    //     child: Text("Failed")),
                    SizedBox(
                      width: 20,
                    )
                  ]),
                  rowsPerPage: 20,
                  // columnSpacing: 100,
                )
              ]),
        ),
      ),
      onLoading: Center(
        child: CircularProgressIndicator(),
      ),
      onEmpty: Scaffold(
        body: Center(
          child: Column(children: [
            Text("No Data!"),
            ElevatedButton(
                onPressed: () {
                  Get.offAllNamed("/fipfest");
                },
                child: Icon(FontAwesomeIcons.rotate))
          ]),
        ),
      ),
      onError: (error) {
        return Scaffold();
      },
    );
  }
}

class GetDataController extends GetxController with StateMixin {
  List<dynamic> _data = [].obs;
  FipFest_API _provider = FipFest_API();
  final data_store = GetStorage();
  String _presale3sisa = "";
  String _presale3sold = "";
  String _sd1 = "";
  String _sd2 = "";
  String _smp1 = "";
  String _smp2 = "";
  String _sma1 = "";
  String _sma2 = "";
  void reSync() {
    change(null, status: RxStatus.loading());
    change(null, status: RxStatus.success());
  }

  void loadData(String keyword) async {
    var token = data_store.read('token');
    if (token == null) {
      // Get.offAllNamed("/loginpage");
      change(null, status: RxStatus.error());
    } else {
      change(null, status: RxStatus.loading());
      var apiData;
      // print(token + "TESTING HALLO");
      if (token != null && data_store.read('acara') == "FIPFEST") {
        apiData = await _provider.get3(token, keyword);
      }
      if (apiData == null || apiData["data"] == null) {
        change(null, status: RxStatus.empty());
      } else {
        _presale3sisa = apiData['presale3-sisa'].toString();
        _presale3sold = apiData['presale3-terjual'].toString();
        _sd1 = apiData['sd-sisa'].toString();
        _sd2 = apiData['sd-terjual'].toString();
        _smp1 = apiData['smp-sisa'].toString();
        _smp2 = apiData['smp-terjual'].toString();
        _sma1 = apiData['sma-sisa'].toString();
        _sma2 = apiData['sma-terjual'].toString();
        _data = apiData["data"];
        change(null, status: RxStatus.success());
      }
    }
  }

  void loadDataKategori(String keyword) async {
    String token = data_store.read('token');

    change(null, status: RxStatus.loading());
    var apiData = await _provider.get3(token, keyword);
    if (apiData["data"] == null) {
      change(null, status: RxStatus.empty());
    } else {
      _data = apiData["data"];
      change(null, status: RxStatus.success());
    }
  }

  void downloadGetTicket(String id) async {
    var hasil = await _provider.get6(data_store.read("token"), id);
  }
}

class MyData extends DataTableSource {
  MyData({
    required List<dynamic> dataSource,
  })  : _data = dataSource,
        assert(dataSource != null);

  final List<dynamic> _data;
  final data_store = GetStorage();
  @override
  DataRow getRow(int index) {
    // TODO: implement getRow

    return DataRow(cells: [
      DataCell(Text((index + 1).toString())),
      if ((_data[index]['tiket']).length != 0) ...[
        DataCell(Text(_data[index]['tiket'][0]['nama_tiket'].toString())),
        DataCell(Text(_data[index]['tiket'][0]['jenis_tiket'].toString())),
      ] else ...[
        DataCell(Text("Error Data / Cancelled Input")),
        DataCell(Text("Error Data / Cancelled Input")),
      ],

      DataCell(Text(_data[index]['jumlah_tiket'].toString())),
      DataCell(Text("Rp. " +
          double.parse(_data[index]['total_price']).toInt().toString())),
      DataCell(Text(_data[index]['payment_status'].toString())),
      // DataCell(Text(_data[index]['tiket'][0]['tanggal_kehadiran'].toString())),
      if (_data[index]['jumlah_tiket'] != 0) ...[
        DataCell(ElevatedButton(
          onPressed: () {
            Get.defaultDialog(
                title: "Detail Ticket",
                content: SingleChildScrollView(
                  child: Container(
                      width: 450,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Column(
                        children: [
                          Text("Data Ticket 1"),
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            children: [
                              Text("Name "),
                              Spacer(),
                              Text(_data[index]["tiket"][0]["nama_tiket"]),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Email"),
                              Spacer(),
                              Text(_data[index]["tiket"][0]["email"]),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Gender"),
                              Spacer(),
                              Text(_data[index]["tiket"][0]["jenis_kelamin"]),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Phone No"),
                              Spacer(),
                              Text(_data[index]["tiket"][0]["nomor_hp"]),
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          if (_data[index]["jumlah_tiket"] > 1) ...[
                            Text("Data Ticket 2"),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              children: [
                                Text("Name "),
                                Spacer(),
                                Text(_data[index]["tiket"][1]["nama_tiket"]),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Email"),
                                Spacer(),
                                Text(_data[index]["tiket"][1]["email"]),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Gender"),
                                Spacer(),
                                Text(_data[index]["tiket"][1]["jenis_kelamin"]),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Phone No"),
                                Spacer(),
                                Text(_data[index]["tiket"][1]["nomor_hp"]),
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                          ],
                          if (_data[index]["jumlah_tiket"] == 3 ||
                              _data[index]["jumlah_tiket"] == 4) ...[
                            Text("Data Ticket 3"),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              children: [
                                Text("Name "),
                                Spacer(),
                                Text(_data[index]["tiket"][2]["nama_tiket"]),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Email"),
                                Spacer(),
                                Text(_data[index]["tiket"][2]["email"]),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Gender"),
                                Spacer(),
                                Text(_data[index]["tiket"][2]["jenis_kelamin"]),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Phone No"),
                                Spacer(),
                                Text(_data[index]["tiket"][2]["nomor_hp"]),
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                          ],
                          if (_data[index]["jumlah_tiket"] == 4) ...[
                            Text("Data Ticket 4"),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              children: [
                                Text("Name "),
                                Spacer(),
                                Text(_data[index]["tiket"][3]["nama_tiket"]),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Email"),
                                Spacer(),
                                Text(_data[index]["tiket"][3]["email"]),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Gender"),
                                Spacer(),
                                Text(_data[index]["tiket"][3]["jenis_kelamin"]),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Phone No"),
                                Spacer(),
                                Text(_data[index]["tiket"][3]["nomor_hp"]),
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                          ],
                          Row(
                            children: [
                              Text("Total Price"),
                              Spacer(),
                              Text("Rp. " +
                                  double.parse(_data[index]["total_price"])
                                      .toInt()
                                      .toString()),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Payment Status"),
                              Spacer(),
                              Text(_data[index]["payment_status"]),
                            ],
                          ),
                        ],
                      )),
                ));
          },
          child: Icon(FontAwesomeIcons.magnifyingGlass, size: 15),
        )),
      ] else ...[
        DataCell(Text("-"))
      ],
      if (data_store.read("isAdmin") == 1)
        ...[]
      else if (_data[index]['payment_status'].toString() == "success" ||
          _data[index]['payment_status'].toString() == "pending") ...[
        DataCell(ElevatedButton(
          onPressed: () async {
            await launch(
                'https://app.midtrans.com/snap/v2/vtweb/' +
                    _data[index]['snap_token'],
                forceWebView: true);
          },
          child: Icon(
            FontAwesomeIcons.creditCard,
            size: 15,
          ),
        )),
      ] else ...[
        DataCell(Text("-"))
      ],
      if (data_store.read("isAdmin") == 1)
        ...[]
      else if (_data[index]['payment_status'] == "success") ...[
        DataCell(ElevatedButton(
          onPressed: () async {
            FipFest_API _provider = FipFest_API();
            final data_store = GetStorage();
            Get.defaultDialog(
                title: "Mohon Ditunggu", content: CircularProgressIndicator());
            var hasil = await _provider.get6(
                data_store.read("token"), _data[index]['id'].toString());
            if (_data[index]['payment_status'] == "success") {
              html.AnchorElement anchorElement = new html.AnchorElement(
                  href: "https://fipfest.agendakan.com/storage/pdf/E-Ticket(" +
                      _data[index]['kode_pembelian'] +
                      ").pdf");
              anchorElement.download =
                  "https://fipfest.agendakan.com/storage/pdf/E-Ticket(" +
                      _data[index]['kode_pembelian'] +
                      ").pdf";
              anchorElement.click();
            } else {
              Get.defaultDialog(
                  title: "Payment Incomplete!",
                  content: Container(
                    child: Center(
                        child: Text("Selesaikan Pembayaran Terlebih dahulu!")),
                    width: 200,
                  ));
            }
          },
          child: Text("Download Ticket"),
        ))
      ] else ...[
        DataCell(Text("Payment Incomplete"))
      ]
    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => _data.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
