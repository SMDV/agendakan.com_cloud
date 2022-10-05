import 'dart:convert';

import 'package:agendakan_2/pages/mercusuara/controller/ApiMercusuara.dart';
import 'package:agendakan_2/plugins/ApiPlugin.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class DataTableMercusuaraProvider extends ChangeNotifier {
  var data = null;
  ApiMercusuara _provider = ApiMercusuara();

  Future getData(context) async {
    // You can call an API to get data, once we've the data from API or any other flow... Following part would always be the same.
    // We forgot about one more important part .. lets do that first

    // We need access to BuildContext for loading this string and it's not recommended to store this context in any variable here
    // in change notifier..
    // final prefs = await SharedPreferences.getInstance();
    // var token = await prefs.getString('token');
    final data_store = GetStorage();
    var token = data_store.read('token');
    data = await _provider.get3(token.toString());
    if (data != null) {
      if (data['data'] != null) {
        data = data['data'];
        this.notifyListeners();
      } else {
        Get.defaultDialog(content: Text("Data Kosong! Lakukan Pembelian!"))
            .then((value) => Get.offAllNamed("/mercusuara"));
      }
    }
    //data = {""};
    // var response = await DefaultAssetBundle.of(context)
    //     .loadString('assets/raw/mJson.json');
    // now we have response as String from local json or and API request...
    // var mJson = json.decode(response);
    // now we have a json...
    //this.data = MyData.fromJson(mJson);
    print(data);
    // for callback to view
  }
}
