// import 'package:agendakan_2/plugins/ApiPlugin.dart';
import 'package:agendakan_mobile/plugin/ApiPlugin.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class TicketListNew extends StatefulWidget {
  const TicketListNew({Key? key}) : super(key: key);

  @override
  State<TicketListNew> createState() => _TicketListNewState();
}

class _TicketListNewState extends State<TicketListNew> {
  // ApiPlugin _provider = ApiPlugin();
  GetDataController _dataControll = Get.put(GetDataController());
  String keyword = "";
  final searchName = TextEditingController();

  // List<dynamic> _dataTamu = [];
  // getData() async {
  //   var data = await _provider.post7("");
  //   _dataTamu = data;
  // }

  @override
  Widget build(BuildContext context) {
    _dataControll.loadData(keyword);
    return _dataControll.obx(
        (state) => Scaffold(
              body: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      PaginatedDataTable(
                        columns: [
                          DataColumn(label: Text("No")),
                          DataColumn(label: Text("Name")),
                          // DataColumn(label: Text("Ticket")),
                          // DataColumn(label: Text("Status")),
                          // DataColumn(label: Text("Time")),
                          DataColumn(label: Text("Details")),
                        ],
                        source: MyData(dataSource: _dataControll._data),
                        header: Row(children: [
                          Text("Buku Tamu"),
                          // Spacer(),
                          // InkWell(
                          //   child: Text("Tamu Hadir"),
                          //   onTap: () {
                          //     _dataControll.loadDataKategori(keyword);
                          //   },
                          // ),
                          // Spacer(),
                          SizedBox(
                            width: 15,
                          ),
                          Flexible(
                            child: Container(
                              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                              child: Row(
                                children: [
                                  Flexible(
                                    child: TextField(
                                      controller: searchName,
                                    ),
                                  ),
                                  // Spacer(),
                                  ElevatedButton(
                                      onPressed: () {
                                        _dataControll.loadData(searchName.text);
                                      },
                                      child: Text("Search"))
                                ],
                              ),
                              decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
                            ),
                          ),
                          // Spacer()
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
        onEmpty: Center(
          child: Column(children: [
            Text("No Data!"),
            ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: Icon(FontAwesomeIcons.rotate))
          ]),
        ));
  }
}

class GetDataController extends GetxController with StateMixin {
  List<dynamic> _data = [].obs;
  ApiPlugin _provider = ApiPlugin();
  void loadData(String keyword) async {
    change(null, status: RxStatus.loading());
    var apiData = await _provider.post7(keyword);
    if (apiData["data"] == null) {
      change(null, status: RxStatus.empty());
    } else {
      _data = apiData["data"];
      change(null, status: RxStatus.success());
    }
  }

  void loadDataKategori(String keyword) async {
    change(null, status: RxStatus.loading());
    var apiData = await _provider.get10("hadir");
    if (apiData["data"] == null) {
      change(null, status: RxStatus.empty());
    } else {
      _data = apiData["data"];
      change(null, status: RxStatus.success());
    }
  }
}

class MyData extends DataTableSource {
  MyData({
    required List<dynamic> dataSource,
  })  : _data = dataSource,
        assert(dataSource != null);

  final List<dynamic> _data;
  @override
  DataRow getRow(int index) {
    // TODO: implement getRow

    return DataRow(cells: [
      DataCell(Text((index + 1).toString())),
      DataCell(Text(_data[index]['nama_tiket'].toString())),
      // DataCell(Text(_data[index]['jenis_tiket'].toString())),
      // DataCell(Text(_data[index]['status_kehadiran'].toString())),
      // DataCell(Text(_data[index]['tanggal_kehadiran'].toString())),
      DataCell(ElevatedButton(
        onPressed: () {
          Get.defaultDialog(
              title: "Detail Tiket",
              content: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("ID", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Text(_data[index]['id'].toString()),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Nama", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Text(_data[index]['nama_tiket'].toString()),
                  SizedBox(
                    height: 10,
                  ),
                  // Text("KTP", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  // Text(_data[index]['nomor_ktp'].toString()),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  Text("Jenis Tiket", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Text(_data[index]['jenis_tiket'].toString().toUpperCase()),
                  SizedBox(
                    height: 10,
                  ),
                  // Text("Addons Tiket", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  // Text((_data[index]['addons'] == "1") ? "Yes" : "No"),
                  // if (_data[index]['jenis_kupon'] != null && _data[index]['jenis_kupon'] == "spesial") ...[
                  //   Text("Berlaku untuk 1 Orang"),
                  // ] else if (_data[index]['addons'] == "1") ...[
                  //   Text("Berlaku untuk 3 Orang")
                  // ] else ...[
                  //   Text("Berlaku untuk 2 Orang")
                  // ],
                  SizedBox(
                    height: 10,
                  ),

                  Text("Status Kehadiran", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Text(_data[index]['status_kehadiran'].toString().toUpperCase()),
                  SizedBox(
                    height: 10,
                  ),
                  if (_data[index]['status_kehadiran'] == "tidak-hadir") ...[
                    SizedBox(
                      height: 20,
                    ),
                    Text("Approve Kehadiran ? ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Spacer(),
                        ElevatedButton(
                            onPressed: () async {
                              ApiPlugin _provider = ApiPlugin();
                              await _provider.post8(_data[index]["id"].toString(), "hadir");
                            },
                            child: Icon(
                              FontAwesomeIcons.check,
                              size: 15,
                            )),
                        Spacer(),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ] else ...[
                    Text("Waktu Kehadiran", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                    Text(_data[index]['tanggal_kehadiran'].toString()),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                  // Text("Jenis Tiket"),
                  // Text(_data[index]['jenis_tiket'].toString()),
                  // SizedBox(
                  //   height: 10,
                  // ),
                ],
              ));
        },
        child: Icon(
          FontAwesomeIcons.magnifyingGlass,
          size: 15,
        ),
      )),
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
