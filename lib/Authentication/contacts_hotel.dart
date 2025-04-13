//this page contains the fetched data from firebase of signed in users
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/nav-drawer.dart';
import 'package:flutter_application_1/Authentication/upload.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_application_1/Authentication/image.dart';

import 'contactus_hotel.dart';

class ItemList extends StatelessWidget {
  ItemList({Key? key}) : super(key: key) {
    _stream = user_hotelCollection.snapshots();
  }

  final CollectionReference user_hotelCollection =
      FirebaseFirestore.instance.collection('User-hotel');

  //_reference.get()  ---> returns Future<QuerySnapshot>
  //_reference.snapshots()--> Stream<QuerySnapshot> -- realtime updates
  late Stream<QuerySnapshot> _stream;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: NavDrawer(),
      appBar: AppBar(
        backgroundColor: Color(0xFFe8772e),
        title: const Text("Food Forward"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          //Check error
          if (snapshot.hasError) {
            return Center(child: Text('Some error occurred ${snapshot.error}'));
          }

          //Check if data arrived
          if (snapshot.hasData) {
            //get the data
            QuerySnapshot querySnapshot = snapshot.data;
            List<QueryDocumentSnapshot> documents = querySnapshot.docs;

            //Convert the documents to Maps
            List<Map> items = documents
                .map((e) => {
                      'address': e['address'],
                      'name of organization': e['name of organization']
                    })
                .toList();

            //Display the list
            return ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  //Get the item at this index
                  Map thisItem = items[index];
                  //REturn the widget for the list items
                  return Card(
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(1.0),
                        width: 300.0,
                        height: 300.0,
                        child: ListTile(
                          tileColor: Color(0xFFf9f7f8),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                "https://www.shutterstock.com/image-photo/healthy-food-clean-eating-selection-260nw-722718097.jpg", // Replace with the URL of your image
                                width: double
                                    .infinity, // Set the width of the image to fill the available space
                                height: 100, // Set the height of the image
                                fit: BoxFit
                                    .fitWidth, // Set the fit property to cover or contain
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Donor Name: ${thisItem['name of organization']}',
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text('Location: ${thisItem['address']}'),
                              const SizedBox(
                                height: 10,
                              ),
                              ElevatedButton(
                                child: Text("Contact Us"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFe8772e),
                                  elevation: 0,
                                ),
                                onPressed: ()  {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              phoneNumber()));
                                },
                              ),
                              ElevatedButton(
                                child: Text("Show images"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFe8772e),
                                  elevation: 0,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ImageListScreen()));
                                },
                              ),
                            ],
                          ),
                          onTap: () {},
                        ),
                      ));
                });
          }

          //Show loader
          return const Center(child: CircularProgressIndicator());
        },
      ), //Display a list // Add a FutureBuilder
    );
  }
}
