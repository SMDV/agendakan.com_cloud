import 'package:agendakan_2/pages/register/register_page.dart';
import 'package:agendakan_2/plugins/ApiPlugin.dart';
import 'package:agendakan_2/plugins/loadData.dart';
import 'package:agendakan_2/test.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BuyTicketPage extends StatefulWidget {
  const BuyTicketPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<BuyTicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<BuyTicketPage> {
  final _formKey = GlobalKey<FormState>();
  String dropdownValue = '1';
  ApiPlugin _provider = ApiPlugin();
  final data_store = GetStorage();
  TextEditingController email_account = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool _passwordVisible = true;
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  var checkboxValue = false;
  TextEditingController email1 = TextEditingController();
  TextEditingController pass1 = TextEditingController();
  var checkboxValue1 = false;

  TextEditingController email2 = TextEditingController();
  TextEditingController pass2 = TextEditingController();
  var checkboxValue2 = false;
  TextEditingController kupon_value = TextEditingController();
  String id_kupon = "1";
  String desc_kupon = "";
  String nama_kupon = "";
  bool lockedForm = false;

  @override
  Widget build(BuildContext context) {
    LoadDataController _dataControl = Get.put(LoadDataController());
    //print(Get.arguments);
    return SingleChildScrollView(
      child: Container(
        //padding: const EdgeInsets.all(20),
        // padding: const EdgeInsets.fromLTRB(300, 20, 300, 0),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // SizedBox(
            //   height: 150,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Jumlah Ticket yg Dibeli",
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(
                  width: 20,
                ),
                DropdownButton(
                  value: dropdownValue,
                  items: <String>['1', '2', '3']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (lockedForm)
                      ? null
                      : (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                ),
              ],
            ),
            Container(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    //form 1
                    if (data_store.read("token") == null) ...[
                      TextFormField(
                        controller: email_account,
                        validator: (value) => EmailValidator.validate(value!)
                            ? null
                            : "Please enter a valid email",
                        maxLines: 1,
                        decoration: InputDecoration(
                          hintText: 'Enter your Email to make an account',
                          prefixIcon: const Icon(Icons.mail),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: username,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter your name';
                          }
                          return null;
                        },
                        maxLines: 1,
                        decoration: InputDecoration(
                          hintText: 'Enter your Account name',
                          prefixIcon: const Icon(Icons.account_circle),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: password,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 6) {
                            return 'Enter your password with minimum of 6 characters';
                          }
                          return null;
                        },
                        maxLines: 1,
                        inputFormatters: [LengthLimitingTextInputFormatter(20)],
                        obscureText: _passwordVisible,
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          prefixIcon: const Icon(Icons.password),
                          suffixIcon: IconButton(
                            icon: Icon(_passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: email,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter your ID';
                        }
                        // else if (value.length < 16) {
                        //   return 'KTP minimal 16 Digit!';
                        // }
                        return null;
                      },
                      maxLines: 1,
                      //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        hintText: 'Enter your ID Number (tanda pengenal)',
                        prefixIcon: const Icon(Icons.local_offer),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: pass,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter your Name';
                        }
                        return null;
                      },
                      maxLines: 1,
                      // obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        hintText: 'Enter the name from ID',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    CheckboxListTile(
                      title: const Text("Add ons"),
                      contentPadding: EdgeInsets.zero,
                      value: checkboxValue,
                      activeColor: Theme.of(context).colorScheme.primary,
                      onChanged: (lockedForm)
                          ? null
                          : (newValue) {
                              setState(() {
                                checkboxValue = newValue!;
                              });
                            },
                      controlAffinity: ListTileControlAffinity.leading,
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    //form 2
                    if (dropdownValue != "1") ...[
                      TextFormField(
                        controller: email1,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter your ID';
                          }
                          // else if (value.length < 16) {
                          //   return 'KTP minimal 16 Digit!';
                          // }
                          return null;
                        },
                        // inputFormatters: [
                        //   FilteringTextInputFormatter.digitsOnly
                        // ],
                        maxLines: 1,
                        decoration: InputDecoration(
                          hintText: 'Enter your ID Number (tanda pengenal)',
                          prefixIcon: const Icon(Icons.book),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: pass1,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter your Name';
                          }
                          return null;
                        },
                        maxLines: 1,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person),
                          hintText: 'Enter the name from ID',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      CheckboxListTile(
                        title: const Text("Add ons"),
                        contentPadding: EdgeInsets.zero,
                        value: checkboxValue1,
                        activeColor: Theme.of(context).colorScheme.primary,
                        onChanged: (newValue) {
                          setState(() {
                            checkboxValue1 = newValue!;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                    //form 3
                    if (dropdownValue == "3") ...[
                      TextFormField(
                        controller: email2,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter your ID';
                          }
                          // else if (value.length < 16) {
                          //   return 'KTP minimal 16 Digit!';
                          // }
                          return null;
                        },
                        // inputFormatters: [
                        //   FilteringTextInputFormatter.digitsOnly
                        // ],
                        maxLines: 1,
                        decoration: InputDecoration(
                          hintText: 'Enter your ID Number (tanda pengenal)',
                          prefixIcon: const Icon(Icons.book),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: pass2,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter your name';
                          }
                          return null;
                        },
                        maxLines: 1,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person),
                          hintText: 'Enter the name from ID',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      CheckboxListTile(
                        title: const Text("Add ons"),
                        contentPadding: EdgeInsets.zero,
                        value: checkboxValue2,
                        activeColor: Theme.of(context).colorScheme.primary,
                        onChanged: (newValue) {
                          setState(() {
                            checkboxValue2 = newValue!;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],

                    Row(
                      children: [
                        Text("Coupon Code (Conditional)"),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    if (id_kupon == "1") ...[
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: kupon_value,
                              // validator: (value) {
                              //   if (value == null || value.isEmpty) {
                              //     return 'Invalid Coupon Code';
                              //   }
                              //   return null;
                              // },
                              maxLines: 1,
                              decoration: InputDecoration(
                                suffix: ElevatedButton(
                                  onPressed: (() async {
                                    var data_kupon;
                                    if (kupon_value.text == "") {
                                      // print("Null Kupon");
                                      Get.defaultDialog(
                                          content: Text("Isi Coupon!"));
                                    } else {
                                      var data_kupon;
                                      if (data_store.read("token") == "" ||
                                          data_store.read("token") == null) {
                                        data_kupon = await _provider
                                            .get9(kupon_value.text);
                                      } else {
                                        data_kupon = await _provider
                                            .get8(kupon_value.text);
                                      }
                                      if (data_kupon['kupon'] == null ||
                                          data_kupon['kupon'] == "habis") {
                                        Get.defaultDialog(
                                            content: Text(
                                                "Invalid / Expired Coupon!"));
                                      } else if (data_kupon['kupon']
                                              ['jenis_kupon'] ==
                                          "spesial") {
                                        Get.defaultDialog(
                                            content: Text("Coupon Available!"));
                                        setState(() {
                                          dropdownValue = "1";
                                          checkboxValue = false;
                                          lockedForm = true;
                                          id_kupon = data_kupon['kupon']['id']
                                              .toString();
                                          desc_kupon = "Kupon " +
                                              data_kupon['kupon']
                                                  ['nama_kupon'] +
                                              " : Mendapatkan harga spesial ( potongan harga dan free pajak ). Harga tiket menjadi Rp. 560.000. Khusus untuk pembelian 1 tiket( Tanpa addons )!";
                                          nama_kupon =
                                              data_kupon['kupon']['nama_kupon'];
                                        });
                                      } else if (data_kupon['kupon']
                                              ['jenis_kupon'] ==
                                          "karet2") {
                                        Get.defaultDialog(
                                            content: Text("Coupon Available!"));
                                        setState(() {
                                          dropdownValue = "1";
                                          checkboxValue = false;
                                          lockedForm = true;
                                          id_kupon = data_kupon['kupon']['id']
                                              .toString();
                                          desc_kupon = "Kupon " +
                                              data_kupon['kupon']
                                                  ['nama_kupon'] +
                                              " : Mendapatkan harga spesial ( potongan harga dan free pajak ). Harga tiket menjadi Rp. 600.000. Khusus untuk pembelian 1 tiket( Tanpa addons )!";
                                          nama_kupon =
                                              data_kupon['kupon']['nama_kupon'];
                                        });
                                      } else if (data_kupon['kupon']
                                              ['jenis_kupon'] ==
                                          "gapedes") {
                                        Get.defaultDialog(
                                            content: Text("Coupon Available!"));
                                        setState(() {
                                          dropdownValue = "1";
                                          checkboxValue = false;
                                          lockedForm = true;
                                          id_kupon = data_kupon['kupon']['id']
                                              .toString();
                                          desc_kupon = "Kupon " +
                                              data_kupon['kupon']
                                                  ['nama_kupon'] +
                                              "\nTiket hanya berlaku untuk SATU ORANG.\nTIDAK TERMASUK fasilitas keranjang piknik, karpet piknik, snack, minuman dan jas hujan\nSilahkan Hubungi CS untuk info lebih lanjut";
                                          nama_kupon =
                                              data_kupon['kupon']['nama_kupon'];
                                        });
                                      } else {
                                        Get.defaultDialog(
                                            content: Text("Coupon Available!"));
                                        setState(() {
                                          id_kupon = data_kupon['kupon']['id']
                                              .toString();
                                          desc_kupon = data_kupon['kupon']
                                                  ['nama_kupon'] +
                                              " : Mendapat Persen Potongan sebesar " +
                                              data_kupon['kupon']
                                                      ['persen_potongan']
                                                  .toString() +
                                              "%";
                                          nama_kupon =
                                              data_kupon['kupon']['nama_kupon'];
                                        });
                                      }
                                    }

                                    // print(data_kupon['kupon']);
                                  }),
                                  child: Text("Verify"),
                                ),
                                prefixIcon: const Icon(Icons.person),
                                hintText: 'Enter Coupon Code (Conditional)',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ] else ...[
                      Row(
                        children: [Expanded(child: Text(desc_kupon))],
                      )
                    ],
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          int jumlah_ticket = int.parse(dropdownValue);
                          List<String> emailList = <String>[];
                          List<String> passList = <String>[];
                          List<int> addonsList = <int>[];
                          emailList.add(email.text);
                          passList.add(pass.text);
                          addonsList.add(checkboxValue ? 1 : 0);
                          if (dropdownValue != "1") {
                            emailList.add(email1.text);
                            passList.add(pass1.text);
                            addonsList.add(checkboxValue1 ? 1 : 0);
                          }
                          if (dropdownValue == "3") {
                            emailList.add(email2.text);
                            passList.add(pass2.text);
                            addonsList.add(checkboxValue2 ? 1 : 0);
                          }
                          List<Map<String, Object>> data_send = [];
                          for (int i = 0; i < jumlah_ticket; i++) {
                            data_send.add({
                              "nomor_ktp": emailList.elementAt(i),
                              "nama_tiket": passList.elementAt(i),
                              "addons": addonsList.elementAt(i),
                              "jenis_tiket": data_store.read("jenis_tiket"),
                              "id_kupon": id_kupon
                            });
                          }
                          Get.defaultDialog(
                              title: "Book Confirmation",
                              barrierDismissible: false,
                              content: Flexible(
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                  "Mohon konfirmasi data sebelum masuk ke halaman pembayaran tiket"),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Spacer(),
                                          Text("Ticket 1"),
                                          Spacer(),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Spacer(),
                                          Expanded(child: Text("No KTP")),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Text(":"),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Expanded(
                                              child:
                                                  Text(emailList.elementAt(0))),
                                          Spacer(),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Spacer(),
                                          Expanded(child: Text("Nama")),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Text(":"),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Expanded(
                                              child:
                                                  Text(passList.elementAt(0))),
                                          Spacer(),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Spacer(),
                                          Expanded(child: Text("Addons")),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Text(":"),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Expanded(
                                            child: Text(
                                                (addonsList.elementAt(0) == 1)
                                                    ? "Yes"
                                                    : "No"),
                                          ),
                                          Spacer(),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Spacer(),
                                          Expanded(
                                              child: Text("Berlaku untuk")),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Text(":"),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Expanded(
                                            child: (id_kupon == "554")
                                                ? Text("1 orang (Max)")
                                                : Text(
                                                    (addonsList.elementAt(0) ==
                                                            1)
                                                        ? "3 orang (Max)"
                                                        : "2 orang (Max)"),
                                          ),
                                          Spacer(),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Spacer(),
                                          Expanded(child: Text("Jenis Ticket")),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Text(":"),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Expanded(
                                            child: Text(
                                                data_store.read("jenis_tiket")),
                                          ),
                                          Spacer(),
                                        ],
                                      ),
                                      if (id_kupon != "1") ...[
                                        Row(
                                          children: [
                                            Spacer(),
                                            Expanded(
                                                child: Text("Jenis Voucher")),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Text(":"),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Expanded(
                                              child: Text(nama_kupon),
                                            ),
                                            Spacer(),
                                          ],
                                        ),
                                      ],
                                      SizedBox(
                                        height: 25,
                                      ),
                                      if (jumlah_ticket != 1) ...[
                                        Row(
                                          children: [
                                            Spacer(),
                                            Text("Ticket 2"),
                                            Spacer(),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Spacer(),
                                            Expanded(child: Text("No KTP")),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Text(":"),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Expanded(
                                                child: Text(
                                                    emailList.elementAt(1))),
                                            Spacer(),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Spacer(),
                                            Expanded(child: Text("Nama")),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Text(":"),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Expanded(
                                                child: Text(
                                                    passList.elementAt(1))),
                                            Spacer(),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Spacer(),
                                            Expanded(child: Text("Addons")),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Text(":"),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Expanded(
                                              child: Text(
                                                  (addonsList.elementAt(1) == 1)
                                                      ? "Yes"
                                                      : "No"),
                                            ),
                                            Spacer(),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Spacer(),
                                            Expanded(
                                                child: Text("Berlaku untuk")),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Text(":"),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Expanded(
                                              child: Text(
                                                  (addonsList.elementAt(1) == 1)
                                                      ? "3 orang (Max)"
                                                      : "2 orang (Max)"),
                                            ),
                                            Spacer(),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Spacer(),
                                            Expanded(
                                                child: Text("Jenis Ticket")),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Text(":"),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Expanded(
                                              child: Text(data_store
                                                  .read("jenis_tiket")),
                                            ),
                                            Spacer(),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 25,
                                        ),
                                      ],
                                      if (jumlah_ticket == 3) ...[
                                        Row(
                                          children: [
                                            Spacer(),
                                            Text("Ticket 3"),
                                            Spacer(),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Spacer(),
                                            Expanded(child: Text("No KTP")),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Text(":"),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Expanded(
                                                child: Text(
                                                    emailList.elementAt(2))),
                                            Spacer(),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Spacer(),
                                            Expanded(child: Text("Nama")),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Text(":"),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Expanded(
                                                child: Text(
                                                    passList.elementAt(2))),
                                            Spacer(),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Spacer(),
                                            Expanded(child: Text("Addons")),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Text(":"),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Expanded(
                                              child: Text(
                                                  (addonsList.elementAt(2) == 1)
                                                      ? "Yes"
                                                      : "No"),
                                            ),
                                            Spacer(),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Spacer(),
                                            Expanded(
                                                child: Text("Berlaku untuk")),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Text(":"),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Expanded(
                                              child: Text(
                                                  (addonsList.elementAt(2) == 1)
                                                      ? "3 orang (Max)"
                                                      : "2 orang (Max)"),
                                            ),
                                            Spacer(),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Spacer(),
                                            Expanded(
                                                child: Text("Jenis Ticket")),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Text(":"),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Expanded(
                                              child: Text(data_store
                                                  .read("jenis_tiket")),
                                            ),
                                            Spacer(),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 25,
                                        ),
                                      ],
                                      // Spacer(),

                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ElevatedButton(
                                              onPressed: () async {
                                                Get.defaultDialog(
                                                    content:
                                                        CircularProgressIndicator());
                                                if (data_store.read("token") !=
                                                    null) {
                                                  var data =
                                                      await _provider.post4(
                                                          data_store
                                                              .read('token'),
                                                          data_send);
                                                  //ticket detail setelah hit api ke system
                                                  // off try validate
                                                  Get.offAndToNamed(
                                                      '/tickets/details',
                                                      arguments: data['data']
                                                          .toString());
                                                } else {
                                                  var data =
                                                      await _provider.post2(
                                                          email_account.text,
                                                          username.text,
                                                          password.text);
                                                  if (data['success'] == true) {
                                                    var data =
                                                        await _provider.post(
                                                            email_account.text,
                                                            password.text);
                                                    data_store.write(
                                                        "token", data['token']);
                                                    if (data['success'] ==
                                                        true) {
                                                      var data =
                                                          await _provider.post4(
                                                              data_store.read(
                                                                  'token'),
                                                              data_send);
                                                      // off try validate
                                                      Get.offAndToNamed(
                                                          '/tickets/details',
                                                          arguments:
                                                              data['data']
                                                                  .toString());
                                                    }
                                                    //ticket detail setelah hit api ke system
                                                  }
                                                }
                                              },
                                              child: Text("Agree")),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          ElevatedButton(
                                              onPressed: () => Get.back(),
                                              child: Text("Cancel"))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      )
                                    ],
                                  ),
                                ),
                              ));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                      ),
                      child: const Text(
                        'BOOK TICKET',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
