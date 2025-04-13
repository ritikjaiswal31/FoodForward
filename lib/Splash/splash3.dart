import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/Authentication/who.dart';

class splash3 extends StatefulWidget {
  const splash3({super.key});

  @override
  State<splash3> createState() => _splash3State();
}

class _splash3State extends State<splash3> {
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
            //Here, skip the icon
            margin: EdgeInsets.only(left: 310),
            child: TextButton(
              child: Text("Skip"),
              style: TextButton.styleFrom(
                primary: Colors.black,
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
              "Are You A Social\nOrganization?",
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
                'Are you a social organization that\nprovides food for the poor?\nDont worry,we have got you covered!',
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
                    MaterialPageRoute(builder: (context) => who()),
                  );
                },
              ))
        ],
      ),
    );
  }
}
