import 'package:agendakan_2/plugins/ApiPlugin.dart';
import 'package:agendakan_2/plugins/Api_Image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController with StateMixin {
  final data_store = GetStorage();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  bool checkAuthStatus() {
    change(null, status: RxStatus.loading());
    if (data_store.read("token") == null) {
      change(null, status: RxStatus.empty());
      return false;
    }
    change(null, status: RxStatus.success());
    return true;
  }
}
