import 'package:agendakan_2/plugins/ApiPlugin.dart';
import 'package:agendakan_2/plugins/Api_Image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoadDataController extends GetxController with StateMixin {
  dynamic data = [].obs;
  RxString id = "".obs;
  final data_store = GetStorage();
  String token = "";
  final _provider = ApiPlugin();
  String buktiPembayaran = "";

  @override
  void onInit() async {
    super.onInit();
  }

  void loadPembayaran(String id) async {
    change(null, status: RxStatus.loading());
    token = data_store.read('token');
    data = await _provider.get5(token, id);
    // if (data['data']['bukti_pembayaran'] != null) {
    //   buktiPembayaran = data['data']['bukti_pembayaran'];
    // }
    //print("testing load controller" + data.toString());
    // if(data['status']=="success"){

    // }
    change(null, status: RxStatus.success());
  }

  void loadAllPembayaran() async {
    change(null, status: RxStatus.loading());
    token = data_store.read('token');
    data = await _provider.get4(token);
    // if (data['data']['bukti_pembayaran'] != null) {
    //   buktiPembayaran = data['data']['bukti_pembayaran'];
    // }
    //print("testing load controller" + data.toString());
    // if(data['status']=="success"){

    // }
    change(null, status: RxStatus.success());
  }

  void checkLogin() {
    if (data_store.read("token") == null) {}
  }
}

class LoadImageController extends GetxController with StateMixin {
  String linkFile = "";
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
  }

  void uploadFoto(String token, var filepath, var imageBytes, int id) async {
    change(null, status: RxStatus.loading());
    Api_Image _uploadImage = new Api_Image();
    var res = await _uploadImage.uploadImage(token, filepath, imageBytes, id);
    if (res != null && res != "423") {
      linkFile = res['bukti_pembayaran'];
      change(null, status: RxStatus.success());
    } else {
      change(null, status: RxStatus.empty());
    }
  }
}
