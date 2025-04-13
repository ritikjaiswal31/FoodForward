import 'package:flutter/material.dart';

import 'splash3.dart';
import 'package:flutter_application_1/Authentication/who.dart';

class splash2 extends StatefulWidget {
  const splash2({super.key});

  @override
  State<splash2> createState() => _splash2State();
}

class _splash2State extends State<splash2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf9f8f7),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          Container(
            //skip icon
            margin: EdgeInsets.only(left: 310),
            child: TextButton(
              child: Text(
                "Skip",
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => who()),
                );
              },
            ),
          ),
          const SizedBox(
            height: 200,
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: const Text(
              "Be A\nDonor...",
              textScaleFactor: 2.0,
              style: TextStyle(color: Colors.brown, fontSize: 20.0),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: const Text(
                'If you are a hotel/mess or any bulk\nfood preparing entity...\nThis is the place for u too be kind and\nhelpful towards society',
                textScaleFactor: 1.0,
                style: TextStyle(color: Colors.black, fontSize: 20.0)),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                child: Text("Next"),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFe8772e),
                  elevation: 0,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => splash3()),
                  );
                },
              ))
        ],
      ),
    );
  }
}
