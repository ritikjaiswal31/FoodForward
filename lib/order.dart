import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'thank_you.dart';
import 'no_ans.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_core/firebase_core.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);
  
  

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    
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
            child: const Text(
                'To Maintain the authenticity we urge you  to call the Donor to  confirm your order ',
                textScaleFactor: 1.0,
                style: TextStyle(color: Colors.black, fontSize: 20.0)),
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton.icon(
                  icon: Icon(
                    Icons.phone_android_rounded,
                    color: Colors.white,
                    size: 24.0,
                  ),
                  label: Text('Call Donor'),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFFe8772e),
                        
                        ),
                  ),
                  onPressed: () async {
                    if (await canLaunch(phoneNumber)) {
                      await launch(phoneNumber);
                    } else {
                      throw 'Could not launch $phoneNumber';
                    }
                  },
                ),
          const SizedBox(
            height: 80,
          ),
          Container(
              alignment: Alignment.center, child: const Text('Is your Confirmed?')),
          TextButton(
              onPressed: () {
                Navigator.push(context,
                   MaterialPageRoute(builder: (context) => const thanks()));
              },
              child: const Text(
                'Yes',
                style: TextStyle(fontSize: 20),
              )),
          TextButton(
            onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const no_ans()));
            },
            child: const Text(
          'No',
          style: TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
