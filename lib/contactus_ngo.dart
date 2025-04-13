import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

class ngocontact extends StatelessWidget {
  const ngocontact({super.key});

  @override
  Widget build(BuildContext context) {
    const phoneNumber = "tel:9316976164";
    return Scaffold(
      backgroundColor: const Color(0xFFf9f8f7),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/logo.png'),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            padding: const EdgeInsets.only(right: 100),
            child: const Text('To Contact the NGO call the below number ',
                textScaleFactor: 1.0,
                style: TextStyle(color: Colors.black, fontSize: 20.0)),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            decoration: const BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton.icon(
                  icon: Icon(
                    Icons.phone_android_rounded,
                    color: Colors.white,
                    size: 24.0,
                  ),
                  label: Text('Call NGO'),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFFe8772e)),
                  ),
                  onPressed: () async {
                    if (await canLaunch(phoneNumber)) {
                      await launch(phoneNumber);
                    } else {
                      throw 'Could not launch $phoneNumber';
                    }
                  },
                )
              ],
            ),
          ),
          const SizedBox(
            height: 80,
          ),
        ],
      ),
    );
  }
}
