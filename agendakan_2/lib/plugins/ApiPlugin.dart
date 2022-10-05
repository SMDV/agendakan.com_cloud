import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'dart:html' as html;

import 'package:image_picker/image_picker.dart';

class ApiPlugin {
  //final String _baseUrl = "http://103.121.17.201:8000";
  final String _baseUrl = "https://backend.agendakan.com";
  var data_store = GetStorage();

  Future<dynamic> get(String token) async {
    var responseJson;
    try {
      var url_uri = Uri.parse(_baseUrl + "/api/users");
      //final response = await http.post(url_uri);
      final response = await http.get(
        url_uri,
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
          "Authorization": "Bearer " + token,
        },
      );
      //final response = await http.get(url_uri);
      responseJson = _response(response);
    } on SocketException {
      //throw Exception();
    }
    return responseJson;
  }

  Future<dynamic> post(String email, String password) async {
    var responseJson;
    try {
      var url_uri = Uri.parse(_baseUrl + "/api/login");

      final response = await http.post(
        url_uri,
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
        },
        body:
            jsonEncode(<String, String>{"email": email, "password": password}),
      );
      //final response = await http.get(url_uri);
      responseJson = _response(response);
      //responseJson = response;
    } on SocketException {
      throw Exception();
    }
    if (responseJson != null) {
      data_store.write("token", responseJson['token']);
      data_store.write("isAdmin", responseJson['isAdmin']);
      data_store.write("nama_user", responseJson['nama_user']);
      if (responseJson['isAdmin'] == 1) {
        Get.toNamed('/ticketlistAdmin', arguments: responseJson['token']);
      } else {
        Get.toNamed('/oasesignature', arguments: responseJson['token']);
      }
    } else {
      print("Login Failed!");
    }
    return responseJson;
  }

  //put
  Future<dynamic> post2(String email, String name, String pass) async {
    var responseJson;
    try {
      var url_uri = Uri.parse(_baseUrl + "/api/register");

      final response = await http.post(
        url_uri,
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
        },
        body: jsonEncode(<String, String>{
          "email": email,
          "name": name,
          "password": pass,
        }),
      );
      //final response = await http.get(url_uri);
      responseJson = _response(response);
    } on SocketException {
      throw Exception();
    }
    return responseJson;
  }

  Future<dynamic> post3(String email, String name, String pass) async {
    var responseJson;
    try {
      var url_uri = Uri.parse(_baseUrl + "/api/register");

      final response = await http.put(
        url_uri,
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
          //"Authorization": "Bearer " + token,
        },
        body: jsonEncode(<String, dynamic>{
          "title": "test",
          "author_id": 1,
          "content": "test_content"
        }),
      );
      //final response = await http.get(url_uri);
      responseJson = _response(response);
    } on SocketException {
      throw Exception();
    }
    return responseJson;
  }

  Future<dynamic> post4(
      String token, List<Map<String, Object>> data_send) async {
    var responseJson;
    //const test = data_send;
    String jsonString = jsonEncode(data_send);
    print(jsonString);
    try {
      var url_uri = Uri.parse(_baseUrl + "/api/pembelian");

      final response = await http.post(
        url_uri,
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
          "Authorization": "Bearer " + token,
        },
        body: jsonString,
      );
      //final response = await http.get(url_uri);
      responseJson = _response(response);
    } on SocketException {
      // throw Exception();
      print(e);
    }
    return responseJson;
  }

  // Future<dynamic> post5(String token, String filename) async {
  //   var responseJson;
  //   try {
  //     PickedFile imagefile = PickedFile(filename);
  //     var url_uri = Uri.parse(_baseUrl + "/api/upload-bukti/1");
  //     var request = http.MultipartRequest('POST', url_uri);
  //     request.headers.addAll(<String, String>{
  //       "Content-Type": "application/json; charset=UTF-8",
  //       "Authorization": "Bearer " + token,
  //     });
  //     request.files.add(await http.MultipartFile.fromPath('picture', filename));
  //     var res = await request.send();
  //     responseJson = res;
  //   } on SocketException {
  //     throw Exception();
  //   }
  //   return responseJson;
  // }

  Future<dynamic> get2(String token) async {
    var responseJson;
    const test = "";
    String jsonString = jsonEncode(test);
    print(jsonString);
    try {
      var url_uri = Uri.parse(_baseUrl + "/api/list-tiket");

      final response = await http.get(
        url_uri,
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
          "Authorization": "Bearer " + token,
        },
      );
      //final response = await http.get(url_uri);
      responseJson = _response(response);
    } on SocketException {
      throw Exception();
    }
    return responseJson;
  }

  Future<dynamic> get3(String token) async {
    var responseJson;
    const test = "";
    String jsonString = jsonEncode(test);
    print(jsonString);
    try {
      var url_uri = Uri.parse(_baseUrl + "/api/all-pembelian"); // ->

      final response = await http.get(
        url_uri,
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
          "Authorization": "Bearer " + token,
        },
      );
      //final response = await http.get(url_uri);
      responseJson = _response(response);
    } on SocketException {
      throw Exception();
    }
    return responseJson;
  }

  Future<dynamic> get4(String token) async {
    var responseJson;
    const test = "";
    String jsonString = jsonEncode(test);
    print(jsonString);
    try {
      var url_uri = Uri.parse(_baseUrl + "/api/pembelian-approve");

      final response = await http.get(
        url_uri,
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
          "Authorization": "Bearer " + token,
        },
      );
      //final response = await http.get(url_uri);
      responseJson = _response(response);
    } on SocketException {
      throw Exception();
    }
    return responseJson;
  }

  Future<dynamic> get5(String token, String id) async {
    var responseJson;
    const test = "";
    String jsonString = jsonEncode(test);
    print(jsonString);
    try {
      var url_uri = Uri.parse(_baseUrl + "/api/single-pembelian/" + id);
      //print("URL REQUEST = " + url_uri.toString());

      final response = await http.get(
        url_uri,
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
          "Authorization": "Bearer " + token,
        },
      );
      //final response = await http.get(url_uri);
      responseJson = _response(response);
    } on SocketException {
      print("ambil data single pembelian error");
      //throw Exception();
    }
    return responseJson;
  }

  Future<dynamic> get6(String token, String id) async {
    var responseJson;
    const test = "";
    String jsonString = jsonEncode(test);
    print(jsonString);
    try {
      var url_uri = Uri.parse(_baseUrl + "/api/download-tiket/" + id);

      final response = await http.get(
        url_uri,
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
          "Authorization": "Bearer " + token,
        },
      );
      //final response = await http.get(url_uri);
      responseJson = _response(response);
    } on SocketException {
      //throw Exception();
    }
    html.AnchorElement anchorElement =
        new html.AnchorElement(href: responseJson['']);
    return responseJson;
  }

  Future<dynamic> get7() async {
    var responseJson;
    const test = "";
    String jsonString = jsonEncode(test);
    print(jsonString);
    try {
      var url_uri = Uri.parse(_baseUrl + "/api/get-jumlah-tiket-terjual");

      final response = await http.get(
        url_uri,
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
          // "Authorization": "Bearer " + token,
        },
      );
      //final response = await http.get(url_uri);
      responseJson = _response(response);
    } on SocketException {
      //throw Exception();
    }
    html.AnchorElement anchorElement =
        new html.AnchorElement(href: responseJson['']);
    return responseJson;
  }

  Future<dynamic> get8(String kode_kupon) async {
    var responseJson;
    // const test = "";
    // String jsonString = jsonEncode(test);
    // print(jsonString);
    Get.defaultDialog(title: "", content: CircularProgressIndicator());
    try {
      var url_uri = Uri.parse(_baseUrl + "/api/cek-kupon/" + kode_kupon);
      final _dataStore = GetStorage();
      // if (_dataStore.read("token") == "") {
      //   Get.back();
      // }
      final response = await http.get(
        url_uri,
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
          "Authorization": "Bearer " + _dataStore.read("token"),
        },
      );
      //final response = await http.get(url_uri);
      responseJson = _response(response);
    } on SocketException {
      Get.back();
      //throw Exception();
    }
    Get.back();
    // html.AnchorElement anchorElement =
    //     new html.AnchorElement(href: responseJson['']);
    return responseJson;
  }

  Future<dynamic> get9(String kode_kupon) async {
    var responseJson;
    // const test = "";
    // String jsonString = jsonEncode(test);
    // print(jsonString);
    Get.defaultDialog(title: "", content: CircularProgressIndicator());
    try {
      var url_uri =
          Uri.parse(_baseUrl + "/api/cek-kupon-register/" + kode_kupon);

      final response = await http.get(
        url_uri,
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
          // "Authorization": "Bearer " + token,
        },
      );
      //final response = await http.get(url_uri);
      responseJson = _response(response);
    } on SocketException {
      Get.back();
      //throw Exception();
    }
    Get.back();
    // html.AnchorElement anchorElement =
    //     new html.AnchorElement(href: responseJson['']);
    return responseJson;
  }

  Future<dynamic> get10(String keyword) async {
    var responseJson;
    try {
      var url_uri = Uri.parse(_baseUrl + "/api/tiket-" + keyword + "-mobile");

      final response = await http.get(
        url_uri,
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
          // "Authorization": "Bearer " + token,
        },
      );
      //final response = await http.get(url_uri);
      responseJson = _response(response);
    } on SocketException {
      //throw Exception();
    }
    // html.AnchorElement anchorElement =
    //     new html.AnchorElement(href: responseJson['']);
    return responseJson;
  }

  // Future<dynamic> get7(String token, String id) async {
  //   var responseJson;
  //   const test = "";
  //   String jsonString = jsonEncode(test);
  //   print(jsonString);
  //   try {
  //     var url_uri = Uri.parse(_baseUrl + "/api/timer/" + id);

  //     final response = await http.get(
  //       url_uri,
  //       headers: <String, String>{
  //         "Content-Type": "application/json; charset=UTF-8",
  //         "Authorization": "Bearer " + token,
  //       },
  //     );
  //     //final response = await http.get(url_uri);
  //     responseJson = _response(response);
  //   } on SocketException {
  //     //throw Exception();
  //   }
  //   html.AnchorElement anchorElement =
  //       new html.AnchorElement(href: responseJson['']);
  //   return responseJson;
  // }

  Future<dynamic> post5(String token, int id) async {
    var responseJson;
    try {
      var url_uri = Uri.parse(_baseUrl + "/api/pembelian-approve-process");

      final response = await http.post(
        url_uri,
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
          "Authorization": "Bearer " + token,
        },
        body: jsonEncode(
            <String, dynamic>{"id_pembelian": id, "jenis": "approve"}),
      );
      //final response = await http.get(url_uri);
      responseJson = _response(response);
    } on SocketException {
      //throw Exception("Error 401");
    }
    //print(responseJson);
    return responseJson;
  }

  Future<dynamic> post6(String token, int id) async {
    var responseJson;
    // var test = [
    //   {"id_pembelian": id},
    //   {"jenis": "cancelled"}
    // ];
    // String jsonString = jsonEncode(test);
    // print(jsonString);
    try {
      var url_uri = Uri.parse(_baseUrl + "/api/pembelian-approve-process");

      final response = await http.post(
        url_uri,
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
          "Authorization": "Bearer " + token,
        },
        body: jsonEncode(
            <String, dynamic>{"id_pembelian": id, "jenis": "cancelled"}),
      );
      //final response = await http.get(url_uri);
      responseJson = _response(response);
    } on SocketException {
      //throw Exception("Error 401");
    }
    //print(responseJson);
    return responseJson;
  }

  Future<dynamic> post7(String text) async {
    var responseJson;
    try {
      var url_uri = Uri.parse(_baseUrl + "/api/tiket-search-mobile");

      final response = await http.post(
        url_uri,
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
          // "Authorization": "Bearer " + token,
        },
        body: jsonEncode(<String, dynamic>{"keyword": text}),
      );
      //final response = await http.get(url_uri);
      responseJson = _response(response);
    } on SocketException {
      //throw Exception("Error 401");
    }
    //print(responseJson);
    return responseJson;
  }

  Future<dynamic> post8(String id, String jenis) async {
    var responseJson;
    try {
      var url_uri = Uri.parse(_baseUrl + "/api/tiket-acc-mobile");
      Get.back();
      Get.defaultDialog(
          title: "Mohon Menunggu", content: CircularProgressIndicator());
      final response = await http.post(
        url_uri,
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
          // "Authorization": "Bearer " + token,
        },
        body: jsonEncode(<String, dynamic>{"id_tiket": id, "jenis": jenis}),
      );
      //final response = await http.get(url_uri);
      responseJson = _response(response);
      if (responseJson['success']) {
        Get.back();
        Get.defaultDialog(
                title: "Success", content: Text("Status berhasil diubah!"))
            .then((value) {
          if (jenis == "hadir") {
            Get.offAllNamed("/signature/OTS/bukutamu");
          } else if (jenis == "foto") {
            Get.offAllNamed("/signature/OTS/photobooth");
          } else if (jenis == "merch") {
            Get.offAllNamed("/signature/OTS/bucket");
          }
        });
      }
    } on SocketException {
      //throw Exception("Error 401");
    }
    //print(responseJson);
    return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        //print(responseJson);
        return responseJson;
      //return responseJson;
      case 201:
        var responseJson = json.decode(response.body.toString());
        //print(responseJson);
        return responseJson;
      case 400:
        //throw BadRequestException(response.body.toString());
        print("Error 400");
        Get.defaultDialog(content: Text("Email atau Password Salah!"))
            .then((value) => Get.offAllNamed("/loginpage"));
        return null;
      case 401:
        print("Error 401 Token Session ended, please login again");
        final data_store = GetStorage();
        data_store.remove("token");
        data_store.remove("admin");
        Get.offAndToNamed('/');
        return null;
      case 403:
        print("Error 403");
        return Exception(response.body.toString());
      case 409:
        print("Error 409");
        Get.defaultDialog(
                content: Text(
                    "Mohon Maaf Ticket Sudah Habis, Silahkan coba beberapa saat lagi!"))
            .then((value) => Get.offAllNamed("/SignatureeFestival/tickets"));
        return null;
      //throw UnauthorisedException(response.body.toString());
      case 422:
        var responseJson = json.decode(response.body.toString());
        if (responseJson['message']['nomor_ktp'] != null) {
          //print("Nomor ktp error");
          Get.defaultDialog(
                  content: Text(
                      "Data KTP yang dimasukkan sudah terdaftar dalam database!"))
              .then((value) => Get.offAllNamed("/SignatureeFestival/tickets"));
        } else if (responseJson['message']['email'] != null) {
          print("Nomor Email error");
          Get.defaultDialog(
                  content: Text(
                      "Email yang dimasukkan sudah terdaftar dalam database!"))
              .then((value) => Get.offAllNamed("/SignatureeFestival/tickets"));
        } else {
          Get.defaultDialog(content: Text("Error Email/Password salah!"))
              .then((value) => Get.offAllNamed("/loginpage"));
        }
        //print(response);
        // print(
        //     "Error 422 Data KTP / Email yang dimasukkan sudah terdaftar dalam database!");

        return null;
      //throw UnauthorisedException(response.body.toString());
      case 423:
        print("Error 423");
        Get.defaultDialog(content: Text("Image Size Terlalu besar!"))
            .then((value) => Get.offAllNamed("/tickets/details"));
        return null;
      case 500:
        print("Error 503");
        return Exception(response.body.toString());
      default:
      // throw FetchDataException(
      //     'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
