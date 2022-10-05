import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
      ],
    );
  }
}
