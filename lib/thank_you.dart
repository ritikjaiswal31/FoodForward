import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/questions.dart';
import 'package:flutter_application_1/thank_you.dart';

class thanks extends StatelessWidget {
  const thanks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(child: Image.asset('assets/logo.png')),
          SizedBox(
            height: 40,
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Thank you for your selflessness and for making the world a better place \nYour contribution will have a lasting impact, and your kindness will never be forgotten.',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => markme()));
                },
                child: Text(
                  'Make your effots count \n           Click here',
                )),
          )
        ],
      ),
    );
  }
}
