import 'package:agendakan_2/pages/mercusuara/controller/ApiMercusuara.dart';
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

class BuyTicketMercusuaraPage extends StatefulWidget {
  const BuyTicketMercusuaraPage({Key? key, required this.title})
      : super(key: key);
  final String title;

  @override
  State<BuyTicketMercusuaraPage> createState() => _TicketPageMercusuaraState();
}

class _TicketPageMercusuaraState extends State<BuyTicketMercusuaraPage> {
  final _formKey = GlobalKey<FormState>();
  String dropdownValue = '1';
  ApiMercusuara _provider = ApiMercusuara();
  final data_store = GetStorage();
  TextEditingController email_account = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  var checkboxValue = false;
  TextEditingController email1 = TextEditingController();
  TextEditingController pass1 = TextEditingController();
  var checkboxValue1 = false;

  TextEditingController email2 = TextEditingController();
  TextEditingController pass2 = TextEditingController();
  var checkboxValue2 = false;

  @override
  Widget build(BuildContext context) {
    // LoadDataController _dataControl = Get.put(LoadDataController());
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
                  onChanged: (String? newValue) {
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
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          prefixIcon: const Icon(Icons.password),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                    const SizedBox(
                      height: 60,
                    ),
                    //form 1
                    Text("Ticket 1"),
                    // TextFormField(
                    //   controller: email,
                    //   validator: (value) {
                    //     if (value == null || value.isEmpty) {
                    //       return 'Enter your ID';
                    //     }
                    //     // else if (value.length < 16) {
                    //     //   return 'KTP minimal 16 Digit!';
                    //     // }
                    //     return null;
                    //   },
                    //   maxLines: 1,
                    //   //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    //   decoration: InputDecoration(
                    //     hintText: 'Enter your ID Number (tanda pengenal)',
                    //     prefixIcon: const Icon(Icons.local_offer),
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(10),
                    //     ),
                    //   ),
                    // ),
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
                        hintText: 'Enter name for the ticket',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    // CheckboxListTile(
                    //   title: const Text("Add ons"),
                    //   contentPadding: EdgeInsets.zero,
                    //   value: checkboxValue,
                    //   activeColor: Theme.of(context).colorScheme.primary,
                    //   onChanged: (newValue) {
                    //     setState(() {
                    //       checkboxValue = newValue!;
                    //     });
                    //   },
                    //   controlAffinity: ListTileControlAffinity.leading,
                    // ),

                    const SizedBox(
                      height: 60,
                    ),
                    //form 2
                    if (dropdownValue != "1") ...[
                      Text("Ticket 2"),
                      // TextFormField(
                      //   controller: email1,
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return 'Enter your ID';
                      //     }
                      //     // else if (value.length < 16) {
                      //     //   return 'KTP minimal 16 Digit!';
                      //     // }
                      //     return null;
                      //   },
                      //   // inputFormatters: [
                      //   //   FilteringTextInputFormatter.digitsOnly
                      //   // ],
                      //   maxLines: 1,
                      //   decoration: InputDecoration(
                      //     hintText: 'Enter your ID Number (tanda pengenal)',
                      //     prefixIcon: const Icon(Icons.book),
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(10),
                      //     ),
                      //   ),
                      // ),
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
                          hintText: 'Enter name for the ticket',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      // CheckboxListTile(
                      //   title: const Text("Add ons"),
                      //   contentPadding: EdgeInsets.zero,
                      //   value: checkboxValue1,
                      //   activeColor: Theme.of(context).colorScheme.primary,
                      //   onChanged: (newValue) {
                      //     setState(() {
                      //       checkboxValue1 = newValue!;
                      //     });
                      //   },
                      //   controlAffinity: ListTileControlAffinity.leading,
                      // ),
                      const SizedBox(
                        height: 60,
                      ),
                    ],
                    //form 3
                    if (dropdownValue == "3") ...[
                      Text("Ticket 3"),
                      // TextFormField(
                      //   controller: email2,
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return 'Enter your ID';
                      //     }
                      //     // else if (value.length < 16) {
                      //     //   return 'KTP minimal 16 Digit!';
                      //     // }
                      //     return null;
                      //   },
                      //   // inputFormatters: [
                      //   //   FilteringTextInputFormatter.digitsOnly
                      //   // ],
                      //   maxLines: 1,
                      //   decoration: InputDecoration(
                      //     hintText: 'Enter your ID Number (tanda pengenal)',
                      //     prefixIcon: const Icon(Icons.book),
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(10),
                      //     ),
                      //   ),
                      // ),
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
                          hintText: 'Enter name for the ticket',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      // CheckboxListTile(
                      //   title: const Text("Add ons"),
                      //   contentPadding: EdgeInsets.zero,
                      //   value: checkboxValue2,
                      //   activeColor: Theme.of(context).colorScheme.primary,
                      //   onChanged: (newValue) {
                      //     setState(() {
                      //       checkboxValue2 = newValue!;
                      //     });
                      //   },
                      //   controlAffinity: ListTileControlAffinity.leading,
                      // ),
                      const SizedBox(
                        height: 60,
                      ),
                    ],
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          int jumlah_ticket = int.parse(dropdownValue);
                          List<String> emailList = <String>[];
                          List<String> passList = <String>[];
                          List<int> addonsList = <int>[];
                          // emailList.add(email.text);
                          emailList.add("");
                          passList.add(pass.text);
                          addonsList.add(checkboxValue ? 1 : 0);
                          if (dropdownValue != "1") {
                            // emailList.add(email1.text);
                            emailList.add("");
                            passList.add(pass1.text);
                            addonsList.add(checkboxValue1 ? 1 : 0);
                          }
                          if (dropdownValue == "3") {
                            // emailList.add(email2.text);
                            emailList.add("");
                            passList.add(pass2.text);
                            addonsList.add(checkboxValue2 ? 1 : 0);
                          }
                          List<Map<String, Object>> data_send = [];
                          for (int i = 0; i < jumlah_ticket; i++) {
                            data_send.add({
                              "nomor_ktp": emailList.elementAt(i),
                              "nama_tiket": passList.elementAt(i),
                              "addons": addonsList.elementAt(i),
                              "jenis_tiket": "presale",
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
                                      // Row(
                                      //   children: [
                                      //     Spacer(),
                                      //     Expanded(child: Text("No KTP")),
                                      //     SizedBox(
                                      //       width: 15,
                                      //     ),
                                      //     Text(":"),
                                      //     SizedBox(
                                      //       width: 15,
                                      //     ),
                                      //     Expanded(
                                      //         child:
                                      //             Text(emailList.elementAt(0))),
                                      //     Spacer(),
                                      //   ],
                                      // ),
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
                                      // Row(
                                      //   children: [
                                      //     Spacer(),
                                      //     Expanded(child: Text("Addons")),
                                      //     SizedBox(
                                      //       width: 15,
                                      //     ),
                                      //     Text(":"),
                                      //     SizedBox(
                                      //       width: 15,
                                      //     ),
                                      //     Expanded(
                                      //       child: Text(
                                      //           (addonsList.elementAt(0) == 1)
                                      //               ? "Yes"
                                      //               : "No"),
                                      //     ),
                                      //     Spacer(),
                                      //   ],
                                      // ),
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
                                                (addonsList.elementAt(0) == 1)
                                                    ? "1 orang (Max)"
                                                    : "1 orang (Max)"),
                                          ),
                                          Spacer(),
                                        ],
                                      ),
                                      // Row(
                                      //   children: [
                                      //     Spacer(),
                                      //     Expanded(child: Text("Jenis Ticket")),
                                      //     SizedBox(
                                      //       width: 15,
                                      //     ),
                                      //     Text(":"),
                                      //     SizedBox(
                                      //       width: 15,
                                      //     ),
                                      //     Expanded(
                                      //       child: Text(
                                      //           data_store.read("jenis_tiket")),
                                      //     ),
                                      //     Spacer(),
                                      //   ],
                                      // ),
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
                                        // Row(
                                        //   children: [
                                        //     Spacer(),
                                        //     Expanded(child: Text("No KTP")),
                                        //     SizedBox(
                                        //       width: 15,
                                        //     ),
                                        //     Text(":"),
                                        //     SizedBox(
                                        //       width: 15,
                                        //     ),
                                        //     Expanded(
                                        //         child: Text(
                                        //             emailList.elementAt(1))),
                                        //     Spacer(),
                                        //   ],
                                        // ),
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
                                        // Row(
                                        //   children: [
                                        //     Spacer(),
                                        //     Expanded(child: Text("Addons")),
                                        //     SizedBox(
                                        //       width: 15,
                                        //     ),
                                        //     Text(":"),
                                        //     SizedBox(
                                        //       width: 15,
                                        //     ),
                                        //     Expanded(
                                        //       child: Text(
                                        //           (addonsList.elementAt(1) == 1)
                                        //               ? "Yes"
                                        //               : "No"),
                                        //     ),
                                        //     Spacer(),
                                        //   ],
                                        // ),
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
                                                      ? "1 orang (Max)"
                                                      : "1 orang (Max)"),
                                            ),
                                            Spacer(),
                                          ],
                                        ),
                                        // Row(
                                        //   children: [
                                        //     Spacer(),
                                        //     Expanded(
                                        //         child: Text("Jenis Ticket")),
                                        //     SizedBox(
                                        //       width: 15,
                                        //     ),
                                        //     Text(":"),
                                        //     SizedBox(
                                        //       width: 15,
                                        //     ),
                                        //     Expanded(
                                        //       child: Text(data_store
                                        //           .read("jenis_tiket")),
                                        //     ),
                                        //     Spacer(),
                                        //   ],
                                        // ),
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
                                        // Row(
                                        //   children: [
                                        //     Spacer(),
                                        //     Expanded(child: Text("No KTP")),
                                        //     SizedBox(
                                        //       width: 15,
                                        //     ),
                                        //     Text(":"),
                                        //     SizedBox(
                                        //       width: 15,
                                        //     ),
                                        //     Expanded(
                                        //         child: Text(
                                        //             emailList.elementAt(2))),
                                        //     Spacer(),
                                        //   ],
                                        // ),
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
                                        // Row(
                                        //   children: [
                                        //     Spacer(),
                                        //     Expanded(child: Text("Addons")),
                                        //     SizedBox(
                                        //       width: 15,
                                        //     ),
                                        //     Text(":"),
                                        //     SizedBox(
                                        //       width: 15,
                                        //     ),
                                        //     Expanded(
                                        //       child: Text(
                                        //           (addonsList.elementAt(2) == 1)
                                        //               ? "Yes"
                                        //               : "No"),
                                        //     ),
                                        //     Spacer(),
                                        //   ],
                                        // ),
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
                                                      ? "1 orang (Max)"
                                                      : "1 orang (Max)"),
                                            ),
                                            Spacer(),
                                          ],
                                        ),
                                        // Row(
                                        //   children: [
                                        //     Spacer(),
                                        //     Expanded(
                                        //         child: Text("Jenis Ticket")),
                                        //     SizedBox(
                                        //       width: 15,
                                        //     ),
                                        //     Text(":"),
                                        //     SizedBox(
                                        //       width: 15,
                                        //     ),
                                        //     Expanded(
                                        //       child: Text(data_store
                                        //           .read("jenis_tiket")),
                                        //     ),
                                        //     Spacer(),
                                        //   ],
                                        // ),
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
                                                      'mercusuara/ticket/details',
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
                                                          '/mercusuara/ticket/details',
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
                          //Ticket API
                          // if (data_store.read("token") != null) {
                          //   var data = await _provider.post4(
                          //       data_store.read('token'), data_send);
                          //   //ticket detail setelah hit api ke system
                          //   // off try validate
                          //   Get.offAndToNamed('/tickets/details',
                          //       arguments: data['data'].toString());
                          // } else {
                          //   var data = await _provider.post2(email_account.text,
                          //       username.text, password.text);
                          //   if (data['success'] == true) {
                          //     var data = await _provider.post(
                          //         email_account.text, password.text);
                          //     data_store.write("token", data['token']);
                          //     if (data['success'] == true) {
                          //       var data = await _provider.post4(
                          //           data_store.read('token'), data_send);
                          //       // off try validate
                          //       Get.offAndToNamed('/tickets/details',
                          //           arguments: data['data'].toString());
                          //     }
                          //     //ticket detail setelah hit api ke system
                          //   }
                          // }
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

Widget getForm() {
  return new Row(
    children: [],
  );
}
