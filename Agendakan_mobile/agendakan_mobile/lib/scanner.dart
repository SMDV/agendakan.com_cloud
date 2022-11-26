import 'package:agendakan_mobile/plugin/ApiPlugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ScannerPage extends StatefulWidget {
  @override
  _ScannerPageState createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  String namaTamu = 'nama tamu';
  String noktp = 'email';
  String idtiket = 'id tiket';
  String jenistiket = 'jenis tiket';
  String addons = "";
  String jenistiketSpesial = '';
  String status = '?';
  String waktu = '';
  String barcode = 'Unknown';
  //Map<String, dynamic> _dataTamu = new Map();

  var scanned = false;
  ApiPlugin _provider = ApiPlugin();

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Color.fromRGBO(65, 129, 237, 1),
        // appBar: AppBar(
        //   backgroundColor: Color.fromRGBO(65, 129, 237, 1),
        //   elevation: 0,
        //   leading: new Container(),
        //   actions: [
        //     IconButton(
        //       icon: Icon(
        //         Icons.menu,
        //         size: 35,
        //       ),
        //       color: Color.fromRGBO(255, 156, 26, 1),
        //       onPressed: () {},
        //     ),
        //   ],
        // ),
        body: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Spacer(),
              Text('SELAMAT',
                  style: TextStyle(
                      fontFamily: 'QuickSand',
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              Text('DATANG!',
                  style: TextStyle(
                      fontFamily: 'QuickSand',
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 110,
              ),
              Text('($namaTamu)',
                  style: TextStyle(
                      fontFamily: 'QuickSand',
                      fontSize: 25,
                      color: Color.fromRGBO(255, 156, 26, 1),
                      fontWeight: FontWeight.bold)),
              Text('($noktp)',
                  style: TextStyle(
                      fontFamily: 'QuickSand',
                      fontSize: 25,
                      color: Color.fromRGBO(255, 156, 26, 1),
                      fontWeight: FontWeight.bold)),
              Text('($idtiket)',
                  style: TextStyle(
                      fontFamily: 'QuickSand',
                      fontSize: 25,
                      color: Color.fromRGBO(255, 156, 26, 1),
                      fontWeight: FontWeight.bold)),
              Text('($jenistiket)',
                  style: TextStyle(
                      fontFamily: 'QuickSand',
                      fontSize: 30,
                      color: Color.fromRGBO(255, 156, 26, 1),
                      fontWeight: FontWeight.bold)),
              if (addons != "non-addons") ...[
                Text('($addons)',
                    style: TextStyle(
                        fontFamily: 'QuickSand',
                        fontSize: 30,
                        color: Color.fromRGBO(255, 156, 26, 1),
                        fontWeight: FontWeight.bold)),
              ],
              Text('($jenistiketSpesial)',
                  style: TextStyle(
                      fontFamily: 'QuickSand',
                      fontSize: 30,
                      color: Color.fromRGBO(255, 156, 26, 1),
                      fontWeight: FontWeight.bold)),
              Text('status kehadiran:',
                  style: TextStyle(
                      fontFamily: 'QuickSand',
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              Text('($status)',
                  style: TextStyle(
                      fontFamily: 'QuickSand',
                      fontSize: 30,
                      color: Color.fromRGBO(255, 156, 26, 1),
                      fontWeight: FontWeight.bold)),
              if (status == "hadir") ...[
                Text('($waktu)',
                    style: TextStyle(
                        fontFamily: 'QuickSand',
                        fontSize: 25,
                        color: Color.fromRGBO(255, 156, 26, 1),
                        fontWeight: FontWeight.bold)),
              ] else if (status == "tidak-hadir") ...[
                SizedBox(
                  height: 30,
                ),
                Text('Approve Ticket :',
                    style: TextStyle(
                        fontFamily: 'QuickSand',
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: InkWell(
                          onTap: () {
                            Get.defaultDialog(
                                title: "Apakah data sudah sesuai ?",
                                content: Column(
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        await _provider.post8(idtiket, "hadir");
                                      },
                                      child: Icon(
                                        FontAwesomeIcons.check,
                                        size: 45,
                                        color: Colors.green,
                                      ),
                                    )
                                  ],
                                ));
                          },
                          child: Icon(
                            FontAwesomeIcons.check,
                            size: 45,
                            color: Colors.orange,
                          ))),
                )
              ],
              SizedBox(height: 65),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        Get.offAllNamed("/home");
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset('assets/icons_03.jpg', scale: 3.8),
                      )),
                  SizedBox(
                    width: 25,
                  ),
                  InkWell(
                      onTap: scanBarcode,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset('assets/icons_04.jpg', scale: 3.8),
                      )),
                ],
              ),
              Spacer(),
              Align(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset('assets/logo_panjang_1.png', scale: 8),
                ),
              ),
              SizedBox(
                height: 25,
              )
            ],
          ),
        ),
      );

  Future<void> scanBarcode() async {
    try {
      final barcode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.BARCODE,
      );

      if (!mounted) return;
      if (barcode.isNotEmpty) {
        var _dataTamu = await _provider
            .get("https://GKM.agendakan.com/api/tiket-scan-mobile/" + barcode);
        print(_dataTamu);
        if (_dataTamu == null || _dataTamu == []) {
          if (_dataTamu["data"] == null || _dataTamu["data"] == []) {
            Get.defaultDialog(content: Text("Data tidak ditemukan!"));
            return;
          }
        }
        // print(_dataTamu);
        // return;
        namaTamu = _dataTamu["data"][0]['nama_tiket'];
        noktp = _dataTamu["data"][0]['email'];
        idtiket = _dataTamu["data"][0]['id'].toString();
        if (_dataTamu["data"][0]["jenis_kupon"] != null &&
            _dataTamu["data"][0]["jenis_kupon"] == "spesial") {
          jenistiketSpesial = "Berlaku untuk 1 Orang";
          addons = "non-addons";
        } else if (_dataTamu["data"][0]["addons"] == "1") {
          jenistiketSpesial = "Berlaku untuk 3 Orang";
          addons = "+addons";
        } else {
          addons = "non-addons";
          jenistiketSpesial = "Berlaku untuk 2 Orang";
        }
        jenistiket = _dataTamu["data"][0]['jenis_tiket'];
        status = _dataTamu["data"][0]['status_kehadiran'].toString();
        waktu = _dataTamu["data"][0]['tanggal_kehadiran'].toString();
        scanned = true;
      }
      setState(() {
        this.barcode = barcode;
      });
    } on PlatformException {
      barcode = 'Failed to get platform version.';
    }
  }
}
