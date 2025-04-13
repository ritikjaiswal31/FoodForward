import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';                 //Integrated with Firebase
import 'package:flutter_application_1/users.dart';
import 'Splash/logo_screen.dart';
import 'users.dart';
import 'Authentication/contacts_hotel.dart';



void main() async{                                //Main Function Added
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
   home: logo_screen(),
  ));
}

