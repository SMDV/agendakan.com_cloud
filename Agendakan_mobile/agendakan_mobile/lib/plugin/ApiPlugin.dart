import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'dart:async';
// import 'dart:html' as html;

class ApiPlugin {
  //final String _baseUrl = "http://103.121.17.201:8000";
  final String _baseUrl = "https://gkm.agendakan.com/api";
  var data_store = GetStorage();

  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      var url_uri = Uri.parse(url);
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
    return responseJson;
  }

  Future<dynamic> get2(String nama) async {
    var responseJson;
    try {
      var url_uri = Uri.parse(_baseUrl + "/search-ticket/nama/" + nama);
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
    return responseJson;
  }

  Future<dynamic> get3() async {
    var responseJson;
    try {
      var url_uri = Uri.parse(_baseUrl + "/search-ticket/nama");
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
    return responseJson;
  }

  Future<dynamic> post(String qrcode) async {
    var responseJson;
    try {
      var url_uri = Uri.parse(_baseUrl + "/single-ticket-change");

      final response = await http.post(
        url_uri,
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
        },
        body: jsonEncode(<String, String>{
          "kode_tiket": qrcode,
          "status_kehadiran": "hadir",
          //"status_kehadiran": "tidak-hadir",
        }),
      );
      //final response = await http.get(url_uri);
      responseJson = _response(response);
    } on SocketException {
      throw Exception();
    }
    return responseJson;
  }

  Future<dynamic> post8(String id, String jenis) async {
    var responseJson;
    try {
      var url_uri = Uri.parse(_baseUrl + "/tiket-acc-mobile");
      Get.back();
      Get.defaultDialog(title: "Mohon Menunggu", content: CircularProgressIndicator());
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
        Get.defaultDialog(title: "Success", content: Text("Status berhasil diubah!")).then((value) {
          Get.offAllNamed("/home");
        });
      }
    } on SocketException {
      //throw Exception("Error 401");
    }
    //print(responseJson);
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

  Future<dynamic> post7(String text) async {
    var responseJson;
    try {
      var url_uri = Uri.parse(_baseUrl + "/tiket-search-mobile");

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

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      //return responseJson;
      case 201:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        //throw BadRequestException(response.body.toString());
        print("Error 400");
        Get.defaultDialog(content: Text("Email atau Password Salah!"));
        return null;
      case 401:
        print("Error 401 Token Session ended, please login again");
        final data_store = GetStorage();
        return null;
      case 403:
        print("Error 403");
        return Exception(response.body.toString());
      case 409:
        print("Error 409");
        Get.defaultDialog(content: Text("Mohon Maaf Ticket Sudah Habis, Silahkan coba beberapa saat lagi!"));
        return null;
      //throw UnauthorisedException(response.body.toString());
      case 422:
        var responseJson = json.decode(response.body.toString());
        if (responseJson['message']['nomor_ktp'] != null) {
          //print("Nomor ktp error");
          Get.defaultDialog(content: Text("Data KTP yang dimasukkan sudah terdaftar dalam database!"));
        } else if (responseJson['message']['email'] != null) {
          print("Nomor Email error");
          Get.defaultDialog(content: Text("Email yang dimasukkan sudah terdaftar dalam database!"));
        } else {
          Get.defaultDialog(content: Text("Error Email/Password salah!"));
        }
        //print(response);
        // print(
        //     "Error 422 Data KTP / Email yang dimasukkan sudah terdaftar dalam database!");
        return null;
      //throw UnauthorisedException(response.body.toString());
      case 423:
        print("Error 423");
        Get.defaultDialog(content: Text("Image Size Terlalu besar!"));
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
