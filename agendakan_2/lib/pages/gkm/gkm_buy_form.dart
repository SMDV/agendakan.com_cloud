import 'dart:math';

import 'package:agendakan_2/pages/gkm/repository/gkm_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class GKM_FORM_TICKET extends StatefulWidget {
  const GKM_FORM_TICKET({super.key});

  @override
  State<GKM_FORM_TICKET> createState() => _GKM_FORM_TICKETState();
}

class _GKM_FORM_TICKETState extends State<GKM_FORM_TICKET> {
  final _formKey = GlobalKey<FormState>();
  String dropdownValue = '1';
  String dropdownValue2 = "Male";
  String dropdownValue3 = "Male";
  String dropdownValue4 = "Male";
  GKM_API _provider = GKM_API();
  final data_store = GetStorage();
  bool _passwordVisible = true;
  TextEditingController nama = TextEditingController();
  TextEditingController nohp = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController tanggallahir = TextEditingController();
  TextEditingController jeniskelamin = TextEditingController();

  TextEditingController nama2 = TextEditingController();
  TextEditingController nohp2 = TextEditingController();
  TextEditingController email2 = TextEditingController();
  TextEditingController tanggallahir2 = TextEditingController();
  TextEditingController jeniskelamin2 = TextEditingController();

  TextEditingController nama3 = TextEditingController();
  TextEditingController nohp3 = TextEditingController();
  TextEditingController email3 = TextEditingController();
  TextEditingController tanggallahir3 = TextEditingController();
  TextEditingController jeniskelamin3 = TextEditingController();

  // TextEditingController email1 = TextEditingController();
  // TextEditingController pass1 = TextEditingController();

  // TextEditingController email2 = TextEditingController();
  // TextEditingController pass2 = TextEditingController();
  var checkboxValue2 = false;
  TextEditingController kupon_value = TextEditingController();
  String id_kupon = "1";
  String desc_kupon = "";
  String nama_kupon = "";
  bool lockedForm = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width / 8,
              10, MediaQuery.of(context).size.width / 8, 10),
          child: Column(
            children: [
              Text(
                "Ticket Form",
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(
                height: 25,
              ),
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
                        Center(
                            child: Text(
                          "Data Pemegang Tiket 1 : ",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(child: Text("Name")),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: nama,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter your Name';
                            }
                            return null;
                          },
                          maxLines: 1,
                          //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          decoration: InputDecoration(
                            hintText: 'Enter your Name',
                            prefixIcon: const Icon(Icons.person),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(child: Text("Phone Number")),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: nohp,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter your Phone Number';
                            }
                            return null;
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          maxLines: 1,
                          // obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.phone),
                            hintText: 'Enter your Phone Number',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(child: Text("Email Address")),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: email,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter your Email Address';
                            }
                            return null;
                          },
                          maxLines: 1,
                          // obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.email),
                            hintText: 'Enter your Email Address',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(child: Text("Date of Birth")),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          onTap: () async {
                            DateTime? pickdate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1800),
                                lastDate: DateTime(2040));
                            if (pickdate != null) {
                              setState(() {
                                tanggallahir.text =
                                    DateFormat('yyyy-MM-dd').format(pickdate);
                              });
                            }
                          },
                          controller: tanggallahir,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter your Date of Birth';
                            }
                            return null;
                          },
                          maxLines: 1,
                          // obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.date_range_outlined),
                            hintText: 'Enter your Date of Birth',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(child: Text("Gender")),
                        const SizedBox(
                          height: 20,
                        ),
                        DropdownButton(
                          value: dropdownValue2,
                          items: <String>["Male", "Female"]
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
                                    dropdownValue2 = newValue!;
                                  });
                                },
                        ),
                        if (dropdownValue != "1") ...[
                          const SizedBox(
                            height: 30,
                          ),
                          Center(
                              child: Text(
                            "Data Pemegang Tiket 2 : ",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(child: Text("Name")),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: nama2,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter your Name';
                              }
                              return null;
                            },
                            maxLines: 1,
                            //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                            decoration: InputDecoration(
                              hintText: 'Enter your Name',
                              prefixIcon: const Icon(Icons.person),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(child: Text("Phone Number")),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: nohp2,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter your Phone Number';
                              }
                              return null;
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            maxLines: 1,
                            // obscureText: true,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.phone),
                              hintText: 'Enter your Phone Number',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(child: Text("Email Address")),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: email2,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter your Email Address';
                              }
                              return null;
                            },
                            maxLines: 1,
                            // obscureText: true,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.email),
                              hintText: 'Enter your Email Address',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(child: Text("Date of Birth")),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            onTap: () async {
                              DateTime? pickdate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1800),
                                  lastDate: DateTime(2040));
                              if (pickdate != null) {
                                setState(() {
                                  tanggallahir2.text =
                                      DateFormat('yyyy-MM-dd').format(pickdate);
                                });
                              }
                            },
                            controller: tanggallahir2,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter your Date of Birth';
                              }
                              return null;
                            },
                            maxLines: 1,
                            // obscureText: true,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.date_range_outlined),
                              hintText: 'Enter your Date of Birth',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(child: Text("Gender")),
                          const SizedBox(
                            height: 20,
                          ),
                          DropdownButton(
                            value: dropdownValue3,
                            items: <String>["Male", "Female"]
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
                                      dropdownValue3 = newValue!;
                                    });
                                  },
                          ),
                        ],
                        if (dropdownValue == "3") ...[
                          const SizedBox(
                            height: 30,
                          ),
                          Center(
                              child: Text(
                            "Data Pemegang Tiket 3 : ",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(child: Text("Name")),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: nama3,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter your Name';
                              }
                              return null;
                            },
                            maxLines: 1,
                            //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                            decoration: InputDecoration(
                              hintText: 'Enter your Name',
                              prefixIcon: const Icon(Icons.person),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(child: Text("Phone Number")),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: nohp3,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter your Phone Number';
                              }
                              return null;
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            maxLines: 1,
                            // obscureText: true,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.phone),
                              hintText: 'Enter your Phone Number',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(child: Text("Email Address")),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: email3,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter your Email Address';
                              }
                              return null;
                            },
                            maxLines: 1,
                            // obscureText: true,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.email),
                              hintText: 'Enter your Email Address',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(child: Text("Date of Birth")),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            onTap: () async {
                              DateTime? pickdate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1800),
                                  lastDate: DateTime(2040));
                              if (pickdate != null) {
                                setState(() {
                                  tanggallahir3.text =
                                      DateFormat('yyyy-MM-dd').format(pickdate);
                                });
                              }
                            },
                            controller: tanggallahir3,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter your Date of Birth';
                              }
                              return null;
                            },
                            maxLines: 1,
                            // obscureText: true,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.date_range_outlined),
                              hintText: 'Enter your Date of Birth',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(child: Text("Gender")),
                          const SizedBox(
                            height: 20,
                          ),
                          DropdownButton(
                            value: dropdownValue4,
                            items: <String>["Male", "Female"]
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
                                      dropdownValue4 = newValue!;
                                    });
                                  },
                          ),
                        ],
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                if (data_store.read("acara") == "GKM") {
                                  Get.defaultDialog(
                                      content: CircularProgressIndicator());
                                  int jumlah_ticket = int.parse(dropdownValue);
                                  List<String> namaList = <String>[];
                                  List<String> noList = <String>[];
                                  List<String> emailList = <String>[];
                                  List<String> tanggalList = <String>[];
                                  List<String> kelaminList = <String>[];
                                  namaList.add(nama.text);
                                  emailList.add(email.text);
                                  noList.add(nohp.text);
                                  tanggalList.add(tanggallahir.text);
                                  kelaminList.add(dropdownValue2);
                                  if (dropdownValue != "1") {
                                    namaList.add(nama2.text);
                                    emailList.add(email2.text);
                                    noList.add(nohp2.text);
                                    tanggalList.add(tanggallahir2.text);
                                    kelaminList.add(dropdownValue3);
                                  }
                                  if (dropdownValue == "3") {
                                    namaList.add(nama3.text);
                                    emailList.add(email3.text);
                                    noList.add(nohp3.text);
                                    tanggalList.add(tanggallahir3.text);
                                    kelaminList.add(dropdownValue4);
                                  }

                                  List<Map<String, Object>> data_send = [];
                                  for (int i = 0; i < jumlah_ticket; i++) {
                                    data_send.add({
                                      "nama_tiket": namaList.elementAt(i),
                                      "nomor_hp": noList.elementAt(i),
                                      "email": emailList.elementAt(i),
                                      "tanggal_lahir": tanggalList.elementAt(i),
                                      "jenis_kelamin": kelaminList.elementAt(i),
                                      "jenis_tiket":
                                          data_store.read('jenis_tiket'),
                                    });
                                  }
                                  var data = await _provider.post4(
                                      data_store.read('token'), data_send);
                                  if (data['status'] == "success") {
                                    Get.offAllNamed("/gkm/ticket_list");
                                  } else {
                                    Get.defaultDialog(
                                        content: Text(
                                            "Maksimum pembelian 3 tiket dalam 1 akun!"));
                                    Get.offAllNamed("/gkm");
                                  }
                                } else {
                                  Get.defaultDialog(
                                          content: Text(
                                              "Silahkan login ulang untuk akun khusus GKM!"))
                                      .then((value) =>
                                          Get.offAndToNamed("/gkm/loginpage"));
                                }
                              }
                            },
                            child: Text("Buy Ticket!"))
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
