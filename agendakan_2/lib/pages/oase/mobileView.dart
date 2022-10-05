import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Widget mobileView(final screenSize) {
  return Expanded(
    child: Container(
      // alignment: Alignment.center,
      color: Color(0xffFFF9E0),
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/bg_oase.jpg'),
                        fit: BoxFit.cover)),
                width: screenSize,
                child: Image(
                  fit: BoxFit.fill,
                  image: AssetImage('images/poster3.jpg'),
                  height: 400,
                  width: 250,
                ),
              ),
              Container(
                padding: EdgeInsets.all(25),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Oase Festival",
                          style: TextStyle(fontSize: 35),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Drive-in Concert",
                            style: TextStyle(fontSize: 20)),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(children: [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.calendar_today,
                        size: 15,
                      ),
                      Container(
                        child: Text(
                          "13 November 2021",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.location_on,
                        size: 15,
                      ),
                      Container(
                        child: Text(
                          "Selecta Parking Lot",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ]),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text("Guest Star", style: TextStyle(fontSize: 20)),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                      // decoration: BoxDecoration(
                      //     border: Border.all(color: Colors.black)),
                      // color: Colors.red,
                      child: Column(
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      width: 208,
                                      height: 208,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'images/pamungkas.jpg'),
                                              fit: BoxFit.fill)),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("PAMUNGKAS")
                                  ],
                                ),
                                SizedBox(
                                  width: 35,
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width: 208,
                                      height: 208,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'images/isyana.jpg'),
                                              fit: BoxFit.fill)),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("ISYANA SARASVATI")
                                  ],
                                ),
                                SizedBox(
                                  width: 35,
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width: 208,
                                      height: 208,
                                      decoration: BoxDecoration(
                                          color: Color(0xffFF9C1A),
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'images/comingsoon.png'),
                                              fit: BoxFit.fill)),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("Coming Soon")
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text("Overview", style: TextStyle(fontSize: 20)),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                          // color: Colors.red,
                          width: screenSize - 50,
                          child: SelectableText(
                            "Akan hadir konser di Jawa Timur, dengan konsep drive in atau nonton dari mobil akan memberikan pengalaman yang berbeda. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                            textAlign: TextAlign.justify,
                            // maxLines: 8,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text("Ticket Availability",
                            style: TextStyle(fontSize: 20)),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      child: Column(children: [
                        Text(
                          "Pre-Sale 1",
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Rp. 250.000",
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ]),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xffE5E5E5),
                          padding: EdgeInsets.symmetric(
                              horizontal: 35, vertical: 20),
                          minimumSize: Size(200, 75)),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text("Location", style: TextStyle(fontSize: 20)),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text("Jl. Something"),
                    InkWell(
                      child: Container(
                          height: 150,
                          width: 300,
                          // margin: EdgeInsets.fromLTRB(60, 20, 71, 22),
                          // color: Colors.green,
                          decoration: BoxDecoration(
                              //color: Color(0xffFF9C1A),
                              image: DecorationImage(
                                  image: AssetImage('images/map_dump.jpg'),
                                  fit: BoxFit.fill))),
                      onTap: () async {
                        if (await canLaunchUrl(Uri.parse(
                            "https://goo.gl/maps/MkUYbKzn4cuH1uJC9"))) {
                          await launchUrl(Uri.parse(
                              "https://goo.gl/maps/MkUYbKzn4cuH1uJC9"));
                        } else {
                          throw 'Could not launch https://goo.gl/maps/MkUYbKzn4cuH1uJC9';
                        }
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
          //height: MediaQuery.of(context).size.height,
        ),
      ),
    ),
  );
  //Spacer(),
}
