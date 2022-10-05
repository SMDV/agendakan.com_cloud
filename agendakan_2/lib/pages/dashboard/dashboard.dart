import 'package:agendakan_2/pages/dashboard/widgets/top_nav.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45),
        child: topNavBar(),
      ),
      body: Column(children: [
        Expanded(
            flex: 30,
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(82, 55, 82, 49),
              child: Column(children: [
                Container(
                  width: double.infinity,
                  height: 355,
                  color: Colors.green,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(60, 33, 32, 33),
                            //color: Colors.red,
                            child: Column(children: [
                              Row(children: [
                                Container(
                                  //decoration: BoxDecoration(color: Colors.blue),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Color(0xff4181ED)),
                                      onPressed: () {},
                                      child: Text("Featured")),
                                ),
                              ]),
                              SizedBox(
                                height: 15,
                              ),
                              Row(children: [
                                Container(
                                  child: Text(
                                    "Oase Festival",
                                    style: TextStyle(fontSize: 24),
                                  ),
                                )
                              ]),
                              Row(children: [
                                Container(
                                  child: Text(
                                    "Drive-in Concert",
                                    style: TextStyle(fontSize: 24),
                                  ),
                                )
                              ]),
                              SizedBox(
                                height: 8,
                              ),
                              Row(children: [
                                Icon(
                                  Icons.calendar_today,
                                  size: 15,
                                ),
                                Container(
                                  child: Text("13 November 2021"),
                                ),
                                Icon(
                                  Icons.location_on,
                                  size: 15,
                                ),
                                Container(
                                  child: Text("Selecta Parking Lot"),
                                ),
                              ]),
                              SizedBox(
                                height: 24,
                              ),
                              Row(children: [
                                Container(
                                  child: Expanded(
                                    child: Text(
                                      "Akan hadir konser di Jawa Timur, dengan konsep drive in atau nonton dari mobil akan memberikan pengalaman yang berbeda. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                                      maxLines: 4,
                                    ),
                                  ),
                                )
                              ]),
                              SizedBox(
                                height: 20,
                              ),
                              Row(children: [
                                Container(
                                  child: Text("lihat lebih banyak"),
                                )
                              ]),
                              SizedBox(
                                height: 20,
                              ),
                              // Row(children: [
                              //   Spacer(),
                              //   Container(
                              //     child: Row(
                              //       children: [
                              //         Icon(Icons.arrow_back),
                              //         Icon(Icons.arrow_forward)
                              //       ],
                              //     ),
                              //   )
                              // ]),
                            ]),
                          ),
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Column(children: [
                            Image(
                              fit: BoxFit.contain,
                              image: AssetImage('images/poster3.jpg'),
                              height: 355,
                            ),
                          ]),
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 49,
                ),
                Container(
                  width: double.infinity,
                  height: 355,
                  color: Colors.green,
                  child: Column(children: [
                    Expanded(
                        child: Container(
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 51,
                          ),
                          Container(
                            width: 112,
                            alignment: Alignment.center,
                            child: Text("All Event"),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.blue, width: 3))),
                          ),
                          const SizedBox(
                            width: 71,
                          ),
                          Text("Available"),
                          const SizedBox(
                            width: 71,
                          ),
                          Text("Past Event"),
                        ],
                      ),
                      color: Colors.white,
                    )),
                    Expanded(
                        flex: 8,
                        child: Container(
                          color: Colors.white,
                        )),
                  ]),
                ),
              ]),
            )),
        Expanded(
            flex: 3,
            child: Container(
              color: Colors.blue,
            )),
        Expanded(
            flex: 1,
            child: Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("© 2021 - 2022 agendakan.com | All right reserved")
                  ]),
              color: Colors.blue,
            ))
      ]),
    );
  }
}
