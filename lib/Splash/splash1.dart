import 'package:flutter/material.dart';
import 'splash2.dart';
import 'package:flutter_application_1/Authentication/sign_in.dart';
import 'package:flutter_application_1/Authentication/who.dart';

class splash1 extends StatefulWidget {
  const splash1({super.key});

  @override
  State<splash1> createState() => _splash1State();
}

class _splash1State extends State<splash1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf9f8f7),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 40,
          ),
          Container(
            //skip icon
            margin: EdgeInsets.only(left: 310),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => who()),
                );
              },
              child: const Text("Skip"),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: const Text(
              "Donate food \n& \nSave Lives",
              textScaleFactor: 2.0,
              style: TextStyle(color: Colors.brown, fontSize: 20.0),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
              margin: const EdgeInsets.only(left: 20, right: 175),
              padding: const EdgeInsets.all(5),
              child: Image.asset('assets/hand.png')),
          const SizedBox(
            height: 40,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: const Text(
                'FoodForward  is an initiative that\nconnects bulk food preparing entities\nlike Mess and Hotels with Social organizations like NGO"s\nand other food donating organizations  ',
                textScaleFactor: 1.0,
                style: TextStyle(color: Colors.black, fontSize: 20.0)),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFe8772e),
                  elevation: 0,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => splash2()),
                  );
                },
                child: Text("Next"),
              ))
        ],
      ),
    );
  }
}
