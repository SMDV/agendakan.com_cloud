// import 'package:agendakan_2/plugins/ApiPlugin.dart';
// import 'package:agendakan_2/plugins/AuthGuard.dart';
// import 'package:agendakan_2/plugins/DataTable.dart';
// import 'package:agendakan_2/plugins/loadData.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../dashboard/widgets/top_nav.dart';

// class TicketMenu extends StatelessWidget {
//   const TicketMenu({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     LoadDataController _dataControl = Get.put(LoadDataController());
//     AuthController auth = Get.put(AuthController());
//     String local_token = "";
//     ApiPlugin _provider = ApiPlugin();
//     final data_store = GetStorage();
//     _dataControl.loadAllPembayaran();
//     if (data_store.read('token') != null) {
//       local_token = data_store.read('token');
//     }
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(45),
//         child: topNavBar(),
//       ),
//       body: Row(
//         children: [
//           // auth.obx((state) => null),
//           Container(
//             //width: 258,
//             child: Column(children: [
//               Expanded(
//                   flex: 2,
//                   child: Container(
//                     constraints: BoxConstraints(minWidth: 265),
//                     child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           SizedBox(
//                             height: 40,
//                           ),
//                           Row(
//                             children: [
//                               SizedBox(
//                                 width: 20,
//                               ),
//                               Container(
//                                 decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     color: Colors.white),
//                                 child: Container(
//                                   padding: EdgeInsets.all(5),
//                                   child: Icon(
//                                     Icons.person_rounded,
//                                     color: Colors.blue,
//                                     size: 40,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 8,
//                           ),
//                           Row(
//                             children: [
//                               SizedBox(
//                                 width: 20,
//                               ),
//                               Text(
//                                 "Welcome back,",
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           Row(
//                             children: [
//                               SizedBox(
//                                 width: 20,
//                               ),
//                               _dataControl.obx(
//                                 (state) {
//                                   return Text(
//                                     "" +
//                                         _dataControl.data['data'][0]['id_user']
//                                             .toString(),
//                                     style: TextStyle(
//                                         color: Colors.white, fontSize: 20),
//                                   );
//                                 },
//                                 onLoading: Text(
//                                   "Arnold",
//                                   style: TextStyle(
//                                       color: Colors.white, fontSize: 20),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ]),
//                     color: Colors.blue,
//                   )),
//               Expanded(
//                   flex: 5,
//                   child: Container(
//                     color: Colors.white,
//                   ))
//             ]),
//           ),
//           Expanded(
//               flex: 6,
//               child: Container(
//                   padding: EdgeInsets.fromLTRB(23, 0, 23, 30),
//                   child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           padding: EdgeInsets.fromLTRB(0, 25, 0, 41),
//                           child: Text(
//                             "Ticket List",
//                             style: TextStyle(fontSize: 24),
//                           ),
//                         ),
//                         Expanded(
//                             child: Container(
//                           color: Colors.white,
//                           child: Column(children: [
//                             Flexible(
//                                 child: Container(
//                               constraints: BoxConstraints(maxHeight: 35),
//                               child: Row(children: [
//                                 const SizedBox(
//                                   width: 51,
//                                 ),
//                                 Container(
//                                   width: 112,
//                                   alignment: Alignment.center,
//                                   child: Text("All Ticket"),
//                                   decoration: BoxDecoration(
//                                       border: Border(
//                                           bottom: BorderSide(
//                                               color: Colors.blue, width: 3))),
//                                 ),
//                               ]),
//                               //color: Colors.red,
//                             )),
//                             Expanded(
//                                 flex: 12,
//                                 child: Scaffold(
//                                     body: ChangeNotifierProvider<
//                                         DataTableProvider>(
//                                   create: (context) => DataTableProvider(),
//                                   child: Consumer<DataTableProvider>(
//                                       builder: (context, provider, child) {
//                                     if (provider.data == null) {
//                                       provider.getData(context);
//                                       return Center(
//                                         child: CircularProgressIndicator(),
//                                       );
//                                     } else if (provider.data[0]['id'] == null) {
//                                       provider.getData(context);
//                                       return Center(
//                                         child: Container(
//                                           child:
//                                               Text("Belum ada data transaksi!"),
//                                         ),
//                                       );
//                                     }
//                                     return SingleChildScrollView(
//                                       scrollDirection: Axis.horizontal,
//                                       child: SingleChildScrollView(
//                                           child: DataTable(
//                                         columnSpacing: 50,
//                                         columns: [
//                                           DataColumn(
//                                               label: Container(
//                                                   width: 160,
//                                                   child: Text("Event"))),
//                                           DataColumn(
//                                               label: Container(
//                                                   width: 160,
//                                                   child: Text("Date"))),
//                                           DataColumn(
//                                               label: Container(
//                                                   width: 160,
//                                                   child:
//                                                       Text("Jumlah Ticket"))),
//                                           DataColumn(
//                                               label: Container(
//                                                   width: 160,
//                                                   child: Text("Status"))),
//                                           DataColumn(
//                                               label: Container(
//                                                   width: 160,
//                                                   child: Text("Detail"))),
//                                         ],
//                                         rows: provider.data
//                                             .map<DataRow>((element) => DataRow(
//                                                   cells: [
//                                                     DataCell(Text("Oase")),
//                                                     DataCell(
//                                                         Text("01-07-2022")),
//                                                     DataCell(Text(
//                                                         element['jumlah_tiket']
//                                                             .toString())),
//                                                     DataCell(customDatacell(
//                                                         element['status_pembelian']
//                                                             .toString())),
//                                                     DataCell(
//                                                       Icon(Icons.edit),
//                                                       onTap: () async {
//                                                         // var data_test_api =
//                                                         //     await _provider.get5(
//                                                         //         data_store
//                                                         //             .read(
//                                                         //                 "token")
//                                                         //             .toString(),
//                                                         //         element['id']
//                                                         //             .toString());
//                                                         Get.toNamed(
//                                                             "/tickets/details",
//                                                             arguments: element[
//                                                                     'id']
//                                                                 .toString());

//                                                         // print(data_test_api
//                                                         //     .toString());
//                                                       },
//                                                     ),
//                                                   ],
//                                                 ))
//                                             .toList(),
//                                       )),
//                                     );
//                                   }),
//                                 )))
//                           ]),
//                         ))
//                       ]),
//                   color: Color(0xF6F6F6)))
//         ],
//       ),
//     );
//   }
// }

// Widget customDatacell(String status) {
//   Color customColor = Colors.white;
//   if (status == "paid") {
//     status = "Paid";
//     customColor = Color.fromARGB(255, 42, 156, 46);
//   } else if (status == "waiting-payment") {
//     status = "Pending";
//     customColor = Color(0xffFF9C1A);
//   } else if (status == "cancelled") {
//     status = "Cancelled";
//     customColor = Color.fromARGB(255, 255, 72, 26);
//   }
//   return new Container(
//     width: 70,
//     height: 35,
//     decoration: BoxDecoration(
//         color: customColor, borderRadius: BorderRadius.all(Radius.circular(5))),
//     child: Container(
//         alignment: Alignment.center,
//         padding: EdgeInsets.all(5),
//         child: Text(
//           status,
//           style: TextStyle(color: Colors.white),
//         )),
//   );
// }

import 'package:agendakan_2/plugins/ApiPlugin.dart';
import 'package:agendakan_2/plugins/DataTable.dart';
import 'package:agendakan_2/plugins/loadData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../dashboard/widgets/top_nav.dart';

class TicketMenu extends StatelessWidget {
  const TicketMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size.width;
    LoadDataController _dataControl = Get.put(LoadDataController());
    String local_token = "";
    ApiPlugin _provider = ApiPlugin();
    final data_store = GetStorage();
    if (data_store.read('token') != null) {
      local_token = data_store.read('token');
    }
    if (local_token == "") {
      return AlertDialog(
        content: Text("Login Session Ended"),
        actions: <Widget>[
          TextButton(
            child: const Text('Re-Login'),
            onPressed: () {
              Get.toNamed("/");
            },
          ),
        ],
      );
    } else {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(45),
          child: topNavBar(),
        ),
        body: Row(
          children: [
            if (screenSize >= 1200) ...[
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
            if (screenSize >= 600) ...[
              Expanded(
                  flex: 6,
                  child: Container(
                      padding: EdgeInsets.fromLTRB(23, 0, 23, 30),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 25, 0, 41),
                              child: Text(
                                "Ticket List",
                                style: TextStyle(fontSize: 24),
                              ),
                            ),
                            Expanded(
                                child: Container(
                              color: Colors.white,
                              child: Column(children: [
                                Flexible(
                                    child: Container(
                                  constraints: BoxConstraints(maxHeight: 35),
                                  child: Row(children: [
                                    const SizedBox(
                                      width: 51,
                                    ),
                                    Container(
                                      width: 112,
                                      alignment: Alignment.center,
                                      child: Text("All Ticket"),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.blue,
                                                  width: 3))),
                                    ),
                                  ]),
                                  //color: Colors.red,
                                )),
                                Expanded(
                                    flex: 12,
                                    child: Scaffold(
                                        body: ChangeNotifierProvider<
                                            DataTableProvider>(
                                      create: (context) => DataTableProvider(),
                                      child: Consumer<DataTableProvider>(
                                          builder: (context, provider, child) {
                                        if (provider.data == null) {
                                          provider.getData(context);
                                          return Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        } else if (provider.data[0]['id'] ==
                                            null) {
                                          provider.getData(context);
                                          return Center(
                                            child: Container(
                                              child: Text(
                                                  "Belum ada data transaksi!"),
                                            ),
                                          );
                                        }
                                        return SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: SingleChildScrollView(
                                              child: DataTable(
                                            columnSpacing: 50,
                                            columns: [
                                              DataColumn(
                                                  label: Container(
                                                      width: 160,
                                                      child: Text("Event"))),
                                              DataColumn(
                                                  label: Container(
                                                      width: 160,
                                                      child: Text("Date"))),
                                              DataColumn(
                                                  label: Container(
                                                      width: 160,
                                                      child: Text(
                                                          "Jumlah Ticket"))),
                                              DataColumn(
                                                  label: Container(
                                                      width: 160,
                                                      child: Text("Status"))),
                                              DataColumn(
                                                  label: Container(
                                                      width: 160,
                                                      child: Text("Detail"))),
                                            ],
                                            rows: provider.data
                                                .map<DataRow>(
                                                    (element) => DataRow(
                                                          cells: [
                                                            DataCell(Text(
                                                                "Signaturee Festival")),
                                                            DataCell(Text(element[
                                                                    'tanggal_pembelian']
                                                                .toString())),
                                                            DataCell(Text(element[
                                                                    'jumlah_tiket']
                                                                .toString())),
                                                            DataCell(customDatacell(
                                                                element['status_pembelian']
                                                                    .toString())),
                                                            DataCell(
                                                              Icon(Icons.edit),
                                                              onTap: () async {
                                                                Get.toNamed(
                                                                    "/tickets/details",
                                                                    arguments: element[
                                                                            'id']
                                                                        .toString());
                                                              },
                                                            ),
                                                          ],
                                                        ))
                                                .toList(),
                                          )),
                                        );
                                      }),
                                    )))
                              ]),
                            ))
                          ]),
                      color: Color(0xF6F6F6)))
            ] else ...[
              Expanded(
                  flex: 6,
                  child: Container(
                      padding: EdgeInsets.fromLTRB(23, 0, 23, 30),
                      child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(0, 25, 0, 41),
                                  child: Text(
                                    "Ticket List",
                                    style: TextStyle(fontSize: 24),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                                child: Container(
                              color: Colors.white,
                              child: Column(children: [
                                Flexible(
                                    child: Container(
                                  constraints: BoxConstraints(maxHeight: 35),
                                  child: Row(children: [
                                    const SizedBox(
                                      width: 51,
                                    ),
                                    Container(
                                      width: 112,
                                      alignment: Alignment.center,
                                      child: Text("All Ticket"),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.blue,
                                                  width: 3))),
                                    ),
                                  ]),
                                  //color: Colors.red,
                                )),
                                Expanded(
                                    flex: 12,
                                    child: Scaffold(
                                        body: ChangeNotifierProvider<
                                            DataTableProvider>(
                                      create: (context) => DataTableProvider(),
                                      child: Consumer<DataTableProvider>(
                                          builder: (context, provider, child) {
                                        if (provider.data == null) {
                                          provider.getData(context);
                                          return Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        } else if (provider.data[0]['id'] ==
                                            null) {
                                          provider.getData(context);
                                          return Center(
                                            child: Container(
                                              child: Text(
                                                  "Belum ada data transaksi!"),
                                            ),
                                          );
                                        }
                                        return SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: SingleChildScrollView(
                                              child: DataTable(
                                            showCheckboxColumn: false,
                                            columnSpacing: 50,
                                            columns: [
                                              DataColumn(
                                                  label: Container(
                                                      width: 50,
                                                      child: Text("Event"))),
                                              DataColumn(
                                                  label: Container(
                                                      width: 50,
                                                      child: Text("Date"))),
                                              DataColumn(
                                                  label: Container(
                                                      width: 50,
                                                      child: Text("Status"))),
                                            ],
                                            rows: provider.data
                                                .map<DataRow>((element) =>
                                                    DataRow(
                                                      onSelectChanged: (value) {
                                                        Get.toNamed(
                                                            "/tickets/details",
                                                            arguments: element[
                                                                    'id']
                                                                .toString());
                                                      },
                                                      cells: [
                                                        DataCell(Text(
                                                            "Signaturee Festival")),
                                                        DataCell(Text(element[
                                                                'tanggal_pembelian']
                                                            .toString())),
                                                        DataCell(customDatacell(
                                                            element['status_pembelian']
                                                                .toString())),
                                                        // DataCell(
                                                        //   Icon(Icons.edit),
                                                        //   onTap: () async {
                                                        //     Get.toNamed(
                                                        //         "/tickets/details",
                                                        //         arguments: element[
                                                        //                 'id']
                                                        //             .toString());
                                                        //   },
                                                        // ),
                                                      ],
                                                    ))
                                                .toList(),
                                          )),
                                        );
                                      }),
                                    )))
                              ]),
                            ))
                          ]),
                      color: Color(0xF6F6F6)))
            ]
          ],
        ),
      );
    }
  }
}

Widget customDatacell(String status) {
  Color customColor = Colors.white;
  if (status == "paid") {
    status = "Approving";
    customColor = Color.fromARGB(255, 114, 223, 231);
  } else if (status == "approved") {
    status = "Approved";
    customColor = Color.fromARGB(255, 26, 255, 37);
  } else if (status == "waiting-payment") {
    status = "Pending";
    customColor = Color(0xffFF9C1A);
  } else if (status == "cancelled") {
    status = "Cancel";
    customColor = Color.fromARGB(255, 250, 48, 48);
  }
  return new Container(
    width: 75,
    height: 35,
    decoration: BoxDecoration(
        color: customColor, borderRadius: BorderRadius.all(Radius.circular(5))),
    child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(5),
        child: Text(
          status,
          style: TextStyle(color: Colors.white),
        )),
  );
}
