import 'package:agendakan_mobile/BarcodeScannerWithoutController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(65, 129, 237, 1),
      body: Center(
          child: Column(
        children: [
          Spacer(),
          Text('MENU',
              style: TextStyle(
                  fontFamily: 'QuickSand',
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.w700)),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () {
                    Get.toNamed("/scan-qr");
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset('assets/icons_01.jpg', scale: 2.7),
                  )),
              SizedBox(
                width: 40,
              ),
              InkWell(
                  child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset('assets/icons_02.jpg', scale: 2.7),
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
      )),
      //appBar: AppBar(title: const Text('Agendakan Scanner Prototype')),
      // body: Container(
      //   // padding: EdgeInsets.only(top: ),
      //   width: MediaQuery.of(context).size.width,
      //   // height: MediaQuery.of(context).size.height,
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       ElevatedButton(
      //         onPressed: () {
      //           Get.toNamed("/tiket-list");
      //         },
      //         child: const Text('List Ticket'),
      //       ),
      //       ElevatedButton(
      //         onPressed: () {
      //           Get.toNamed("/scan-qr");
      //         },
      //         child: const Text('Scan QR'),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
