import 'package:agendakan_2/pages/oase/BuyTicket.dart';
import 'package:agendakan_2/plugins/AvailabilityTicket.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';

class TicketsPage extends StatefulWidget {
  const TicketsPage({Key? key}) : super(key: key);

  @override
  State<TicketsPage> createState() => _TicketsPageState();
}

class _TicketsPageState extends State<TicketsPage> {
  final data_store = GetStorage();
  GlobalKey<ScaffoldState> _key = GlobalKey();
  final CheckTicket ticketControl = Get.put(CheckTicket());

  final snkTiket =
      "1. Tiket resmi hanya di dapat dibeli melalui agendakan.com\n\n2. Jumlah tiket dan kapasitas yang tersedia adalah TERBATAS.\n\n3. Penjualan tiket dilakukan berdasarkan sistem pembelian tercepat.\n\n4. Promosi harga tiket TIDAK BISA digabungkan.\n\n5. Pembelian tiket MINIMAL 2 orang (1 tiket berlaku untuk 2 orang).\n\n6. Pembelian tiket untuk 3 orang bisa dilakukan dengan cara sebelum check-out ditambahkan tiket add-on 1 orang seharga tiket normal.\n\n7. Anak berusia 7 tahun keatas dikenakan biaya satu tiket masuk penuh dan WAJIB didampingi orang tua atau orang dewasa.\n\n8. Masing-masing tiket yang dibeli WAJIB didaftarkan dengan menyertakan nama, NIK dan data diri pribadi penggunanya yang sah dan berlaku berdasarkan Dokumen Identitas Resmi (KTP/ KIA/Kartu Pelajar/KITAS/Paspor).\n\n9. Setelah pengisian identitas dikonfirmasi oleh tim kami, harap melunasi pembayaran tiket sesuai dengan tenggat waktu yang sudah tertera di webpage pembayaran.\n\n10. Saat melakukan pembayaran/pelunasan tiket jangan lupa menyertai deskripsi/berita dengan nama kalian.\n\n11. Setelah pembayaran dikonfirmasi, E-ticket akan dikirimkan ke email yang terdaftar maksimal 1x24 jam setelah pembayaran.\n\n12. Pembelian dengan menggunakan kartu kredit atau bank transfer dapat dikenakan biaya administrasi.\n\n13. Pembeli tiket berusia 12 tahun ke atas WAJIB telah menerima Vaksin COVID-19 dosis primer lengkap sebagaimana tercantum melalui masing-masing akun pengguna tiket/pengunjung dalam aplikasi PeduliLindungi.\n\n14. Untuk memasuki tempat acara, pengguna tiket/pengunjung HARUS menyediakan aplikasi PeduliLindungi pengguna tiket/pengunjung dengan status HIJAU.\n\n15. Penyelenggara menganggap data yang tercantum dalam PeduliLindungi pengunjung/pengguna tiket adalah benar dan sah. Apabila terdapat ketidak akuratan dan/atau ketidaksesuaian data yang tercantum dalam PeduliLindungi dengan kondisi sebenarnya, maka hal tersebut menjadi tanggung jawab pribadi dari pengunjung/pengguna tiket. Pengunjung/pengguna tiket dengan ini membebaskan Penyelenggara dari segala tuntutan dan/atau kewajiban yang timbul dari ketidakakuratan dan/atau ketidaksesuaian data di PeduliLindungi.\n\n16. Pengguna tiket/pengunjung acara WAJIB mematuhi seluruh protokol kesehatan dan prosedur kenormalan baru sesuai peraturan perundangan-undangan yang berlaku, termasuk namun tidak terbatas pada Keputusan Menteri Kesehatan Republik Indonesia Nomor HK.01.07/Menkes/382/2020 Tentang Protokol Kesehatan Bagi Masyarakat di Tempat dan Fasilitas Umum Dalam Rangka Pencegahan dan Pengendalian CoronaVirus Disease 2019 beserta perubahan-perubahan dan/atau peraturan terkait lainnya yang berlaku dan yang mungkin akan diterbitkan di kemudian hari.\n\n17. Kebijakan Tiket Acara dan Syarat dan Ketentuan untuk Acara, khususnya yang berkaitan dengan COVID-19 dapat berubah sewaktu waktu sesuai dengan ketetapan dan/atau aturan Pemerintah.\n\n18. Pengguna tiket/pengunjung acara menyadari penuh resiko akan COVID-19 di tempat umum tempat dimana acara diselenggarakan dan bertanggung jawab penuh atas dirinya sendiri dan oleh karenanya melepaskan seluruh tanggung jawab serta membebaskan Penyelenggara dari segala tuntutan dan/atau kerugian yang mungkin timbul akibat risiko COVID-19 dan terbitnya peraturan-peraturan baru yang berkaitan dengan COVID-19.\n\n19. E-tiket menggunakan kode QR unik, digunakan untuk SATU KALI penggunaan dan HANYA berlaku untuk satu orang. (Setiap pembeli tiket akan mendapatkan e-tiket melalui email. E-tiket menggunakan kode QR unik, digunakan untuk SATU KALI penggunaan dan HANYA berlaku untuk satu orang).\n\n20. Pengguna tiket secara hukum hanya berhak untuk menggunakan e-ticket sebanyak 1 kali. Menduplikasi e-tiket tidak diperbolehkan dan ilegal. (Pemilik e-tiket secara hukum hanya berhak untuk menggunakan e-ticket sebanyak 1 kali. Menduplikasi e-tiket tidak diperbolehkan dan ilegal).\n\n21. Penyelenggara TIDAK bertanggung jawab atas kelalaian pembeli / pemilik tiket yang mengakibatkan tiket jatuh ke tangan orang lain (dalam penguasaan orang lain) untuk digunakan sebagai tanda masuk ke tempat pertunjukan atau menukarkan tiket yang menghilangkan hak pembeli untuk masuk ke tempat pertunjukan/ menukarkan.\n\n22. Penyelenggara dan artis TIDAK bertanggung jawab atas kompensasi dan/atau biaya pembatalan untuk biaya perjalanan yang anda keluarkan apabila festival/acara yang dibatalkan/ditunda.\n\n23. Tiket yang sudah dibeli TIDAK dapat ditukar ataupun diuangkan kembali atas dasar alasan apapun.\n\n24. Pembeli dan pengguna tiket dengan ini menyatakan melepaskan segala hak hukumnya untuk mengajukan tuntutan balik melalui pengadilan atau cara-cara apapun yang diperkenankan secara hukum untuk menuntut Penyelenggara dalam hal terjadi pembatalan acara yang dilakukan secara sepihak oleh pihak artis atau pemerintah atau sebab-sebab lain di luar kemampuan dan kehendak pihak Penyelenggara.\n\n25. Seluruh pembeli tiket dan pengunjung dianggap telah membaca, memahami, dan menyetujui Syarat dan Ketentuan untuk event SIGNATUREÈ 2022.\n\n26. Untuk pemegang tiket early entry, waktu open gate dan close gate akan lebih awal dibanding pemegang tiket reguler. Jika pemegang tiket tersebut masuk setelah batas waktu close gate, akan dikenakan biaya sebesar selisih harga tiket early entry dan reguler.";
  final descTicket =
      "1. Bucket Piknik berisi snack dan minuman\n2. Entertainment Musik dari para Guest Star kami\n3. Souvenir unik yang bisa kamu bawa pulang, pajang, dan kenang di kehidupanmu yang singkat ini\n4. Tempat dan konten untuk healing\n5. One-stop-solution untuk refreshing dari rumitnya kesibukanmu yang gitu-gitu aja\n6. Melepas penat lewat pemandangan Kota Batu";
  @override
  Widget build(BuildContext context) {
    ticketControl.checkAllTicket();
    return Scaffold(
      key: _key,
      endDrawer: Drawer(
        backgroundColor: Color(0xffF7EDE5),
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: Row(
                children: [
                  Spacer(),
                  Container(
                    height: 90,
                    child: Image(
                      image: AssetImage("images/icon-01.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "X",
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        fontSize: 30),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 40,
                    child: Image(
                      image: AssetImage("images/signature.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(top: BorderSide(), bottom: BorderSide())),
              child: ListTile(
                title: Center(
                    child: Text(
                  "HOME",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Syne',
                      fontWeight: FontWeight.w800),
                )),
                onTap: () {
                  Get.offAllNamed("/SignatureeFestival");
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(border: Border(bottom: BorderSide())),
              child: ListTile(
                title: Center(
                    child: Text(
                  "GUEST STAR",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Syne',
                      fontWeight: FontWeight.w800),
                )),
                onTap: () {
                  Get.offAllNamed("/SignatureeFestival/gueststar");
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(border: Border(bottom: BorderSide())),
              child: ListTile(
                title: Center(
                    child: Text(
                  "TICKET",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Syne',
                      fontWeight: FontWeight.w800),
                )),
                // onTap: () {
                //   Get.offAllNamed("/SignatureeFestival/tickets");
                // },
              ),
            ),
            Container(
              decoration: BoxDecoration(border: Border(bottom: BorderSide())),
              child: ListTile(
                title: Center(
                    child: Text(
                  "CONTACT US",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Syne',
                      fontWeight: FontWeight.w800),
                )),
                onTap: () {
                  Get.offAllNamed("/SignatureeFestival/contactus");
                },
              ),
            ),
            if (data_store.read("token") != null) ...[
              Container(
                decoration: BoxDecoration(border: Border(bottom: BorderSide())),
                child: ListTile(
                  title: Center(
                      child: Text(
                    "TICKET LIST",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Syne',
                        fontWeight: FontWeight.w800),
                  )),
                  onTap: () {
                    if (data_store.read("isAdmin") == 1) {
                      Get.offAndToNamed('/ticketlistAdmin');
                    } else {
                      Get.offAndToNamed('/ticketlist');
                    }
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(border: Border(bottom: BorderSide())),
                child: ListTile(
                  title: Center(
                      child: Text(
                    "LOG OUT",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Syne',
                        fontWeight: FontWeight.w800),
                  )),
                  onTap: () {
                    data_store.remove('token');
                    data_store.remove('isAdmin');
                    Get.offAllNamed("/SignatureeFestival");
                  },
                ),
              ),
            ] else ...[
              Container(
                decoration: BoxDecoration(border: Border(bottom: BorderSide())),
                child: ListTile(
                  title: Center(
                      child: Text(
                    "LOG IN",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Syne',
                        fontWeight: FontWeight.w800),
                  )),
                  onTap: () {
                    Get.offAllNamed("/loginpage");
                  },
                ),
              ),
            ],
            SizedBox(
              height: 30,
            ),
            ListTile(
              // alignment: Alignment.center,
              title: Text(
                "© 2021 - 2022 agendakan.com | All right reserved",
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
          child: ticketControl.obx(
              (state) => Column(
                    children: [
                      //Nav Bar
                      if (MediaQuery.of(context).size.width <= 1100) ...[
                        Container(
                          child: Row(children: [
                            Spacer(),
                            InkWell(
                              onTap: () {
                                Get.offAllNamed("/");
                              },
                              child: Row(
                                children: [
                                  Container(
                                    child: Image(
                                      image: AssetImage("images/icon-01.png"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "X",
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 30),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    height: 40,
                                    child: Image(
                                      image: AssetImage("images/signature.png"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            InkWell(
                                onTap: () {
                                  _key.currentState?.openEndDrawer();
                                  //Scaffold.of(context).openEndDrawer();
                                },
                                child: Container(child: Icon(Icons.menu))),
                            SizedBox(
                              width: 20,
                            )
                          ]),
                          color: Color(0xffF5F5E9),
                          height: MediaQuery.of(context).size.height / 12,
                          constraints: BoxConstraints(maxHeight: 100),
                        )
                      ] else ...[
                        Container(
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.offAllNamed("/");
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      child: Image(
                                        image: AssetImage("images/icon-01.png"),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "X",
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 30),
                                    ),
                                    SizedBox(
                                      width: 40,
                                    ),
                                    Container(
                                      height: 60,
                                      child: Image(
                                        image:
                                            AssetImage("images/signature.png"),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              InkWell(
                                child: Text(
                                  "HOME",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Syne',
                                    // fontWeight: FontWeight.w700,
                                  ),
                                ),
                                onTap: () {
                                  Get.offAllNamed("/SignatureeFestival");
                                },
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              InkWell(
                                child: Text(
                                  "GUEST STAR",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Syne',
                                  ),
                                ),
                                onTap: () {
                                  Get.offAllNamed(
                                      "/SignatureeFestival/gueststar");
                                },
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              InkWell(
                                child: Text(
                                  "TICKET",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Syne',
                                  ),
                                ),
                                onTap: () {
                                  Get.offAllNamed(
                                      "/SignatureeFestival/tickets");
                                },
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              InkWell(
                                child: Text(
                                  "CONTACT US",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Syne',
                                  ),
                                ),
                                onTap: () {
                                  Get.offAllNamed(
                                      "/SignatureeFestival/contactus");
                                },
                              ),
                              Spacer(),
                              if (data_store.read("token") != null) ...[
                                InkWell(
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "TICKET",
                                          style: TextStyle(
                                            color: Color(0xffF05930)
                                                .withOpacity(0.75),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w800,
                                            fontFamily: 'Syne',
                                          ),
                                        ),
                                        Text(
                                          "LIST",
                                          style: TextStyle(
                                            color: Color(0xffF05930)
                                                .withOpacity(0.75),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w800,
                                            fontFamily: 'Syne',
                                          ),
                                        ),
                                      ],
                                    ),
                                    width: 150,
                                    color: Colors.white.withOpacity(0.5),
                                  ),
                                  onTap: () {
                                    if (data_store.read("isAdmin") == 1) {
                                      Get.offAndToNamed('/ticketlistAdmin');
                                    } else {
                                      Get.offAndToNamed('/ticketlist');
                                    }
                                  },
                                ),
                                InkWell(
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "LOG OUT",
                                          style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.75),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w800,
                                            fontFamily: 'Syne',
                                          ),
                                        ),
                                      ],
                                    ),
                                    width: 150,
                                    color: Color(0xffF05930),
                                  ),
                                  onTap: () {
                                    data_store.remove('token');
                                    data_store.remove('isAdmin');
                                    Get.offAllNamed("/SignatureeFestival");
                                  },
                                )
                              ] else ...[
                                InkWell(
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "LOG IN /",
                                          style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.75),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w800,
                                            fontFamily: 'Syne',
                                          ),
                                        ),
                                        Text(
                                          "SIGN UP",
                                          style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.75),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w800,
                                            fontFamily: 'Syne',
                                          ),
                                        )
                                      ],
                                    ),
                                    width: 150,
                                    color: Color(0xffF05930),
                                  ),
                                  onTap: () {
                                    Get.offAllNamed("/loginpage");
                                  },
                                )
                              ],
                            ],
                          ),
                          color: Color(0xffF5F5E9),
                          height: MediaQuery.of(context).size.height / 12,
                          constraints: BoxConstraints(maxHeight: 100),
                        ),
                      ],
                      if (MediaQuery.of(context).size.width <= 1100) ...[
                        //mobile
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                                height: 30,
                                image: AssetImage("images/flwr.png")),
                            SizedBox(
                              width: 40,
                            ),
                            Text(
                              "TICKETING",
                              style: TextStyle(
                                  fontSize: 35,
                                  fontFamily: 'Syne',
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xffF05D34)),
                            ),
                            // Image(image: AssetImage("images/header_gs_page.png")),
                            SizedBox(
                              width: 40,
                            ),
                            Image(
                                height: 30,
                                image: AssetImage("images/arw.png")),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 5 * 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Kamu bakal dapet apa aja dari tiket kamu?",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Syne',
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.justify,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 20),
                                child: Text(
                                  descTicket,
                                  style: TextStyle(
                                      fontSize: 15, fontFamily: 'Syne'),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        InkWell(
                          // onTap: (ticketControl.data['early-bird'])
                          //     ? () {
                          //         data_store.write("jenis_tiket", "early-bird");
                          //         beliTicket(context, snkTiket);
                          //       }
                          //     : null,
                          onTap: () =>
                              buyWidget(ticketControl.data['early-bird'], 1),
                          child: Container(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (ticketControl.data['early-bird'] !=
                                    "tutup") ...[
                                  Text(
                                    "Early Bird",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.5),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Syne'),
                                  ),
                                  Text(
                                    "Rp. 500.000",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.5),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Syne'),
                                  ),
                                  Text(
                                    "(for 2 people)",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.5),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Syne'),
                                  ),
                                ],
                                if (ticketControl.data['early-bird'] ==
                                    "tutup") ...[
                                  Text(
                                    "Coming Soon",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.5),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Syne'),
                                  ),
                                ],
                              ],
                            ),
                            constraints: BoxConstraints(maxWidth: 300),
                            width: MediaQuery.of(context).size.width / 5 * 3,
                            height: 120,
                            decoration: decorationTicket(
                                ticketControl.data['early-bird'].toString()),
                            // decoration: BoxDecoration(
                            //     // color: Colors.grey,
                            //     color: (ticketControl.data['early-bird'])
                            //         ? Colors.grey
                            //         : Colors.grey.withOpacity(0.5),
                            //     image: (ticketControl.data['early-bird'])
                            //         ? null
                            //         : DecorationImage(
                            //             image:
                            //                 AssetImage("images/sold_out.png")),
                            //     borderRadius:
                            //         BorderRadius.all(Radius.circular(20))),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        InkWell(
                          // onTap: (ticketControl.data['early-entry'])
                          //     ? () {
                          //         data_store.write(
                          //             "jenis_tiket", "early-entry");
                          //         beliTicket(context, snkTiket);
                          //       }
                          //     : null,
                          onTap: () =>
                              buyWidget(ticketControl.data['early-entry'], 2),
                          child: Container(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (ticketControl.data['early-entry'] !=
                                    "tutup") ...[
                                  Text(
                                    "Early Entry",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.5),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Syne'),
                                  ),
                                  Text(
                                    "Rp. 560.000",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.5),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Syne'),
                                  ),
                                  Text(
                                    "(for 2 people)",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.5),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Syne'),
                                  ),
                                ],
                                if (ticketControl.data['early-entry'] ==
                                    "tutup") ...[
                                  Text(
                                    "Coming Soon",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.5),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Syne'),
                                  ),
                                ],
                              ],
                            ),
                            constraints: BoxConstraints(maxWidth: 300),
                            width: MediaQuery.of(context).size.width / 5 * 3,
                            height: 120,
                            decoration: decorationTicket(
                                ticketControl.data['early-entry'].toString()),
                            // decoration: BoxDecoration(
                            //     // color: Colors.grey,
                            //     color: (ticketControl.data['early-entry'])
                            //         ? Colors.grey
                            //         : Colors.grey.withOpacity(0.5),
                            //     image: (ticketControl.data['early-entry'])
                            //         ? null
                            //         : DecorationImage(
                            //             image:
                            //                 AssetImage("images/sold_out.png")),
                            //     borderRadius:
                            //         BorderRadius.all(Radius.circular(20))),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        InkWell(
                          // onTap: (ticketControl.data['presale1'])
                          //     ? () {
                          //         data_store.write("jenis_tiket", "presale1");
                          //         beliTicket(context, snkTiket);
                          //       }
                          //     : null,
                          onTap: () =>
                              buyWidget(ticketControl.data['presale1'], 3),
                          child: Container(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (ticketControl.data['presale1'] !=
                                    "tutup") ...[
                                  Text(
                                    "Presale 1",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.5),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Syne'),
                                  ),
                                  Text(
                                    "Rp. 630.000",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.5),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Syne'),
                                  ),
                                  Text(
                                    "(for 2 people)",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.5),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Syne'),
                                  ),
                                ],
                                if (ticketControl.data['presale1'] ==
                                    "tutup") ...[
                                  Text(
                                    "Coming Soon",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.5),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Syne'),
                                  ),
                                ],
                              ],
                            ),
                            constraints: BoxConstraints(maxWidth: 300),
                            width: MediaQuery.of(context).size.width / 5 * 3,
                            height: 120,
                            decoration: decorationTicket(
                                ticketControl.data['presale1'].toString()),
                            // decoration: BoxDecoration(
                            //     // color: Colors.grey,
                            //     color: (ticketControl.data['presale1'])
                            //         ? Colors.grey
                            //         : Colors.grey.withOpacity(0.5),
                            //     image: (ticketControl.data['presale1'])
                            //         ? null
                            //         : DecorationImage(
                            //             image:
                            //                 AssetImage("images/sold_out.png")),
                            //     borderRadius:
                            //         BorderRadius.all(Radius.circular(20))),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        //presale 2
                        InkWell(
                          // onTap: (ticketControl.data['presale1'])
                          //     ? () {
                          //         data_store.write("jenis_tiket", "presale1");
                          //         beliTicket(context, snkTiket);
                          //       }
                          //     : null,
                          onTap: () =>
                              buyWidget(ticketControl.data['presale2'], 4),
                          child: Container(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (ticketControl.data['presale2'] !=
                                    "tutup") ...[
                                  Text(
                                    "Presale 2",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.5),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Syne'),
                                  ),
                                  Text(
                                    "Rp. 670.000",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.5),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Syne'),
                                  ),
                                  Text(
                                    "(for 2 people)",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.5),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Syne'),
                                  ),
                                ],
                                if (ticketControl.data['presale2'] ==
                                    "tutup") ...[
                                  Text(
                                    "Coming Soon",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.5),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Syne'),
                                  ),
                                ],
                              ],
                            ),
                            constraints: BoxConstraints(maxWidth: 300),
                            width: MediaQuery.of(context).size.width / 5 * 3,
                            height: 120,
                            decoration: decorationTicket(
                                ticketControl.data['presale2'].toString()),
                            // decoration: BoxDecoration(
                            //     // color: Colors.grey,
                            //     color: (ticketControl.data['presale1'])
                            //         ? Colors.grey
                            //         : Colors.grey.withOpacity(0.5),
                            //     image: (ticketControl.data['presale1'])
                            //         ? null
                            //         : DecorationImage(
                            //             image:
                            //                 AssetImage("images/sold_out.png")),
                            //     borderRadius:
                            //         BorderRadius.all(Radius.circular(20))),
                          ),
                        ),
                        //coming soon lawas presale 2
                        // InkWell(
                        //   child: Container(
                        //     alignment: Alignment.center,
                        //     child: Text(
                        //       "Coming Soon",
                        //       style: TextStyle(
                        //           color: Colors.black.withOpacity(0.5),
                        //           fontSize: 20,
                        //           fontWeight: FontWeight.w700,
                        //           fontFamily: 'Syne'),
                        //     ),
                        //     constraints: BoxConstraints(maxWidth: 300),
                        //     width: MediaQuery.of(context).size.width / 5 * 3,
                        //     height: 120,
                        //     decoration: BoxDecoration(
                        //         color: Colors.grey.withOpacity(0.5),
                        //         borderRadius:
                        //             BorderRadius.all(Radius.circular(20))),
                        //   ),
                        // ),
                        SizedBox(
                          height: 50,
                        ),
                      ] else ...[
                        //web
                        SizedBox(
                          height: 200,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(image: AssetImage("images/flwr.png")),
                            SizedBox(
                              width: 60,
                            ),
                            Text(
                              "TICKETING",
                              style: TextStyle(
                                  fontSize: 60,
                                  fontFamily: 'Syne',
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xffF05D34)),
                            ),
                            // Image(image: AssetImage("images/header_gs_page.png")),
                            SizedBox(
                              width: 60,
                            ),
                            Image(image: AssetImage("images/arw.png")),
                          ],
                        ),
                        SizedBox(
                          height: 130,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 4 * 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Kamu bakal dapet apa aja dari tiket kamu?",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontFamily: 'Syne',
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.justify,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 40),
                                child: Text(
                                  descTicket,
                                  style: TextStyle(
                                      fontSize: 24, fontFamily: 'Syne'),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 125,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              // onTap: (ticketControl.data['early-bird'])
                              //     ? () {
                              //         data_store.write(
                              //             "jenis_tiket", "early-bird");
                              //         beliTicket(context, snkTiket);
                              //       }
                              //     : null,
                              onTap: () => buyWidget(
                                  ticketControl.data['early-bird'], 1),
                              child: Container(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (ticketControl.data['early-bird'] !=
                                        "tutup") ...[
                                      Text(
                                        "Early Bird",
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            fontSize: 30,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'Syne'),
                                      ),
                                      Text(
                                        "Rp. 500.000",
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            fontSize: 30,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'Syne'),
                                      ),
                                      Text(
                                        "(for 2 people)",
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'Syne'),
                                      ),
                                    ],
                                    if (ticketControl.data['early-bird'] ==
                                        "tutup") ...[
                                      Text(
                                        "Coming Soon",
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            fontSize: 40,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'Syne'),
                                      ),
                                    ],
                                  ],
                                ),
                                width: 350,
                                height: 150,
                                decoration: decorationTicket(ticketControl
                                    .data['early-bird']
                                    .toString()),
                                // decoration: BoxDecoration(
                                //     // color: Colors.grey,
                                //     color: (ticketControl.data['early-bird'])
                                //         ? Colors.grey
                                //         : Colors.grey.withOpacity(0.5),
                                //     image: (ticketControl.data['early-bird'])
                                //         ? null
                                //         : DecorationImage(
                                //             image: AssetImage(
                                //                 "images/sold_out.png")),
                                //     borderRadius:
                                //         BorderRadius.all(Radius.circular(20))),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            InkWell(
                              // onTap: (ticketControl.data['early-entry'])
                              //     ? () {
                              //         data_store.write(
                              //             "jenis_tiket", "early-entry");
                              //         beliTicket(context, snkTiket);
                              //       }
                              //     : null,
                              // onTap: () {

                              // },
                              onTap: () => buyWidget(
                                  ticketControl.data['early-entry'], 2),
                              child: Container(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (ticketControl.data['early-entry'] !=
                                        "tutup") ...[
                                      Text(
                                        "Early Entry",
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            fontSize: 30,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'Syne'),
                                      ),
                                      Text(
                                        "Rp. 560.000",
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            fontSize: 30,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'Syne'),
                                      ),
                                      Text(
                                        "(for 2 people)",
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'Syne'),
                                      ),
                                    ],
                                    if (ticketControl.data['early-entry'] ==
                                        "tutup") ...[
                                      Text(
                                        "Coming Soon",
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            fontSize: 40,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'Syne'),
                                      ),
                                    ],
                                  ],
                                ),
                                width: 350,
                                height: 150,
                                decoration: decorationTicket(ticketControl
                                    .data['early-entry']
                                    .toString()),
                                // decoration: BoxDecoration(
                                //     // color: Colors.grey,
                                //     color: (ticketControl.data['early-entry'])
                                //         ? Colors.grey
                                //         : Colors.grey.withOpacity(0.5),
                                //     image: (ticketControl.data['early-entry'])
                                //         ? null
                                //         : DecorationImage(
                                //             image: AssetImage(
                                //                 "images/sold_out.png")),
                                //     borderRadius:
                                //         BorderRadius.all(Radius.circular(20))),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              // onTap: (ticketControl.data['presale1'])
                              //     ? () {
                              //         data_store.write(
                              //             "jenis_tiket", "presale1");
                              //         beliTicket(context, snkTiket);
                              //       }
                              //     : null,
                              onTap: () =>
                                  buyWidget(ticketControl.data['presale1'], 3),
                              child: Container(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (ticketControl.data['presale1'] !=
                                        "tutup") ...[
                                      Text(
                                        "Presale 1",
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            fontSize: 30,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'Syne'),
                                      ),
                                      Text(
                                        "Rp. 630.000",
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            fontSize: 30,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'Syne'),
                                      ),
                                      Text(
                                        "(for 2 people)",
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'Syne'),
                                      ),
                                    ],
                                    if (ticketControl.data['presale1'] ==
                                        "tutup") ...[
                                      Text(
                                        "Coming Soon",
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            fontSize: 40,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'Syne'),
                                      ),
                                    ],
                                  ],
                                ),
                                width: 350,
                                height: 150,
                                decoration: decorationTicket(
                                    ticketControl.data['presale1'].toString()),
                                // decoration: BoxDecoration(
                                //     // color: Colors.grey,
                                //     color: (ticketControl.data['presale1'])
                                //         ? Colors.grey
                                //         : Colors.grey.withOpacity(0.5),
                                //     image: (ticketControl.data['presale1'])
                                //         ? null
                                //         : DecorationImage(
                                //             image: AssetImage(
                                //                 "images/sold_out.png")),
                                //     borderRadius:
                                //         BorderRadius.all(Radius.circular(20))),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            //presale 2
                            InkWell(
                              // onTap: (ticketControl.data['presale1'])
                              //     ? () {
                              //         data_store.write(
                              //             "jenis_tiket", "presale1");
                              //         beliTicket(context, snkTiket);
                              //       }
                              //     : null,
                              onTap: () =>
                                  buyWidget(ticketControl.data['presale2'], 4),
                              child: Container(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (ticketControl.data['presale2'] !=
                                        "tutup") ...[
                                      Text(
                                        "Presale 2",
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            fontSize: 30,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'Syne'),
                                      ),
                                      Text(
                                        "Rp. 670.000",
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            fontSize: 30,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'Syne'),
                                      ),
                                      Text(
                                        "(for 2 people)",
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'Syne'),
                                      ),
                                    ],
                                    if (ticketControl.data['presale2'] ==
                                        "tutup") ...[
                                      Text(
                                        "Coming Soon",
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            fontSize: 40,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'Syne'),
                                      ),
                                    ],
                                  ],
                                ),
                                width: 350,
                                height: 150,
                                decoration: decorationTicket(
                                    ticketControl.data['presale2'].toString()),
                              ),
                            ),
                            //Coming soon lawas presale 2
                            // InkWell(
                            //   child: Container(
                            //     alignment: Alignment.center,
                            //     child: Text(
                            //       "Coming Soon",
                            //       style: TextStyle(
                            //           color: Colors.black.withOpacity(0.5),
                            //           fontSize: 40,
                            //           fontWeight: FontWeight.w700,
                            //           fontFamily: 'Syne'),
                            //     ),
                            //     width: 350,
                            //     height: 150,
                            //     decoration: BoxDecoration(
                            //         color: Colors.grey.withOpacity(0.5),
                            //         borderRadius:
                            //             BorderRadius.all(Radius.circular(20))),
                            //   ),
                            // )
                          ],
                        ),
                        SizedBox(
                          height: 300,
                        ),
                      ],
                      //footer
                      if (MediaQuery.of(context).size.width <= 1100) ...[
                        //footer mobile
                        Container(
                          width: MediaQuery.of(context).size.width,
                          color: Colors.black,
                          child: Column(children: [
                            SizedBox(
                              height: 30,
                            ),
                            InkWell(
                              onTap: () {
                                Get.offAllNamed("/SignatureeFestival");
                              },
                              child: Row(
                                children: [
                                  Spacer(),
                                  Container(
                                    // color: Colors.white,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      color: Color(0xffF5F5E9),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image(
                                      image: AssetImage("images/icon-01.png"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "X",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 70,
                                    child: Image(
                                      image: AssetImage("images/signature.png"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            InkWell(
                              onTap: () {
                                Get.offAllNamed("/SignatureeFestival");
                              },
                              child: Text(
                                "Home",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Syne',
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            InkWell(
                              onTap: () {
                                Get.offAllNamed(
                                    "/SignatureeFestival/gueststar");
                              },
                              child: Text(
                                "Guest Star",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Syne',
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            InkWell(
                              onTap: () {
                                Get.offAllNamed("/SignatureeFestival/tickets");
                              },
                              child: Text(
                                "Tickets",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Syne',
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            InkWell(
                              onTap: () {
                                Get.offAllNamed(
                                    "/SignatureeFestival/contactus");
                              },
                              child: Text(
                                "Contact Us",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Syne',
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 30),
                              child: Column(children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        if (await canLaunchUrl(Uri.parse(
                                            "https://www.tiktok.com/@signaturee.festival"))) {
                                          await launchUrl(Uri.parse(
                                              "https://www.tiktok.com/@signaturee.festival"));
                                        } else {
                                          throw 'Could not launch tiktok.com/@signaturee.festival';
                                        }
                                      },
                                      child: Icon(
                                        FontAwesomeIcons.tiktok,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        if (await canLaunchUrl(Uri.parse(
                                            "https://youtube.com/channel/UC1aJNWcTfXBUph02HKr6zLQ"))) {
                                          await launchUrl(Uri.parse(
                                              "https://youtube.com/channel/UC1aJNWcTfXBUph02HKr6zLQ"));
                                        } else {
                                          throw 'Could not launch youtube';
                                        }
                                      },
                                      child: Icon(
                                        FontAwesomeIcons.youtube,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        if (await canLaunchUrl(Uri.parse(
                                            "https://instagram.com/signaturee.festival?igshid=YmMyMTA2M2Y="))) {
                                          await launchUrl(Uri.parse(
                                              "https://instagram.com/signaturee.festival?igshid=YmMyMTA2M2Y="));
                                        } else {
                                          throw 'Could not launch signaturee.festival';
                                        }
                                      },
                                      child: Icon(
                                        FontAwesomeIcons.instagram,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        if (await canLaunchUrl(Uri.parse(
                                            "https://wa.me/6285746970735"))) {
                                          await launchUrl(Uri.parse(
                                              "https://wa.me/6285746970735"));
                                        } else {
                                          throw 'Could not launch https://wa.me/6285746970735';
                                        }
                                      },
                                      child: Icon(
                                        FontAwesomeIcons.whatsapp,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "© 2021 - 2022 agendakan.com | All right reserved",
                                  style: TextStyle(color: Colors.white),
                                )
                              ]),
                              height: 100,
                              decoration: BoxDecoration(
                                  // color: Colors.white,
                                  border: Border(
                                      top: BorderSide(
                                          width: 1.5, color: Colors.white))),
                              // width: MediaQuery.of(context).size.width,
                              // color: Colors.green,
                            ),
                          ]),
                        )
                      ] else ...[
                        //footer web
                        Container(
                          child: Column(children: [
                            Row(
                              children: [
                                Spacer(),
                                Container(
                                  // color: Colors.white,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Color(0xffF5F5E9),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image(
                                    image: AssetImage("images/icon-01.png"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  "X",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 30),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Container(
                                  height: 70,
                                  child: Image(
                                    image: AssetImage("images/signature.png"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.offAllNamed("/SignatureeFestival");
                                  },
                                  child: Text(
                                    "Home",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: 'Syne',
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.offAllNamed(
                                        "/SignatureeFestival/gueststar");
                                  },
                                  child: Text(
                                    "Guest Star",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: 'Syne',
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.offAllNamed(
                                        "/SignatureeFestival/tickets");
                                  },
                                  child: Text(
                                    "Tickets",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: 'Syne',
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.offAllNamed(
                                        "/SignatureeFestival/contactus");
                                  },
                                  child: Text(
                                    "Contact Us",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: 'Syne',
                                    ),
                                  ),
                                ),
                                Spacer()
                              ],
                            ),
                            Spacer(),
                            Container(
                              padding: EdgeInsets.only(top: 30),
                              child: Column(children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        if (await canLaunchUrl(Uri.parse(
                                            "https://www.tiktok.com/@signaturee.festival"))) {
                                          await launchUrl(Uri.parse(
                                              "https://www.tiktok.com/@signaturee.festival"));
                                        } else {
                                          throw 'Could not launch tiktok.com/@signaturee.festival';
                                        }
                                      },
                                      child: Icon(
                                        FontAwesomeIcons.tiktok,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        if (await canLaunchUrl(Uri.parse(
                                            "https://youtube.com/channel/UC1aJNWcTfXBUph02HKr6zLQ"))) {
                                          await launchUrl(Uri.parse(
                                              "https://youtube.com/channel/UC1aJNWcTfXBUph02HKr6zLQ"));
                                        } else {
                                          throw 'Could not launch youtube';
                                        }
                                      },
                                      child: Icon(
                                        FontAwesomeIcons.youtube,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        if (await canLaunchUrl(Uri.parse(
                                            "https://instagram.com/signaturee.festival?igshid=YmMyMTA2M2Y="))) {
                                          await launchUrl(Uri.parse(
                                              "https://instagram.com/signaturee.festival?igshid=YmMyMTA2M2Y="));
                                        } else {
                                          throw 'Could not launch signaturee.festival';
                                        }
                                      },
                                      child: Icon(
                                        FontAwesomeIcons.instagram,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        if (await canLaunchUrl(Uri.parse(
                                            "https://wa.me/6285746970735"))) {
                                          await launchUrl(Uri.parse(
                                              "https://wa.me/6285746970735"));
                                        } else {
                                          throw 'Could not launch https://wa.me/6285746970735';
                                        }
                                      },
                                      child: Icon(
                                        FontAwesomeIcons.whatsapp,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "© 2021 - 2022 agendakan.com | All right reserved",
                                  style: TextStyle(color: Colors.white),
                                )
                              ]),
                              height: 100,
                              decoration: BoxDecoration(
                                  // color: Colors.white,
                                  border: Border(
                                      top: BorderSide(
                                          width: 1.5, color: Colors.white))),
                              // width: MediaQuery.of(context).size.width,
                              // color: Colors.green,
                            ),
                            Spacer()
                          ]),
                          padding: EdgeInsets.fromLTRB(150, 60, 150, 60),
                          color: Colors.black,
                          height: MediaQuery.of(context).size.height / 2,
                        ),
                      ],
                    ],
                  ),
              onLoading: CircularProgressIndicator())),
    );
  }

  void buyWidget(String avail, int i) {
    String temp = "";
    if (i == 1) {
      temp = "early-bird";
    } else if (i == 2) {
      temp = "early-entry";
    } else if (i == 3) {
      temp = "presale1";
    } else if (i == 4) {
      temp = "presale2";
    }
    if (avail == "buka") {
      print("Testing beli");
      data_store.write("jenis_tiket", temp);
      beliTicket(context, snkTiket);
    } else
      Get.defaultDialog(
          content: Text("Ticket Habis atau Pembelian sudah di tutup"));
  }

  BoxDecoration decorationTicket(String avail) {
    if (avail == "buka") {
      return BoxDecoration(
          // color: Colors.grey,
          color: Colors.grey,
          image: null,
          borderRadius: BorderRadius.all(Radius.circular(20)));
    } else if (avail == "habis") {
      return BoxDecoration(
          // color: Colors.grey,
          color: Colors.grey.withOpacity(0.5),
          image: DecorationImage(image: AssetImage("images/sold_out.png")),
          borderRadius: BorderRadius.all(Radius.circular(20)));
    } else
      return BoxDecoration(
          // color: Colors.grey,
          color: Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.all(Radius.circular(20)));
  }
}

void beliTicket(BuildContext context, String snk) {
  Get.defaultDialog(
      title: "TERMS AND CONDITION",
      barrierDismissible: false,
      content: Expanded(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Pembelian Tiket S&K",
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Syne',
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.justify,
              ),
              Container(
                padding: EdgeInsets.only(left: 40),
                child: Text(
                  snk,
                  style: TextStyle(fontSize: 15, fontFamily: 'Syne'),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () => Get.back(), child: Text("Agree")),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () =>
                          Get.offAllNamed("/SignatureeFestival/tickets"),
                      child: Text("Cancel"))
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ]),
          ),
        ),
      )).then((value) => Get.defaultDialog(
      title: "Book Ticket",
      contentPadding: EdgeInsets.fromLTRB(40, 0, 40, 0),
      content: Expanded(
        child: SingleChildScrollView(
            child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              // Container(
              //   width: MediaQuery.of(context).size.width,
              // ),
              Row(
                children: [Text("Ticket Pre Condition : ")],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Text(
                        "• Setiap akun dapat membeli tiket hingga maksimal 3 tiket per transaksi"),
                  )
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Text(
                        "• Satu tiket berlaku untuk 2 orang dan dapat add-ons maksimal menjadi 3 orang per tiket"),
                  )
                ],
              ),

              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Text("• Harga adds-on 50% dari harga ticket"),
                  )
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Text(
                        "• Harga Ticket masih belum termasuk ppn sebesar 10%"),
                  )
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Text(
                        "• Tidak bisa menggunakan nomor identitas yang sama di tiket yang berbeda"),
                  )
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Text(
                        "• Khusus tiket early entry, colse gate LEBIH AWAL daripada tiket lainnya"),
                  )
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Text(
                        "• Coupon berlaku untuk 1 tiket ( Yaitu tiket yang teratas/pertama dalam satu pembelian )"),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [Text("Silahkan isi data berikut : ")],
              ),
              BuyTicketPage(title: "")
            ],
          ),
        )),
      )));
}
