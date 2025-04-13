/*import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'Splash/splash1.dart';
import 'package:flutter_application_1/Authentication/demo.dart';


class home_screen extends StatelessWidget {
  const home_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(child: Image.asset('assets/logo2.png')),
          
            Container(
               alignment: Alignment.center,
            child: ElevatedButton( child: Text("Logout"),
          style: ElevatedButton.styleFrom(
            primary:Color (0xFFe8772e),
            elevation: 0,),
             onPressed: () {
                Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => log_in()),
                          );
             },)
            )
          ]),
    );
  }
}*/
