//This is our previous log in page 

/*import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/hotel_screen.dart';
import 'package:flutter_application_1/home_screen.dart';
import 'package:flutter_application_1/Authentication/sign_in.dart';
import 'package:flutter_application_1/ngo_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class log_in extends StatefulWidget {
  const log_in({super.key});

  @override
  State<log_in> createState() => _log_inState();
}

class _log_inState extends State<log_in> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? role;
  String? email;
  Object? emailToSearch;
/*
  void role_info() {
    String role;
    final databaseReference = FirebaseDatabase.instance.ref();
    final dataReference =
        databaseReference.child('FoodForwardDatabase').child('role');

    dataReference.once().then((DataSnapshot snapshot) {
          if (snapshot.value != null) {
            role = snapshot.value.toString();
            print(role);
          } else {
            print('Data is null.');
          }
        } as FutureOr Function(DatabaseEvent));
  }*/

  // for firestore database
  late CollectionReference roleCollection;
  late DatabaseReference dbRef;
  late CollectionReference foodForwardDatabase;
  @override
  void initState() {
    super.initState();
    // real-time database
    dbRef = FirebaseDatabase.instance.ref().child('FoodForwardDatabase');
    // firestore
    roleCollection = FirebaseFirestore.instance.collection('Roles');
    foodForwardDatabase =
        FirebaseFirestore.instance.collection('FoodForwardDatabase');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFf9f8f7),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 50,
                ),
                Container(
                    alignment: Alignment.center,
                    child: const Text(
                      'Log In',
                      textScaleFactor: 2.0,
                      style: TextStyle(color: Colors.brown, fontSize: 15.0),
                    )),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFe8772e),
                        elevation: 0,
                      ),
                      onPressed: () {
                        FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text)
                            .then((value) async {
                          /*
                          final databaseReference =
                              FirebaseDatabase.instance.ref();
                          final dataReference = databaseReference
                              .child('FoodForwardDatabase')
                              .child('role');*/
                          /*
                          dbRef = FirebaseDatabase.instance.ref();
                          final snapshot = await dbRef
                              .child('FoodForwardDatabase')
                              .child('role')
                              .get();
                          if (snapshot.exists) {
                            print(snapshot.value);
                          } else {
                            print('no data available');
                          }
                            */
                          /*  
                          dbRef.onValue.listen((DataSnapshot datasnapshot)  {
                            if (datasnapshot.value != null) {
                              role = datasnapshot.value.toString();
                              switch (role) {
                                case 'hotel':
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ngo_screen(),
                                      ));
                                  break;
                                case 'ngo':
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const hotel_screen()));
                                  break;
                              }
                            } else {
                              print('Data is null.');
                            }
                          } as FutureOr Function(DatabaseEvent)); */

                          // firestore pull-data
                          /*
                          roleCollection
                              .get()
                              .then((QuerySnapshot querySnapshot) => {
                                    querySnapshot.docs.forEach((doc) {
                                      print(doc
                                          .data()); // this will all data available in the collection

                                      // the above code will pull data from firestore
                                      // below code is to to pull role which is associated with the email
                                      String emailToSearch =
                                          'hotel12@gmail.com'; /* replace with the email - to retrive role associate with the email is
                                          hard-coed right now but we want it dynamic for hard-coded it works fine */

                                      roleCollection
                                          .where('email',
                                              isEqualTo: emailToSearch)
                                          .get()
                                          .then((QuerySnapshot querySnapshot) {
                                        if (querySnapshot.size > 0) {
                                          // Assuming there is only one matching document, we access the first document in the querySnapshot
                                          String role =
                                              querySnapshot.docs[0].get('role');
                                          print(
                                              'Role for email $emailToSearch: $role');
                                        } else {
                                          print(
                                              'No role found for email $emailToSearch');
                                        }
                                      }).catchError((error) => print(
                                              'Failed to search roles: $error'));
                                    })
                                  })
                              .catchError((error) =>
                                  print('Failed to get organizations: $error')); */

                          // firestore database data pull trails
                          // of single document
                          foodForwardDatabase
                              .get()
                              .then((QuerySnapshot querySnapshot) {
                            for (QueryDocumentSnapshot documentSnapshot
                                in querySnapshot.docs) {
                              String address = documentSnapshot.get('address');
                              String contactNo =
                                  documentSnapshot.get('contactNo');
                              String email = documentSnapshot.get('email');
                              String nameOfOrganization =
                                  documentSnapshot.get('name of organization');
                              String password =
                                  documentSnapshot.get('password');
                              String role = documentSnapshot.get('role');
                              print('address: $address');
                              print('contactNo: $contactNo');
                              print('Email: $email');
                              print('nameoforganization: $nameOfOrganization');
                              print('password: $password');
                              print('role: $role');
                            }
                          }).catchError((error) =>
                                  print('Failed to get organizations: $error'));

                          // realtime database all data pull trails
                          /*
                          dbRef
                              .child('FoodForwardDatabase')
                              .once()
                              .then((DataSnapshot snapshot) {
                                if (snapshot.value != null) {
                                  Object? data = snapshot.value;
                                  print(data);
                                } else {
                                  print('data is null');
                                }
                              } as FutureOr Function(DatabaseEvent value))
                              .catchError((error) {
                            print('Error: $error');
                          }); */

                          /*
                          roleCollection
                              .get()
                              .then((QuerySnapshot querySnapshot) {
                            for (QueryDocumentSnapshot documentSnapshot
                                in querySnapshot.docs) {
                              String email = documentSnapshot.get('email');
                              String role = documentSnapshot.get('role');
                              print('Email: $email');
                              print('Role: $role');

                              // condition
                              if (role == 'hotel') {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const ngo_screen(),
                                    ));
                              } else if (role == 'NGO') {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const hotel_screen()));
                              }
                            }
                          }).catchError((error) =>
                                  print('Failed to get organizations: $error')); */
/*
                          if (role == 'hotel') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ngo_screen(),
                                ));
                          } else if (role == 'NGO') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const hotel_screen()));
                          }*/
                          /*
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const hotel_screen()),
                          );*/
                        }).onError((error, stackTrace) {
                          print("Error ${error.toString()}");
                        });
                      },
                      child: const Text("Log In"),
                    )),
                Container(
                  //skip icon
                  alignment: Alignment.center,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    onPressed: () {},
                    child: const Text("Dont Have Account\n            Sign In"),
                  ),
                ),
              ]),
        ));
  }
}
*/