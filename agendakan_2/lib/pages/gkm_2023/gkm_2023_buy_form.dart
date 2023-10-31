import 'package:agendakan_2/pages/gkm_2023/Repository/gkm_2023_api.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class GKM_2023_FORM extends StatefulWidget {
  const GKM_2023_FORM({super.key});

  @override
  State<GKM_2023_FORM> createState() => _GKM_2023_FORMState();
}

class _GKM_2023_FORMState extends State<GKM_2023_FORM> {
  int jumlahTiket = 1;
  bool lockedForm = false;
  bool ktpDone = false;
  bool VoucherDone = false;
  bool notLogin = false;
  bool isProcessRegister = true;
  List<DropdownMenuItem<int>> dropdownItems = [];
  TextEditingController noKtp = TextEditingController();
  TextEditingController kodeVoucher = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _formKeyAcc = GlobalKey<FormState>();
  TextEditingController emailAcc = TextEditingController();
  TextEditingController nameAcc = TextEditingController();
  TextEditingController passAcc = TextEditingController();

  TextEditingController nama = TextEditingController();
  TextEditingController nohp = TextEditingController();
  TextEditingController email = TextEditingController();

  TextEditingController nama2 = TextEditingController();
  TextEditingController nohp2 = TextEditingController();
  TextEditingController email2 = TextEditingController();

  TextEditingController nama3 = TextEditingController();
  TextEditingController nohp3 = TextEditingController();
  TextEditingController email3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var data_store = GetStorage();
    var token = data_store.read("token");
    if (token == null) {
      notLogin = true;
    }
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/form_bg.png'), repeat: ImageRepeat.repeat)),
        // color: Colors.grey.withOpacity(0.1),
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (notLogin) ...[
                Card(
                  margin: EdgeInsets.all(15),
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 800),
                    padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width / 16, 10,
                        MediaQuery.of(context).size.width / 16, 10),
                    child: Column(
                      children: [
                        if (isProcessRegister) ...[
                          const Text(
                            'Register Account',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ] else ...[
                          const Text(
                            'Login Account',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ],
                        const SizedBox(
                          height: 25,
                        ),
                        Form(
                          key: _formKeyAcc,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: emailAcc,
                                validator: (value) => EmailValidator.validate(value!)
                                    ? null
                                    : "Please enter a valid email",
                                maxLines: 1,
                                decoration: InputDecoration(
                                  hintText: 'Enter your email',
                                  prefixIcon: const Icon(Icons.email),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              if (isProcessRegister) ...[
                                TextFormField(
                                  controller: nameAcc,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your name';
                                    }
                                    return null;
                                  },
                                  maxLines: 1,
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
                              ],
                              TextFormField(
                                controller: passAcc,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  return null;
                                },
                                maxLines: 1,
                                obscureText: true,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.lock),
                                  hintText: 'Enter your password',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  if (_formKeyAcc.currentState!.validate()) {
                                    final _provider = GKM_2023_API();
                                    if (isProcessRegister) {
                                      var data = await _provider.register(
                                          emailAcc.text, nameAcc.text, passAcc.text, nameAcc.text);
                                      if (data['success'] == true) {
                                        var data =
                                            await _provider.login(emailAcc.text, passAcc.text);
                                        Get.snackbar(
                                          'Notification',
                                          "Registration Successfull",
                                          colorText: Colors.white,
                                          backgroundColor: Colors.green,
                                          icon: const Icon(Icons.add_alert),
                                        );
                                        setState(() {
                                          notLogin = false;
                                        });
                                      } else {
                                        Get.snackbar(
                                          'Notification',
                                          "Registration Failed, ${data['message']}",
                                          colorText: Colors.white,
                                          backgroundColor: Colors.red,
                                          icon: const Icon(Icons.add_alert),
                                        );
                                      }
                                    } else {
                                      var data = await _provider.login(emailAcc.text, passAcc.text);
                                      if (data['success'] == true) {
                                        Get.snackbar(
                                          'Notification',
                                          "Login Successfull",
                                          colorText: Colors.white,
                                          backgroundColor: Colors.green,
                                          icon: const Icon(Icons.add_alert),
                                        );
                                        setState(() {
                                          notLogin = false;
                                        });
                                      } else {
                                        Get.snackbar(
                                          'Notification',
                                          "Login Failed, ${data['message']}",
                                          colorText: Colors.white,
                                          backgroundColor: Colors.red,
                                          icon: const Icon(Icons.add_alert),
                                        );
                                      }
                                    }
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                                ),
                                child: (isProcessRegister)
                                    ? const Text(
                                        'Sign up',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    : const Text(
                                        'Sign in',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              if (isProcessRegister) ...[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text('Already registered?'),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          isProcessRegister = false;
                                        });
                                      },
                                      child: const Text('Sign in'),
                                    ),
                                  ],
                                ),
                              ] else ...[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text('Already have an account?'),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          isProcessRegister = true;
                                        });
                                      },
                                      child: const Text('Register here'),
                                    ),
                                  ],
                                ),
                              ]
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ] else ...[
                Card(
                  margin: EdgeInsets.all(15),
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 800),
                    padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width / 16, 10,
                        MediaQuery.of(context).size.width / 16, 10),
                    child: Column(
                      children: [
                        const Text(
                          "Ticket Form",
                          style: TextStyle(fontSize: 25),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "No ID (KTP / KTM / Paspor / SIM)  Pembeli : ",
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: TextFormField(
                                enabled: !ktpDone,
                                controller: noKtp,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter your identification number';
                                  }
                                  return null;
                                },
                                maxLines: 1,
                                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                decoration: InputDecoration(
                                  hintText: 'Enter your identification number',
                                  prefixIcon: const Icon(Icons.document_scanner),
                                  suffix: ktpDone
                                      ? const Icon(
                                          Icons.check,
                                          color: Colors.green,
                                        )
                                      : null,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            ElevatedButton(
                                onPressed: ktpDone
                                    ? null
                                    : () async {
                                        if (noKtp.text == '') {
                                          Get.snackbar(
                                            'Notification',
                                            "Tolong isi No KTP terlebih dahulu",
                                            colorText: Colors.white,
                                            backgroundColor: Colors.red,
                                            icon: const Icon(Icons.add_alert),
                                          );
                                        } else {
                                          final _provider = GKM_2023_API();
                                          dynamic data = await _provider.cekID(noKtp.text);
                                          if (data != null) {
                                            if (data['jumlah'] > 0) {
                                              Get.snackbar(
                                                'Notification',
                                                "ID bisa digunakan untuk membeli ${data['jumlah']} ticket",
                                                colorText: Colors.white,
                                                backgroundColor: Colors.green,
                                                icon: const Icon(Icons.add_alert),
                                              );
                                              for (var i = 1; i <= data['jumlah']; i++) {
                                                if (i == 1) {
                                                  jumlahTiket = i;
                                                }
                                                var newItem = DropdownMenuItem(
                                                  child: Text(i.toString()),
                                                  value: i,
                                                );
                                                dropdownItems.add(newItem);
                                              }
                                              setState(() {
                                                ktpDone = true;
                                              });
                                            } else {
                                              Get.snackbar(
                                                'Notification',
                                                "ID tidak bisa digunakan untuk membeli ticket",
                                                colorText: Colors.white,
                                                backgroundColor: Colors.red,
                                                icon: const Icon(Icons.add_alert),
                                              );
                                            }
                                          }
                                        }
                                      },
                                child: const Text('   Check ID   ')),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        // dev mute
                        if (ktpDone) ...[
                          // if (true) ...[
                          // Form Voucher
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Kode Referral (Opsional) :",
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: TextFormField(
                                  enabled: !VoucherDone,
                                  controller: kodeVoucher,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Enter code number';
                                    }
                                    return null;
                                  },
                                  maxLines: 1,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]")),
                                  ],
                                  decoration: InputDecoration(
                                    hintText: 'Enter code number',
                                    prefixIcon: const Icon(Icons.document_scanner),
                                    suffix: VoucherDone
                                        ? const Icon(
                                            Icons.check,
                                            color: Colors.green,
                                          )
                                        : null,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 25,
                              ),
                              ElevatedButton(
                                  onPressed: VoucherDone
                                      ? null
                                      : () async {
                                          if (kodeVoucher.text == '') {
                                            Get.snackbar(
                                              'Notification',
                                              "Tolong isi kode referral terlebih dahulu",
                                              colorText: Colors.white,
                                              backgroundColor: Colors.red,
                                              icon: const Icon(Icons.add_alert),
                                            );
                                          } else {
                                            final _provider = GKM_2023_API();
                                            dynamic data =
                                                await _provider.cekRefCode(kodeVoucher.text);
                                            Get.back(closeOverlays: true);
                                            if (data != null) {
                                              if (data['status'] == 'ok') {
                                                Get.snackbar(
                                                  'Notification',
                                                  "Kode referral ${kodeVoucher.text} tersedia!",
                                                  colorText: Colors.white,
                                                  backgroundColor: Colors.green,
                                                  icon: const Icon(Icons.add_alert),
                                                );
                                                setState(() {
                                                  VoucherDone = true;
                                                });
                                              } else {
                                                Get.snackbar(
                                                  'Notification',
                                                  "Kode tidak ditemukan!",
                                                  colorText: Colors.white,
                                                  backgroundColor: Colors.red,
                                                  icon: const Icon(Icons.add_alert),
                                                );
                                              }
                                            }
                                          }
                                        },
                                  child: const Text('Check Kode')),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          // Form Pembelian
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "Jumlah Ticket yg Dibeli",
                                style: TextStyle(fontSize: 12),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              DropdownButton(
                                value: jumlahTiket,
                                items: dropdownItems,
                                onChanged: (int? value) {
                                  setState(() {
                                    jumlahTiket = value!;
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
                                    const Center(
                                        child: Text(
                                      "Data Pembeli 1 : ",
                                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
                                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                                    if (jumlahTiket != 1) ...[
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      const Center(
                                          child: Text(
                                        "Data Pembeli 2 : ",
                                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
                                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                                    ],
                                    if (jumlahTiket == 3) ...[
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      const Center(
                                          child: Text(
                                        "Data Pembeli 3 : ",
                                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
                                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                                    ],
                                    ElevatedButton(
                                        onPressed: () async {
                                          if (_formKey.currentState!.validate()) {
                                            if (data_store.read("acara") == "GKM 2023") {
                                              int jumlah_ticket = jumlahTiket;
                                              List<String> namaList = <String>[];
                                              List<String> noList = <String>[];
                                              List<String> emailList = <String>[];
                                              namaList.add(nama.text);
                                              emailList.add(email.text);
                                              noList.add(nohp.text);
                                              if (jumlahTiket != 1) {
                                                namaList.add(nama2.text);
                                                emailList.add(email2.text);
                                                noList.add(nohp2.text);
                                              }
                                              if (jumlahTiket == 3) {
                                                namaList.add(nama3.text);
                                                emailList.add(email3.text);
                                                noList.add(nohp3.text);
                                              }

                                              List<Map<String, Object>> data_send = [];
                                              for (int i = 0; i < jumlah_ticket; i++) {
                                                data_send.add({
                                                  "nama_tiket": namaList.elementAt(i),
                                                  "nomor_hp": noList.elementAt(i),
                                                  "email": emailList.elementAt(i),
                                                  "jenis_tiket": data_store.read('jenis_tiket'),
                                                });
                                              }

                                              // voucher submit with voucher otw
                                              // harus tambahin if voucher check done
                                              var form_data;
                                              if (VoucherDone) {
                                                form_data = {
                                                  'kode_voucher': kodeVoucher.text,
                                                  'nomor_ktp': noKtp.text,
                                                  'data': data_send
                                                };
                                              } else {
                                                form_data = {
                                                  'nomor_ktp': noKtp.text,
                                                  'data': data_send
                                                };
                                              }

                                              final _provider = GKM_2023_API();
                                              var data =
                                                  await _provider.submitPembelian(token, form_data);
                                              print(data);
                                              if (data != null) {
                                                if (data['status'] == 'success') {
                                                  Get.snackbar(
                                                    'Notification',
                                                    "Checkout Successfull",
                                                    colorText: Colors.white,
                                                    backgroundColor: Colors.green,
                                                    icon: const Icon(Icons.add_alert),
                                                  );
                                                  Get.toNamed("/gkm/ticket_list");
                                                }
                                              } else {
                                                Get.snackbar(
                                                  'Notification',
                                                  "Checkout Failed, ${data['message']}",
                                                  colorText: Colors.white,
                                                  backgroundColor: Colors.red,
                                                  icon: const Icon(Icons.add_alert),
                                                );
                                              }
                                            } else {
                                              print('Validasi Acara');
                                            }
                                          }
                                        },
                                        child: Text("Buy Ticket!"))
                                  ],
                                )),
                          )
                        ],
                      ],
                    ),
                  ),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
