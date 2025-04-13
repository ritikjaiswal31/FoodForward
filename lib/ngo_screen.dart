

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ngo_screen extends StatefulWidget {
  const ngo_screen({super.key});

  @override
  State<ngo_screen> createState() => _ngo_screenState();
}

class _ngo_screenState extends State<ngo_screen> {
  @override
   Card buildCard(var heading , var subheading) {
    
    return Card(
        elevation: 4.0,
        child: Column(
          children: [
            Container(
                height: 200.0, child: Image.asset('assets/ngo.png')),
            ListTile(
              title: Text(heading),
              subtitle: Text(subheading),
              trailing: Icon(Icons.favorite_outline),
            ),
            ButtonBar(
              children: [
                ElevatedButton(
                  child: Text("Contact Us"),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFe8772e),
                    elevation: 0,
                  ),
                  onPressed: () {},
                ),
                TextButton(
                  child: const Text('Info'),
                  onPressed: () {/* ... */},
                )
              ],
            )
          ],
        ));
  }
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
            backgroundColor: Color(0xFFe8772e), title: Text("Food Forward")),
        backgroundColor: Colors.white,
        body: Container(
           padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  buildCard('Netra NGO','Location :  Robert Robertson, 1234 NW Bobcat Lane, St. Robert.'),
                  buildCard('Helping Hands','Location :  Robert Robertson, 1234 NW Bobcat Lane, St. Robert.'),
                  buildCard('Shiksha NGO','Location :  Robert Robertson, 1234 NW Bobcat Lane, St. Robert.'),
                  buildCard('Government NGO','Location :  Robert Robertson, 1234 NW Bobcat Lane, St. Robert.'),
                  buildCard('Social Army','Location :  Robert Robertson, 1234 NW Bobcat Lane, St. Robert.'),
                ],
              )),
        )
    );
  }
}