import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';

class ApiImageMercusuara {
  final String _baseUrl = "https://mercusuara.agendakan.com/api/mercusuara";
  Future<dynamic> uploadImage(
      String token, String imageFilePath, Uint8List imageBytes, int id) async {
    var response_statuscode;
    try {
      Get.defaultDialog(content: CircularProgressIndicator());
      String url = _baseUrl + "/upload-bukti/" + id.toString();
      PickedFile imageFile = PickedFile(imageFilePath);
      var stream =
          new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));

      var uri = Uri.parse(url);
      int length = imageBytes.length;
      var request = new http.MultipartRequest("POST", uri);
      var multipartFile = new http.MultipartFile('files', stream, length,
          filename: basename(imageFile.path) + '.jpg',
          contentType: MediaType('image', 'jpg'));
      request.headers.addAll(<String, String>{
        "Content-Type": "application/json; charset=UTF-8",
        "Authorization": "Bearer " + token,
      });
      request.files.add(multipartFile);
      var response = await request.send();
      var baru = await http.Response.fromStream(response);
      response_statuscode = response.statusCode;
      print("Something " + response_statuscode.toString());
      print(response_statuscode);
      if (response_statuscode.toString() == "423") {
        Get.defaultDialog(content: Text("Image Size Terlalu besar!"))
            .then((value) => Get.offAllNamed("/mercusuara/tickets/details"));
        return "";
      }
      Get.offAllNamed("/mercusuara/ticket/details");
      return jsonDecode(baru.body);
      print(baru.body);
      // return response[""];
      // response.stream.transform(utf8.decoder).listen((value) {
      //   print(value);
      // });
    } catch (e) {}
    return response_statuscode;
  }
}
