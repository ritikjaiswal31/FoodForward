import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'ngo_sigin.dart';
import 'who.dart';
import 'contacts_hotel.dart';

void main() => runApp(MaterialApp(
      home: NGO_Login(),
    ));

class NGO_Login extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
            ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ItemList()));
              },
              child: Text('Log In'),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xFFe8772e)),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white)),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NGO_Signin()));
              },
              child: Text(
                'Don\'t Have an Account?\n                Sign In',
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
    );
  }
}
