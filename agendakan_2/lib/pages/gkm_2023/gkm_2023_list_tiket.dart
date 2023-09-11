import 'package:agendakan_2/pages/gkm/repository/gkm_api.dart';
import 'package:agendakan_2/pages/gkm_2023/Repository/gkm_2023_api.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;

class ListTicketGKM2023 extends StatefulWidget {
  const ListTicketGKM2023({Key? key}) : super(key: key);

  @override
  State<ListTicketGKM2023> createState() => _ListTicketGKM2023State();
}

class _ListTicketGKM2023State extends State<ListTicketGKM2023> {
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
                  decoration: BoxDecoration(border: Border(bottom: BorderSide())),
                  child: ListTile(
                    title: Center(
                        child: Text(
                      "HOME",
                      style:
                          TextStyle(fontSize: 20, fontFamily: 'Syne', fontWeight: FontWeight.w800),
                    )),
                    onTap: () {
                      if (data_store.read("isAdmin") == 1) {
                        Get.offAndToNamed('/gkm');
                      } else {
                        Get.offAndToNamed('/gkm');
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
                      style:
                          TextStyle(fontSize: 20, fontFamily: 'Syne', fontWeight: FontWeight.w800),
                    )),
                    onTap: () {
                      data_store.remove('token');
                      data_store.remove('isAdmin');
                      data_store.remove('acara');
                      Get.offAllNamed("/gkm");
                    },
                  ),
                ),
              ] else ...[
                Container(
                  decoration:
                      BoxDecoration(border: Border(top: BorderSide(), bottom: BorderSide())),
                  child: ListTile(
                    title: Center(
                        child: Text(
                      "LOG IN",
                      style:
                          TextStyle(fontSize: 20, fontFamily: 'Syne', fontWeight: FontWeight.w800),
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
                          const Text("Ticket status (Admin only)"),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.5,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("Presale 1"),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Tersisa ${_dataControll._sisa1}',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                          Text("/"),
                                          Text(
                                            'Terjual ${_dataControll._sold1}',
                                            style: TextStyle(color: Colors.green),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("Presale 2"),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Tersisa ${_dataControll._sisa2}',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                          Text("/"),
                                          Text(
                                            'Terjual ${_dataControll._sold2}',
                                            style: TextStyle(color: Colors.green),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("Presale 2"),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Tersisa ${_dataControll._sisa2}',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                          Text("/"),
                                          Text(
                                            'Terjual ${_dataControll._sold2}',
                                            style: TextStyle(color: Colors.green),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
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
                          _dataControll._data.sort((productA, productB) => productB['tiket'][0]
                                  ['nama_tiket']
                              .compareTo(productA['tiket'][0]['nama_tiket']));
                        } else {
                          _isAscending = true;
                          // sort the product list in Descending, order by Price
                          _dataControll._data.sort((productA, productB) => productA['tiket'][0]
                                  ['nama_tiket']
                              .compareTo(productB['tiket'][0]['nama_tiket']));
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
                          _dataControll._data.sort((productA, productB) => productB['tiket'][0]
                                  ['jenis_tiket']
                              .compareTo(productA['tiket'][0]['jenis_tiket']));
                        } else {
                          _isAscending = true;
                          // sort the product list in Descending, order by Price
                          _dataControll._data.sort((productA, productB) => productA['tiket'][0]
                                  ['jenis_tiket']
                              .compareTo(productB['tiket'][0]['jenis_tiket']));
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
                  setState(() {});
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
  GKM_2023_API _provider = GKM_2023_API();
  final data_store = GetStorage();
  String _sisa1 = "";
  String _sold1 = "";
  String _sisa2 = "";
  String _sold2 = "";
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
      if (token != null && data_store.read('acara') == "GKM 2023") {
        apiData = await _provider.getListTicket(token, keyword);
      }
      if (apiData == null || apiData["data"] == null) {
        change(null, status: RxStatus.empty());
      } else {
        _sisa1 = apiData['presale1-sisa'].toString();
        _sold1 = apiData['presale1-terjual'].toString();
        _sisa2 = apiData['presale2-sisa'].toString();
        _sold2 = apiData['presale2-terjual'].toString();
        _data = apiData["data"];
        change(null, status: RxStatus.success());
      }
    }
  }

  void loadDataKategori(String keyword) async {
    String token = data_store.read('token');

    change(null, status: RxStatus.loading());
    var apiData = await _provider.getListTicket(token, keyword);
    if (apiData["data"] == null) {
      change(null, status: RxStatus.empty());
    } else {
      _data = apiData["data"];
      change(null, status: RxStatus.success());
    }
  }

  // void downloadGetTicket(String id) async {
  //   var hasil = await _provider.get6(data_store.read("token"), id);
  // }
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
      DataCell(Text("Rp. " + double.parse(_data[index]['total_price']).toInt().toString())),
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
                              Text("No Identitas "),
                              Spacer(),
                              Text(_data[index]["nomor_ktp"].toString()),
                            ],
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
                              Text("No Identitas "),
                              Spacer(),
                              Text(_data[index]["nomor_ktp"].toString()),
                            ],
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
                                Text("Phone No"),
                                Spacer(),
                                Text(_data[index]["tiket"][1]["nomor_hp"]),
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                          ],
                          if (_data[index]["jumlah_tiket"] == 3) ...[
                            Text("Data Ticket 3"),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                            children: [
                              Text("No Identitas "),
                              Spacer(),
                              Text(_data[index]["nomor_ktp"].toString()),
                            ],
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
                                Text("Phone No"),
                                Spacer(),
                                Text(_data[index]["tiket"][2]["nomor_hp"]),
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
                                  double.parse(_data[index]["total_price"]).toInt().toString()),
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
                'https://app.midtrans.com/snap/v3/redirection/' + _data[index]['snap_token'],
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
            GKM_2023_API _provider = GKM_2023_API();
            final data_store = GetStorage();
            Get.defaultDialog(title: "Mohon Ditunggu", content: CircularProgressIndicator());
            var hasil = await _provider.downloadTicket(
                data_store.read("token"), _data[index]['id'].toString());
            if (_data[index]['payment_status'] == "success") {
              html.AnchorElement anchorElement = html.AnchorElement(
                  href: "https://gkm2023.agendakan.com/storage/pdf/E-Ticket(" +
                      _data[index]['kode_pembelian'] +
                      ").pdf");
              anchorElement.download = "https://gkm2023.agendakan.com/storage/pdf/E-Ticket(" +
                  _data[index]['kode_pembelian'] +
                  ").pdf";
              anchorElement.click();
            } else {
              Get.defaultDialog(
                  title: "Payment Incomplete!",
                  content: Container(
                    child: Center(child: Text("Selesaikan Pembayaran Terlebih dahulu!")),
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
