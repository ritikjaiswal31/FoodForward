import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Authentication/hotel_home.dart';
import 'hotel_login.dart';
import 'who.dart';
import 'contacts_hotel.dart';
import 'package:flutter_application_1/Authentication/ngo_login.dart';
import 'package:flutter_application_1/Authentication/ngo_sigin.dart';
import 'contacts_ngo.dart';

class Hotel_Signin extends StatefulWidget {
  Hotel_Signin({super.key});
  /* late final CollectionReference hotelCollection;
  late final CollectionReference user_hotelCollection;

  Hotel_Signin({Key? key})
      : hotelCollection = FirebaseFirestore.instance.collection('Hotel'),
        user_hotelCollection =
            FirebaseFirestore.instance.collection('User-hotel'),
        super(key: key);
*/
  @override
  State<Hotel_Signin> createState() => _Hotel_SigninState();
}

class _Hotel_SigninState extends State<Hotel_Signin> {
  final nameofOrganizationController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final addressController = TextEditingController();
  final contactNoController = TextEditingController();

  late CollectionReference hotelCollection;
  late CollectionReference user_hotelCollection;
  late CollectionReference contactNoCollection;
  @override
  void initState() {
    super.initState();
    hotelCollection = FirebaseFirestore.instance.collection('Hotel');
    user_hotelCollection = FirebaseFirestore.instance.collection('User-hotel');
    contactNoCollection =
        FirebaseFirestore.instance.collection('contactNo-hotel');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 60),
              Text(
                'Dear Donor, Welcome to the Food Forward Community :)',
                textScaleFactor: 2.0,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.brown, fontSize: 15.0),
              ),
              SizedBox(height: 20),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  'Create New\n   Account',
                  textScaleFactor: 2.0,
                  style: TextStyle(color: Colors.brown, fontSize: 15.0),
                ),
              ),
              SizedBox(height: 20),
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
                child: TextField(
                  controller: contactNoController,
                  decoration:
                      const InputDecoration(labelText: "Enter your number"),
                  keyboardType: TextInputType.number,

                  maxLength: 10,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ], // Only numbers can be entered
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Map<String, dynamic> hoteldatabase = {
                    'name of organization': nameofOrganizationController.text,
                    'email': emailController.text,
                    'password': passwordController.text,
                    'address': addressController.text,
                    'contactNo': contactNoController.text,
                  };
                  hotelCollection.add(hoteldatabase);

                  Map<String, dynamic> hotelCard = {
                    'name of organization': nameofOrganizationController.text,
                    'address': addressController.text,
                  };
                  user_hotelCollection.add(hotelCard);

                  Map<String, dynamic> contactcard = {
                    'contactNo': contactNoController.text,
                  };
                  contactNoCollection.add(contactcard);

                  FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => hotelhome()));
                },
                child: Text('Sign in'),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFFe8772e)),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white)),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Hotel_Login()));
                },
                child: Text(
                  'Already Have an Account?\n                Log In',
                  style: TextStyle(
                    fontSize: 18,
                    //fontWeight: FontWeight.bold,
                    color: Colors.black,
                    //decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => who()));
                },
                child: Text(
                  'Not a Donor?',
                  style: TextStyle(
                    fontSize: 18,
                    //fontWeight: FontWeight.bold,
                    color: Colors.black,
                    //decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
