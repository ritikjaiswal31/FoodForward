// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/nav-drawer.dart';
import 'package:flutter_application_1/Authentication/upload.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_application_1/Authentication/image.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

class phoneNumber extends StatelessWidget {
  phoneNumber({Key? key}) : super(key: key) {}

  @override
  Widget build(BuildContext context) {
    const phoneNumber = "tel:9313696799";
    return Scaffold(
        endDrawer: NavDrawer(),
        appBar: AppBar(
          backgroundColor: Color(0xFFe8772e),
          title: const Text("Food Forward"),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/logo.png'),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: const Text(
                    'As a hotel that donates food to an NGO, we take great pride in our commitment to reducing food waste and giving back to the community. We recognize that there are many people who are struggling to meet their basic needs, and we feel a responsibility to do our part to help Our hotel has implemented a food donation program in which we donate excess food to local NGOs that work to alleviate hunger and food insecurity in our area. We carefully package and transport the food to ensure that it is safe and fresh, and we work closely with the NGOs to understand their needs and preferences.In addition to our food donation program, we also take other steps to minimize our environmental impact and promote sustainability. We strive to source our food and supplies from local, sustainable sources whenever possible, and we have implemented energy-efficient practices throughout our hotel.Overall, we believe that our commitment to social responsibility and sustainability sets us apart as a hotel that truly cares about our community and the world we live in.',
                    textScaleFactor: 1.0,
                    style: TextStyle(color: Colors.black, fontSize: 20.0)),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                decoration: const BoxDecoration(),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton.icon(
                  icon: Icon(
                    Icons.phone_android_rounded,
                    color: Colors.white,
                    size: 24.0,
                  ),
                  label: Text('Call Donor'),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFFe8772e)),
                  ),
                  onPressed: () async {
                    if (await canLaunch(phoneNumber)) {
                      await launch(phoneNumber);
                    } else {
                      throw 'Could not launch $phoneNumber';
                    }
                  },
                )
                  ],
                ),
              ),
              const SizedBox(
                height: 80,
              ),
            ],
          ),
        ));
  }
}
