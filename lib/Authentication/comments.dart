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

/* 
final FirebaseAuth auth = FirebaseAuth.instance;
final DatabaseReference dbRef = FirebaseDatabase.instance.reference();

Future<void> checkUserRoleAndRoute() async {
  final User user = auth.currentUser;
 final DataSnapshot snapshot = await FirebaseDatabase.instance
    .reference()
    .child('users')
    .orderByChild('email')
    .equalTo(email)
    .once();

if (snapshot.value != null) {
  final Map<dynamic, dynamic> userData = snapshot.value;
  final String role = userData[email]['role'] as String;
  // Route user based on their role
}


  if (role == 'admin') {
    // Navigate to admin dashboard screen
    Navigator.pushReplacementNamed(context, '/admin-dashboard');
  } else {
    // Navigate to main app screen
    Navigator.pushReplacementNamed(context, '/app-screen');
  }
}

*/
 
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

                       /*   roleCollection
                              .get()
                              .then((QuerySnapshot querySnapshot) => {
                                    querySnapshot.docs.forEach((doc) {
                                      print(doc.data()); // this will all data available in the collection
                                      

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
                                  print('Failed to get organizations: $error'));
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