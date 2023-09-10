// ignore_for_file: prefer_const_constructors

import 'package:agendakan_2/pages/dashboard/dashboard.dart';
import 'package:agendakan_2/pages/fipfest/controller/register_page.dart';
import 'package:agendakan_2/pages/fipfest/fipfest_buy_form.dart';
import 'package:agendakan_2/pages/fipfest/fipfest_home.dart';
import 'package:agendakan_2/pages/fipfest/fipfest_list_ticket.dart';
import 'package:agendakan_2/pages/fipfest/controller/login_page.dart';
import 'package:agendakan_2/pages/gkm/gkm_buy_form.dart';
import 'package:agendakan_2/pages/gkm/gkm_home.dart';
import 'package:agendakan_2/pages/gkm_2023/gkm_2023_home.dart';
import 'package:agendakan_2/pages/gkm_2023/gkm_2023_list_tiket.dart';
import 'package:agendakan_2/pages/layout.dart';
import 'package:agendakan_2/pages/login/login_page.dart';
import 'package:agendakan_2/pages/mercusuara/layout/MercusuaraHome.dart';
import 'package:agendakan_2/pages/mercusuara/layout/loginpageMercusuara.dart';
import 'package:agendakan_2/pages/mercusuara/layout/registerpageMercusuara.dart';
import 'package:agendakan_2/pages/mercusuara/layout/ticket/admin/ticketAdminMercusuara.dart';
import 'package:agendakan_2/pages/mercusuara/layout/ticket/admin/ticketDetailsAdminMercusuara.dart';
import 'package:agendakan_2/pages/mercusuara/layout/ticket/user/ticketDetailsMercusuara.dart';
import 'package:agendakan_2/pages/mercusuara/layout/ticket/user/ticketMercusuara.dart';
import 'package:agendakan_2/pages/new_layout/new_details.dart';
import 'package:agendakan_2/pages/new_layout/new_home.dart';
import 'package:agendakan_2/pages/oase/BuyTicket.dart';
import 'package:agendakan_2/pages/oase/EventDetail.dart';
import 'package:agendakan_2/pages/oase/EventGs.dart';
import 'package:agendakan_2/pages/oase/EventTickets.dart';
import 'package:agendakan_2/pages/oase/new_layout/ContactUs.dart';
import 'package:agendakan_2/pages/oase/new_layout/GuestStar.dart';
import 'package:agendakan_2/pages/oase/new_layout/HomeOase.dart';
import 'package:agendakan_2/pages/oase/new_layout/Tickets.dart';
import 'package:agendakan_2/pages/register/register_page.dart';
import 'package:agendakan_2/pages/ticketdetail/ticketDetails.dart';
import 'package:agendakan_2/pages/ticketdetail/ticketDetailsAdmin.dart';
import 'package:agendakan_2/pages/ticketlist/bucket.dart';
import 'package:agendakan_2/pages/ticketlist/listBukuTamu.dart';
import 'package:agendakan_2/pages/ticketlist/photobooth.dart';
import 'package:agendakan_2/pages/ticketlist/ticketAdmin.dart';
import 'package:agendakan_2/pages/ticketlist/ticketAdminTest.dart';
import 'package:agendakan_2/pages/ticketlist/ticketmenu.dart';
import 'package:agendakan_2/pages/weekfest/controller/login_page.dart';
import 'package:agendakan_2/pages/weekfest/weekfest_buy_form.dart';
import 'package:agendakan_2/pages/weekfest/weekfest_home.dart';
import 'package:agendakan_2/pages/weekfest/weekfest_list_ticket.dart';
import 'package:agendakan_2/test.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:get_storage/get_storage.dart';

import 'pages/gkm/gkm_list_ticket.dart';
import 'pages/gkm_2023/gkm_2023_buy_form.dart';

void main() async {
  setUrlStrategy(PathUrlStrategy());
  await GetStorage.init();
  runApp(MyApp());
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Agendakan.com",
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      unknownRoute: GetPage(name: '/home', page: () => GKMHome2023()),
      initialRoute: '/home',
      getPages: [
        GetPage(name: '/SignatureeFestival', page: () => Home(), transition: Transition.fadeIn),
        GetPage(
            name: '/SignatureeFestival/gueststar',
            page: () => GuestStarPage(),
            transition: Transition.fadeIn),
        GetPage(
            name: '/SignatureeFestival/tickets',
            page: () => TicketsPage(),
            transition: Transition.fadeIn),
        GetPage(
            name: '/SignatureeFestival/contactus',
            page: () => ContactPage(),
            transition: Transition.fadeIn),
        GetPage(name: '/mercusuara', page: () => MercusuaraHome(), transition: Transition.fadeIn),
        GetPage(name: '/loginpage', page: () => LoginPage(title: '')),
        GetPage(name: '/mercusuara/loginpage', page: () => LoginPageMercusuara(title: '')),
        GetPage(name: '/register', page: () => RegisterPage(title: '')),
        GetPage(name: '/mercusuara/register', page: () => RegisterPageMercusuara(title: '')),
        GetPage(name: '/ticketlist', page: () => TicketMenu()),
        GetPage(name: '/mercusuara/ticketlist', page: () => TicketMenuMercusuara()),
        GetPage(name: '/mercusuara/ticketlistAdmin', page: () => TicketAdminMercusuara()),
        GetPage(
            name: '/mercusuara/ticket/details',
            page: () => ticketDetailsMercusuaraPage(
                  title: "",
                )),
        GetPage(
            name: '/mercusuara/ticket/detailsAdmin', page: () => TicketDetailsAdminMercusuara()),
        GetPage(name: '/ticketlistAdmin', page: () => TicketAdmin()),
        GetPage(name: '/ticketlistAdmin/testing', page: () => TicketAdminTest()),
        GetPage(name: '/soasesignature', page: () => DetailEvent()),
        GetPage(
            name: '/soasesignature/detailevents',
            page: () => DetailEvent(),
            transition: Transition.fadeIn),
        GetPage(
            name: '/soasesignature/tickets',
            page: () => EventTickets(),
            transition: Transition.fadeIn),
        GetPage(name: '/soasesignature/gs', page: () => EventGs(), transition: Transition.fadeIn),
        GetPage(
            name: '/tickets/details',
            page: () => ticketDetailsPage(
                  title: "",
                )),
        GetPage(name: '/tickets/detailsAdmin', page: () => TicketDetailsAdmin()),
        GetPage(
            name: '/ticketform',
            page: () => BuyTicketPage(
                  title: "",
                )),
        GetPage(
            name: '/homepagelawas',
            page: () => Dashboard(
                // title: "",
                )),
        GetPage(name: '/signature/OTS/bukutamu', page: () => ListBukuTamu()),
        GetPage(name: '/signature/OTS/photobooth', page: () => PhotoBooth()),
        GetPage(name: '/signature/OTS/bucket', page: () => Bucket()),
        GetPage(name: '/home', page: () => HomeLayout(), transition: Transition.fadeIn),
        GetPage(name: '/details', page: () => DetailsLayout(), transition: Transition.fadeIn),
        GetPage(name: '/gkm', page: () => GKM_Home(), transition: Transition.fadeIn),
        GetPage(
            name: '/gkm/ticket_form', page: () => GKM_FORM_TICKET(), transition: Transition.fadeIn),
        GetPage(
            name: '/gkm/ticket_list', page: () => ListTicketGKM(), transition: Transition.fadeIn),
        GetPage(name: '/fipfest', page: () => FipFestHome(), transition: Transition.fadeIn),
        GetPage(
            name: '/fipfest/ticket_form',
            page: () => Fipfest_FORM_TICKET(),
            transition: Transition.fadeIn),
        GetPage(
            name: '/fipfest/ticket_list',
            page: () => ListTicketFipfest(),
            transition: Transition.fadeIn),
        GetPage(
            name: '/fipfest/loginpage',
            page: () => FipFesLoginPage(title: ''),
            transition: Transition.fadeIn),
        GetPage(
            name: '/fipfest/registerpage',
            page: () => FipfestRegisterPage(title: ''),
            transition: Transition.fadeIn),
        GetPage(name: '/weekfest', page: () => WeekFestHome(), transition: Transition.fadeIn),
        GetPage(
            name: '/weekfest/ticket_form',
            page: () => Weekfest_FORM_TICKET(),
            transition: Transition.fadeIn),
        GetPage(
            name: '/weekfest/ticket_list',
            page: () => ListTicketWeekfest(),
            transition: Transition.fadeIn),
        GetPage(
            name: '/weekfest/loginpage',
            page: () => WeekFesLoginPage(title: ''),
            transition: Transition.fadeIn),
        GetPage(
            name: '/weekfest/registerpage',
            page: () => FipfestRegisterPage(title: ''),
            transition: Transition.fadeIn),
        GetPage(name: '/gkm_2023', page: () => GKMHome2023(), transition: Transition.fadeIn),
        GetPage(
            name: '/gkm_2023/ticket_form',
            page: () => GKM_2023_FORM(),
            transition: Transition.fadeIn),
        GetPage(
            name: '/gkm_2023/ticket_list',
            page: () => ListTicketGKM2023(),
            transition: Transition.fadeIn),
      ],
    );
  }
}
