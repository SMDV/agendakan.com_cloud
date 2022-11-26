import 'package:agendakan_mobile/plugin/ApiPlugin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class BarcodeScannerWithoutController extends StatefulWidget {
  const BarcodeScannerWithoutController({Key? key}) : super(key: key);

  @override
  _BarcodeScannerWithoutControllerState createState() =>
      _BarcodeScannerWithoutControllerState();
}

class _BarcodeScannerWithoutControllerState
    extends State<BarcodeScannerWithoutController>
    with SingleTickerProviderStateMixin {
  String? barcode;
  String scanStatus = "Scan Barcode!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Builder(
        builder: (context) {
          return Column(
            children: [
              Spacer(),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                child: MobileScanner(
                  fit: BoxFit.contain,
                  // allowDuplicates: false,
                  onDetect: (barcode, args) {
                    setState(() {
                      this.barcode = barcode.rawValue;
                      this.scanStatus = "Qr Scanned";
                    });
                  },
                ),
              ),
              Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  // height: 100,
                  color: Colors.white.withOpacity(0.4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width - 120,
                          height: 30,
                          child: FittedBox(
                            child: Text(
                              scanStatus,
                              overflow: TextOverflow.fade,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              if (scanStatus == "Qr Scanned") ...[
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    // height: 200,
                    color: Colors.black.withOpacity(0.4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(
                          child: ElevatedButton(
                            child: Text("Check Ticket Data"),
                            onPressed: () async {
                              ApiPlugin _provider = new ApiPlugin();
                              print(barcode.toString());
                              var data =
                                  await _provider.get(barcode.toString());
                              Get.defaultDialog(
                                  content: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(data['tiket']['id_pembelian']
                                          .toString())
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(data['tiket']['jenis_tiket']
                                          .toString())
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(data['tiket']['nama_tiket']
                                          .toString())
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(data['tiket']['harga_tiket']
                                          .toString())
                                    ],
                                  ),
                                  ElevatedButton(
                                      onPressed: () async {
                                        ApiPlugin _provider = new ApiPlugin();
                                        _provider.post(barcode.toString());
                                        Get.offAllNamed("/home");
                                      },
                                      child: Text("Approve"))
                                ],
                              ));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
              Spacer(),
            ],
          );
        },
      ),
    );
  }
}
