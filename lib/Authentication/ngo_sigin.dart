import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'ngo_login.dart';
import 'who.dart';
import 'contacts_hotel.dart';

class NGO_Signin extends StatefulWidget {
  NGO_Signin({super.key});
  //late final CollectionReference ngoCollection;
  //ate final CollectionReference user_ngoCollection;

  /* NGO_Signin({Key? key})
      : ngoCollection = FirebaseFirestore.instance.collection('NGO'),
        user_ngoCollection = FirebaseFirestore.instance.collection('User-ngo'),
        super(key: key);
*/
  @override
  State<NGO_Signin> createState() => _NGO_SigninState();
}

class _NGO_SigninState extends State<NGO_Signin> {
  final nameofOrganizationController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final addressController = TextEditingController();
  final contactNoController = TextEditingController();

  late CollectionReference ngoCollection;
  late CollectionReference user_ngoCollection;

  @override
  void initState() {
    super.initState();

    ngoCollection = FirebaseFirestore.instance.collection('NGO');
    user_ngoCollection = FirebaseFirestore.instance.collection('User-ngo');
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
                'Dear NGO, Welcome to the Food Forward Community :)',
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

                  maxLength: 10, // to check
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ], // Only numbers can be entered
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Map<String, dynamic> ngodatabase = {
                    'name of organization': nameofOrganizationController.text,
                    'email': emailController.text,
                    'password': passwordController.text,
                    'address': addressController.text,
                    'contactNo': contactNoController.text,
                  };
                  ngoCollection.add(ngodatabase);

                  Map<String, dynamic> ngoCard = {
                    'name of organization': nameofOrganizationController.text,
                    'address': addressController.text,
                  };
                  user_ngoCollection.add(ngoCard);

                  FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ItemList()));
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
                      MaterialPageRoute(builder: (context) => NGO_Login()));
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
                  'Not an NGO?',
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
