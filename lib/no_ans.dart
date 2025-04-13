import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/Authentication/contacts_hotel.dart';

class no_ans extends StatelessWidget {
  const no_ans({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body:
      Column(
        children: [
          Container( child: Image.asset('assets/logo.png')),
          SizedBox(height: 40,),
          Container(
            padding: EdgeInsets.all(20),
        child: Text('Thank you for your selflessness and for making the world a better place.',
        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
      ),
      Container(
        padding: EdgeInsets.all(20),
child:Text('Thank You !',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
      ),
      Container(
        child: TextButton(onPressed: () {
            Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ItemList()));
 },
child:Text('Go back',)),
      )
      

        ],
      )
    );
  }
}