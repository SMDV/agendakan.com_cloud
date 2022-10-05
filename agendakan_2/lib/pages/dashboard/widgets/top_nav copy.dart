import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class topNavBarMercu extends StatelessWidget {
  const topNavBarMercu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size.width;
    //print(Get.arguments);
    final data_store = GetStorage();
    String local_token = "";
    if (data_store.read('token') != null) {
      local_token = data_store.read('token');
    }
    //print("my token : " + local_token);
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: Row(children: [
        //Padding(padding: EdgeInsets.only(left: 16)),

        // SizedBox(
        //   width: 5,
        // ),
        InkWell(
          child: Row(children: [
            Image(
              fit: BoxFit.contain,
              image: AssetImage('images/icon-01.png'),
              height: 60,
            ),
            if (screenSize >= 600) ...[
              Text(
                "agendakan.com",
                style: TextStyle(color: Colors.black),
              ),
            ],
          ]),
          onTap: () {
            Get.offAllNamed("/mercusuara");
          },
        ),

        Spacer(),
        if (local_token == "") ...[
          OutlinedButton(
            onPressed: () {
              Get.toNamed('/loginpage');
            },
            child: Text(
              "  Login  ",
            ),
            style: OutlinedButton.styleFrom(
                side: BorderSide(width: 2, color: Colors.blue)),
          ),
          SizedBox(
            width: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Get.toNamed('/register');
            },
            child: Text("Register"),
          ),
        ] else ...[
          if (data_store.read("isAdmin") == 1) ...[
            OutlinedButton(
              onPressed: () {
                Get.offAndToNamed('/mercusuara/ticketlistAdmin');
              },
              child: Text(
                "Ticket Admin",
              ),
              style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 2, color: Colors.blue)),
            ),
          ] else ...[
            OutlinedButton(
              onPressed: () {
                Get.offAndToNamed('/mercusuara/ticketlist');
              },
              child: Text(
                "Ticket List",
              ),
              style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 2, color: Colors.blue)),
            ),
          ],
          SizedBox(
            width: 30,
          ),
          ElevatedButton(
            onPressed: () {
              data_store.remove('token');
              data_store.remove('isAdmin');
              Get.offAndToNamed('/mercusuara');
            },
            child: Text("   Logout   "),
          ),
        ],
      ]),
    );
  }
}
