import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'nav-drawer.dart';

class StatPage extends StatefulWidget {
  StatPage({super.key});

  @override
  State<StatPage> createState() => _StatPageState();
}

class _StatPageState extends State<StatPage> {
  late Future<DocumentSnapshot> _documentSnapshotFuture;
  double question1 = 0;
  double question2 = 0;
  double question3 = 0;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() {
    CollectionReference statCollection =
        FirebaseFirestore.instance.collection('Stat_info');
    DocumentReference statDocument = statCollection.doc('statistics');
    _documentSnapshotFuture = statDocument.get();

    _documentSnapshotFuture.then((DocumentSnapshot documentSnapshot) {
      Map<String, dynamic> data =
          documentSnapshot.data() as Map<String, dynamic>;
      setState(() {
        question1 =   data['question1'] as double;
        question2 =  data['question2'] as double;
        question3 =  data['question3'] as double;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: NavDrawer(),
      appBar: AppBar(
         
        title: Text('Statistics'),
        backgroundColor: Color(0xFFe8772e),
      ),
      
      body:
       Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xfdf6f1), Color(0xf6efe9)],
          ),
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: Stack(
                  children: [
                    Opacity(
                      opacity: 0.6,
                      child: Container(
                        decoration: BoxDecoration(
                         
                          image: DecorationImage(
                            image: AssetImage('images/image1.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                               gradient: LinearGradient(
                            // Where the linear gradient begins and ends
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            // Add one stop for each color. Stops should increase from 0 to 1
                            stops: [0.1, 0.5, 0.7, 0.9],
                            colors: [
                              // Colors are easy thanks to Flutter's Colors class.
                              Colors.orange[800]!,
                              Colors.orange[700]!,
                              Colors.orange[600]!,
                              Colors.orange[400]!,
                            ],
                          ),
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              '$question1',
                              textScaleFactor: 2.0,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 50.0),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Total no. of people fed',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: Stack(
                  children: [
                    Opacity(
                      opacity: 0.6,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/image2.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                               gradient: LinearGradient(
                            // Where the linear gradient begins and ends
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            // Add one stop for each color. Stops should increase from 0 to 1
                            stops: [0.1, 0.5, 0.7, 0.9],
                            colors: [
                              // Colors are easy thanks to Flutter's Colors class.
                              Colors.orange[800]!,
                              Colors.orange[700]!,
                              Colors.orange[600]!,
                              Colors.orange[400]!,
                            ],
                          ),
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              '$question2',
                              textScaleFactor: 2.0,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 50.0),
                            ),
                          ),
                          const SizedBox(height: 7),
                          const Text(
                            'Kgs of food wastage reduced',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: Stack(
                  children: [
                    Opacity(
                      opacity: 0.7,
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/image3.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                               gradient: LinearGradient(
                            // Where the linear gradient begins and ends
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            // Add one stop for each color. Stops should increase from 0 to 1
                            stops: [0.1, 0.5, 0.7, 0.9],
                            colors: [
                              // Colors are easy thanks to Flutter's Colors class.
                              Colors.orange[800]!,
                              Colors.orange[700]!,
                              Colors.orange[600]!,
                              Colors.orange[400]!,
                            ],
                          ),
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              '$question3',
                              textScaleFactor: 2.0,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 50.0),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Litres of water saved',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
