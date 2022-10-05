import 'package:agendakan_2/plugins/ApiPlugin.dart';
import 'package:agendakan_2/plugins/Api_Image.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class timerPluginController extends GetxController with StateMixin {
  int minutes = 0.obs as int;
  int seconds = 0.obs as int;
  var data;
  final data_store = GetStorage();
  String token = "";
  final _provider = ApiPlugin();
  String buktiPembayaran = "";

  @override
  void onInit() async {
    super.onInit();
  }

  void loadTime(String id) async {
    change(null, status: RxStatus.loading());
    token = data_store.read('token');
    data = await _provider.get5(token, id);
    change(null, status: RxStatus.success());
  }
}
