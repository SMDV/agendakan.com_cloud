import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class GKM_2023_API {
  final String _baseUrl = "https://gkm2023.agendakan.com/api/";
  var data_store = GetStorage();

  Future<dynamic> getAllStatusTicket() async {
    var responseJson;
    Get.defaultDialog(title: "Mohon Menunggu", content: CircularProgressIndicator());
    try {
      var url_uri = Uri.parse(_baseUrl + "get-jumlah-tiket-terjual");
      //final response = await http.post(url_uri);
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
    Get.back();
    return responseJson;
  }

  Future<dynamic> login(String email, String password) async {
    var responseJson;
    Get.defaultDialog(title: "Mohon Menunggu", content: CircularProgressIndicator());
    try {
      var url_uri = Uri.parse(_baseUrl + "login");

      final response = await http.post(
        url_uri,
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
        },
        body: jsonEncode(<String, String>{"email": email, "password": password}),
      );
      //final response = await http.get(url_uri);
      responseJson = _response(response);
      //responseJson = response;
    } on SocketException {
      throw Exception();
    }
    Get.back();
    if (responseJson != null) {
      if (responseJson['acara'] == "GKM 2023") {
        data_store.write("acara", responseJson['acara']);
        data_store.write("token", responseJson['token']);
        data_store.write("isAdmin", responseJson['isAdmin']);
        data_store.write("nama_user", responseJson['nama_user']);
        // if (responseJson['isAdmin'] == 1) {
        //   // Get.toNamed('/gkm/ticket_list', arguments: responseJson['token']);
        // } else {
        //   Get.toNamed('/gkm_2023', arguments: responseJson['token']);
        // }
      }
    } else {
      print("Login Failed!");
    }
    return responseJson;
  }

  Future<dynamic> register(String email, String name, String pass, String username) async {
    var responseJson;
    Get.defaultDialog(title: "Mohon Menunggu", content: CircularProgressIndicator());
    try {
      var url_uri = Uri.parse(_baseUrl + "register");

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
    Get.back();

    return responseJson;
  }

  Future<dynamic> cekID(String nomorKtp) async {
    var responseJson;
    Get.defaultDialog(title: "Mohon Menunggu", content: CircularProgressIndicator());
    try {
      var url_uri = Uri.parse(_baseUrl + "cek-jumlah-pembelian");
      var token = data_store.read("token");
      final response = await http.post(
        url_uri,
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
          "Authorization": "Bearer " + token,
        },
        body: jsonEncode(<String, String>{
          "nomor_ktp": nomorKtp,
        }),
      );
      //final response = await http.get(url_uri);
      responseJson = _response(response);
    } on SocketException {
      throw Exception();
    }
    Get.back();
    return responseJson;
  }

  Future<dynamic> submitPembelian(String token, var dataSend) async {
    var responseJson;
    //const test = data_send;
    Get.defaultDialog(content: CircularProgressIndicator());
    String jsonString = jsonEncode(dataSend);
    print(jsonString);
    try {
      var url_uri = Uri.parse(_baseUrl + "pembelian");

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
      throw Exception();
    }
    Get.back();
    return responseJson;
  }

  Future<dynamic> getListTicket(String token, String keyword) async {
    var responseJson;
    const test = "";
    String jsonString = jsonEncode(test);
    print(jsonString);
    try {
      var url_uri = Uri.parse(_baseUrl + keyword + "-pembelian"); // ->

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

  Future<dynamic> downloadTicket(String token, String id) async {
    var responseJson;
    const test = "";
    String jsonString = jsonEncode(test);
    print(jsonString);
    try {
      var url_uri = Uri.parse(_baseUrl + "download-tiket/" + id);

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
    // html.AnchorElement anchorElement =
    //     new html.AnchorElement(href: responseJson['']);
    return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        //print(responseJson);
        return responseJson;
      //return responseJson;
      // case 201:
      //   var responseJson = json.decode(response.body.toString());
      //   //print(responseJson);
      //   return responseJson;
      // case 400:
      //   //throw BadRequestException(response.body.toString());
      //   print("Error 400");
      //   Get.defaultDialog(content: Text("Email atau Password Salah!"))
      //       .then((value) => Get.offAllNamed("/loginpage"));
      //   return null;
      // case 401:
      //   print("Error 401 Token Session ended, please login again");
      //   final data_store = GetStorage();
      //   data_store.remove("token");
      //   data_store.remove("admin");
      //   Get.offAndToNamed('/');
      //   return null;
      // case 403:
      //   print("Error 403");
      //   return Exception(response.body.toString());
      // case 409:
      //   print("Error 409");
      //   Get.defaultDialog(content: Text("Maksimum pembelian 3 tiket dalam 1 akun!"))
      //       .then((value) => Get.offAllNamed("/gkm/ticket_list"));
      //   return null;
      // //throw UnauthorisedException(response.body.toString());
      // case 422:
      //   var responseJson = json.decode(response.body.toString());
      //   if (responseJson['message']['nomor_ktp'] != null) {
      //     //print("Nomor ktp error");
      //     Get.defaultDialog(
      //             content: Text("Data KTP yang dimasukkan sudah terdaftar dalam database!"))
      //         .then((value) => Get.offAllNamed("/SignatureeFestival/tickets"));
      //   } else if (responseJson['message']['email'] != null) {
      //     print("Nomor Email error");
      //     Get.defaultDialog(content: Text("Email yang dimasukkan sudah terdaftar dalam database!"))
      //         .then((value) => Get.offAllNamed("/gkm"));
      //   } else {
      //     Get.defaultDialog(content: Text("Error Email/Password salah!"))
      //         .then((value) => Get.offAllNamed("/loginpage"));
      //   }
      //   //print(response);
      //   // print(
      //   //     "Error 422 Data KTP / Email yang dimasukkan sudah terdaftar dalam database!");

      //   return null;
      // //throw UnauthorisedException(response.body.toString());
      // case 423:
      //   print("Error 423");
      //   Get.defaultDialog(content: Text("Image Size Terlalu besar!"))
      //       .then((value) => Get.offAllNamed("/gkm"));
      //   return null;
      case 500:
        print("Error 503");
        return Exception(response.body.toString());
      default:
        var responseJson = json.decode(response.body.toString());
        //print(responseJson);
        return responseJson;
      // throw FetchDataException(
      //     'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
