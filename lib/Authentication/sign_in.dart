//previous sign in page for ref

/*import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'demo.dart';
import 'package:flutter_application_1/home_screen.dart';
import 'package:flutter_application_1/ngo_screen.dart';
import 'package:flutter_application_1/hotel_screen.dart';
import 'contacts.dart';



class sign_in extends StatefulWidget {
  sign_in({super.key});

  @override
  State<sign_in> createState() => _sign_inState();
}

class _sign_inState extends State<sign_in> {
  String? role;


  //
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // realtime database
  TextEditingController nameofOrganizationController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController contactNoController = TextEditingController();

  // length controller of the contact no
  int length = 0;
  _onChanged(String value) {
    setState(() {
      length = value.length;
    });

    if (length == 11) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title:
                const Text('Sorry, You have Reached the Maximum input limit...'),
            actions: <Widget>[
              Container(
                  child: ElevatedButton(
                child: Text("Ok"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )),
            ],
          );
        },
      );
    }
  }

  // for realtime database
  late DatabaseReference dbRef;

  // for firestore database
  late CollectionReference roleCollection;

  late CollectionReference FoodForwardDatabase;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('FoodForwardDatabase');
    // firestore
    roleCollection = FirebaseFirestore.instance.collection('Roles');

    FoodForwardDatabase =
        FirebaseFirestore.instance.collection('FoodForwardDatabase');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFf9f8f7),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 50,
                ),
                Container(
                    alignment: Alignment.center,
                    child: const Text(
                      'Create New\n   Account',
                      textScaleFactor: 2.0,
                      style: TextStyle(color: Colors.brown, fontSize: 15.0),
                    )),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: nameofOrganizationController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name of Your Organization',
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Who are you ?",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const Divider(),
                      RadioListTile(
                        title: const Text("Hotel/Mess"),
                        value: "hotel",
                        groupValue: role,
                        onChanged: (value) {
                          setState(() {
                            role = value;
                          });
                        },
                      ),
                      RadioListTile(
                        title: const Text("NGO"),
                        value: "NGO",
                        groupValue: role,
                        onChanged: (value) {
                          setState(() {
                            role = value;
                          });
                        },
                      ),
                    ],
                  ),
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
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: addressController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Address',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  // ignore: unnecessary_new
                  child: TextField(
                    controller: contactNoController,
                    decoration:
                        const InputDecoration(labelText: "Enter your number"),
                    keyboardType: TextInputType.number,
                    onChanged: _onChanged,
                    maxLength: 10,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ], // Only numbers can be entered
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
                        // for realtime database
                        Map<String, String> database = {
                          'name of organization':
                              nameofOrganizationController.text,
                          'email': emailController.text,
                          'password': passwordController.text,
                          'address': addressController.text,
                          'contactNo': contactNoController.text,
                          'role': role.toString()
                        };
                        dbRef.push().set(database);
                        
                        // firestore
                        Map<String, dynamic> roleDatabase = {
                          'email': emailController.text,
                          'role': role.toString()
                        };

                        roleCollection.add(roleDatabase);

                        Map<String, dynamic> appDatabase = {
                          'name of organization':
                              nameofOrganizationController.text,
                          'email': emailController.text,
                          'password': passwordController.text,
                          'address': addressController.text,
                          'contactNo': contactNoController.text,
                          'role': role.toString()
                        };
                        FoodForwardDatabase.add(appDatabase);

                        FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text)
                            .then((value) {
                          print("created new account");
                          if (role == 'hotel') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  ItemList()),
                            );
                          } else if (role == 'NGO') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ItemList()),
                            );
                          }
                        }).onError((error, stackTrace) {
                          print("Error ${error.toString()}");
                        });
                      },
                      child: const Text("Sign In"),
                    )),
                Container(
                  //skip icon
                  alignment: Alignment.center, //Already Have Account
                  child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const log_in()),
                      );
                    },
                    child: const Text(
                        "Already Have Account\n                Log In"),
                  ),
                ),
              ]),
        ));
  }
}*/
