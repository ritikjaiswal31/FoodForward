import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_application_1/home_screen.dart';
import 'package:flutter_application_1/ngo_screen.dart';
import 'package:flutter_application_1/hotel_screen.dart';

class users extends StatefulWidget {
   users({Key? key}) : super(key: key);
  

  @override
  State<users> createState() => _usersState();
}

class _usersState extends State<users> {
  CollectionReference _userlist =
      FirebaseFirestore.instance.collection('users');
      late Future<QuerySnapshot>_futuredata;
      late Stream<QuerySnapshot> _stream;
      List<Map>_orgList=[];




  @override
  void initState() {
    super.initState();
   _futuredata= _userlist.get();
   _futuredata.then((value) {
    setState(() {
      _orgList=parseData(value);
    });
    
   });
  }
 List<Map> parseData(QuerySnapshot querySnapshot){
  List<QueryDocumentSnapshot>listdocs=querySnapshot.docs;
  List<Map> listItems=listdocs.map((e) => {
    'Adddress':e['Adddress'],
    'Name':e['Name']
  }).toList();
  return listItems;
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Contacts"), 
      ),
      body: _orgList.isEmpty?
      Center(child: Text('No contact')) 
      :buildListView(_orgList),
    );
  }

  ListView buildListView(List<Map<dynamic,dynamic>> orgList) {
    return ListView.builder(
      itemCount: _orgList.length,
      itemBuilder: (context,index){
      Map thisItem=_orgList[index]; 
      return ListTile(
        title: Text(thisItem['Adddress']),
        subtitle:Text( thisItem['Name']),
      ); 
    });
  }
}
