import 'package:agendakan_2/pages/mercusuara/controller/ApiMercusuara.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CheckTicketMercusuara extends GetxController with StateMixin {
  final data_store = GetStorage();
  final _provider = ApiMercusuara();
  dynamic data = [].obs;

  @override
  void onInit() async {
    super.onInit();
    checkAllTicket();
  }

  void checkAllTicket() async {
    change(null, status: RxStatus.loading());
    // token = data_store.read('token');
    data = await _provider.get7();
    change(null, status: RxStatus.success());
  }
}
