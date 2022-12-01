import 'package:agendakan_mobile/plugin/ApiPlugin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

class DataTableProvider extends ChangeNotifier {
  var data = null;
  ApiPlugin _provider = ApiPlugin();

  Future getData(context) async {
    // You can call an API to get data, once we've the data from API or any other flow... Following part would always be the same.
    // We forgot about one more important part .. lets do that first

    // We need access to BuildContext for loading this string and it's not recommended to store this context in any variable here
    // in change notifier..
    // final prefs = await SharedPreferences.getInstance();
    // var token = await prefs.getString('token');
    final data_store = GetStorage();
    // var token = data_store.read('token');
    data = await _provider.get3();
    if (data != null) {
      if (data['tiket'] != null) {
        data = data['tiket'];
        this.notifyListeners();
      } else {
        print("data kosong");
        // Get.defaultDialog(content: Text("Data Kosong! Lakukan Pembelian!"))
        //     .then((value) => Get.offAllNamed("/SignatureeFestival/tickets"));
      }
    }
    print(data);
  }
}

class TicketList extends StatelessWidget {
  const TicketList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ticket List")),
      body: Container(
          color: Colors.white,
          child: ChangeNotifierProvider<DataTableProvider>(
            create: (context) => DataTableProvider(),
            child: Consumer<DataTableProvider>(builder: (context, provider, child) {
              if (provider.data == null) {
                provider.getData(context);
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
              // return SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: DataTable(
              //     columnSpacing: 50,
              //     columns: [
              //       DataColumn(
              //           label: Container(
              //               // width: MediaQuery.of(context).size.width / 6,
              //               child: Text("ID Ticket"))),
              //       DataColumn(
              //           label: Container(
              //               // width: MediaQuery.of(context).size.width / 6,
              //               child: Text("ID Pembelian"))),
              //       DataColumn(
              //           label: Container(
              //               // width: MediaQuery.of(context).size.width / 6,
              //               child: Text("Tgl Kehadiran"))),
              //       DataColumn(
              //           label: Container(
              //               // width: MediaQuery.of(context).size.width / 6,
              //               child: Text("Status"))),
              //     ],
              //     rows: provider.data
              //         .map<DataRow>((element) => DataRow(
              //               cells: [
              //                 DataCell(Text(element['id'].toString())),
              //                 DataCell(
              //                     Text(element['id_pembelian'].toString())),
              //                 DataCell(Text(
              //                     element['tanggal_kehadiran'].toString())),
              //                 DataCell(
              //                     Text(element['status_kehadiran'].toString())),
              //                 // DataCell(customDatacell(
              //                 //     element['status_pembelian'].toString())),
              //               ],
              //             ))
              //         .toList(),
              //   ),
              // );
            }),
          )),
    );
  }
}
