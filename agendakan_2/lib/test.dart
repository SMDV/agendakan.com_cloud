import 'dart:html';
import 'dart:typed_data';

import 'package:agendakan_2/plugins/ApiPlugin.dart';
import 'package:agendakan_2/plugins/Api_Image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
//import 'package:login_ui/login_screen.dart';

class testingPage extends StatefulWidget {
  const testingPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<testingPage> createState() => _TestingPageTest();
}

class _TestingPageTest extends State<testingPage> {
  final _formKey = GlobalKey<FormState>();
  var rememberValue = false;
  ApiPlugin _provider = ApiPlugin();
  String token_local = "";
  void testGetAPI() async {
    final prefs = await SharedPreferences.getInstance();
    var token = await prefs.getString('token');
    //var data = await _provider.get(token.toString());
    token_local = token.toString();
    //print(data);
  }

  @override
  Widget build(BuildContext context) {
    testGetAPI();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () async {
                  var hasil = await _provider.get3(token_local);
                  print(hasil);
                },
                child: Text("Hit Ticket Admin")),
            ElevatedButton(
                onPressed: () async {
                  var hasil = await _provider.get2(token_local);
                  print(hasil);
                },
                child: Text("Hit Ticket User")),
            ElevatedButton(
                onPressed: () async {
                  var hasil = await _provider.get4(token_local);
                  print(hasil);
                },
                child: Text("Hit all ticket yg belum di approve")),
            ElevatedButton(
                onPressed: () {}, child: Text("Hit Ticket Detail Acara")),
            ElevatedButton(
                onPressed: () async {
                  // var hasil = await _provider.post4(token_local);
                  // print(hasil);
                },
                child: Text("Hit Ticket Beli Ticket")),
            ElevatedButton(onPressed: () {}, child: Text("Hit Ticket Upload")),
            ElevatedButton(
                onPressed: () async {
                  // var hasil = await _provider.post5(token_local);
                  // print(hasil);
                },
                child: Text("Hit Ticket Verif Ticket")),
            ElevatedButton(
                onPressed: () async {
                  // Api_Image _uploadImage = new Api_Image();
                  // final file =
                  //     await ImagePicker().getImage(source: ImageSource.gallery);
                  // if (file != null) {
                  //   String filepath = file.path;
                  //   Uint8List imageBytes = await file.readAsBytes();
                  //   var res = await _uploadImage.uploadImage(
                  //       token_local, filepath, imageBytes);
                  // } else {
                  //   print('No image selected.');
                  // }
                  // setState(() {
                  //   // state = res;
                  //   // print(res);
                  // });
                },
                child: Text("Upload foto")),
          ],
        ),
      ),
    );
  }
}
