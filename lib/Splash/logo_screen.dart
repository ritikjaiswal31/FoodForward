import 'package:flutter/material.dart';



import 'package:flutter_application_1/Splash/splash1.dart';

// ignore: camel_case_types
class logo_screen extends StatelessWidget {                //Logo Screen Class 
  const logo_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(child: Image.asset('assets/logo2.png')),          //Logo2 Image is Integrated 
          
            Container(
               alignment: Alignment.center,
            child: ElevatedButton( style: ElevatedButton.styleFrom(
            backgroundColor:const Color (0xFFe8772e),
            elevation: 0,),
             onPressed: () {
               Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const splash1()),
                          );
             }, child: const Text("Next"),)
            )
          ]),
    );
  }
}
