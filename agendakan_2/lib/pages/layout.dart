import 'package:agendakan_2/pages/dashboard/dashboard.dart';
import 'package:agendakan_2/pages/dashboard/widgets/top_nav.dart';
// import 'package:agendakan_2/pages/ticketdetail/ticketDetail.dart';
import 'package:agendakan_2/pages/ticketlist/ticketmenu.dart';
import 'package:flutter/material.dart';

class SiteLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(45),
      //   child: topNavBar(),
      // ),
      body: Dashboard(),
      //body: TicketMenu(),
      //body: TicketDetail(),
    );
  }
}
