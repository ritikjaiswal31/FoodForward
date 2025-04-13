import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'final.dart';
class markme extends StatefulWidget {
  const markme({super.key});

  @override
  State<markme> createState() => _markmeState();
}

class _markmeState extends State<markme> {
  var q1Val = 0.0;
  var q2Val = 0.0;
  var q3Val = 0.0;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf9f8f7),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFFf9f8f7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                    margin: EdgeInsets.only(left: 30),
                    child: const Text(
                      'Please answer the below questions',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: Container(
                    child: Material(
                  color: Color(0xFFf9f8f7),
                  elevation: 10,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: 380,
                    height: 500,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: const Text(
                              'How many people did you feed today?',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            child: SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                trackHeight: 20.0,
                                valueIndicatorShape:
                                    PaddleSliderValueIndicatorShape(),
                                valueIndicatorColor: Colors.black,
                              ),
                              child: Slider(
                                min: 0,
                                max: 100,
                                divisions: 10,
                                value: q1Val,
                                label: q1Val.abs().toString(),
                                activeColor: Color(0xFFe8772e),
                                inactiveColor: Colors.white,
                                onChanged: (newValue) {
                                  setState(() {
                                    q1Val = newValue;
                                  });
                                },
                              ),
                            ),
                          ),
                          Container(
                            child: const Text(
                              'How many litres of water must have been saved ?',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            child: SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                trackHeight: 20.0,
                                valueIndicatorShape:
                                    PaddleSliderValueIndicatorShape(),
                                valueIndicatorColor: Colors.black,
                              ),
                              child: Slider(
                                min: 0,
                                max: 100,
                                divisions: 10,
                                value: q2Val,
                                label: q2Val.abs().toString(),
                                activeColor: Color(0xFFe8772e),
                                inactiveColor: Colors.white,
                                onChanged: (newValue) {
                                  setState(() {
                                    q2Val = newValue;
                                  });
                                },
                              ),
                            ),
                          ),
                          Container(
                            child: const Text(
                              'How many kgs of food saved?',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            child: SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                trackHeight: 20.0,
                                valueIndicatorShape:
                                    PaddleSliderValueIndicatorShape(),
                                valueIndicatorColor: Colors.black,
                              ),
                              child: Slider(
                                min: 0,
                                max: 100,
                                divisions: 10,
                                value: q3Val,
                                label: q3Val.abs().toString(),
                                activeColor: Color(0xFFe8772e),
                                inactiveColor: Colors.white,
                                onChanged: (newValue) {
                                  setState(() {
                                    q3Val = newValue;
                                  });
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const Divider(
                            color: Colors.black,
                            height: 25,
                            thickness: 2,
                            indent: 5,
                            endIndent: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: ElevatedButton(
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Text(
                      'Submit',
                      style: TextStyle(height: 1, fontSize: 20),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFe8772e),
                    onPrimary: Colors.white,
                  ),
                  onPressed: () {
                    firestore.collection('Stat_info').doc('statistics').set({
                      'question1': q1Val,
                      'question2': q2Val,
                      'question3': q3Val,
                    }).then((value) => {});

                    firestore
                        .collection('users')
                        .doc(auth.currentUser?.email)
                        .set({
                          'question1': q1Val,
                          'question2': q2Val,
                          'question3': q3Val,
                        })
                        .then((value) => {
                              Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              finalpage()))
                            })
                        .catchError((error) => {
                              // Handle the error
                            });
                    /*
                    final user = auth.currentUser;
                    if (user != null) {
                      //this will get existing data from document
                      final docRef =
                          firestore.collection('Stat_info').doc('statistics');
                      firestore.runTransaction((transaction) async {
                        final docSnapshot = await transaction.get(docRef);
                        if (docSnapshot.exists) {
                          // updating existing data with new one
                          final data = docSnapshot.data();
                          final q1 = (data?['question1'] ?? 0) + q1Val;
                          final q2 = (data?['question2'] ?? 0) + q2Val;
                          final q3 = (data?['question3'] ?? 0) + q3Val;

                          // here we will updating document with new one
                          transaction.update(docRef, {
                            'question1': q1,
                            'question2': q2,
                            'question3': q3,
                          });
                        } else {
                          // if document does not exist it will create new one
                          transaction.set(docRef, {
                            'question1': q1Val,
                            'question2': q2Val,
                            'question3': q3Val,
                          });
                        }
                      }).then((_) {
                        print('data update successully!');
                      }).catchError((error) {
                        print('Failed to updata data: $error');
                      });
                    }*/
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
