import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class hotel_screen extends StatefulWidget {             //Hotel Screen Class
  const hotel_screen({super.key});

  @override
  State<hotel_screen> createState() => _hotel_screenState();
}

class _hotel_screenState extends State<hotel_screen> {
  Card buildCard(var heading , var subheading) {             //Integration of Card with buildCard
    
    return Card(
        elevation: 4.0,
        child: Column(
          children: [
            Container(
                height: 200.0, child: Image.asset('assets/food_item.png')),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0xFFe8772e), title: Text("Food Forward")),
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(                         //buildCard included for the required Details
                children: [
                  buildCard('SukhSagar Hotel','Location :  Robert Robertson, 1234 NW Bobcat Lane, St. Robert.'),
                  buildCard('Zenith Youth Hostel','Location :  Robert Robertson, 1234 NW Bobcat Lane, St. Robert.'),
                  buildCard('Basil Bistro','Location :  Robert Robertson, 1234 NW Bobcat Lane, St. Robert.'),
                  buildCard('Ammys Kitchen','Location :  Robert Robertson, 1234 NW Bobcat Lane, St. Robert.'),
                  buildCard('Doon Capsicum','Location :  Robert Robertson, 1234 NW Bobcat Lane, St. Robert.'),
                ],
              )),
        ));
  }
}
