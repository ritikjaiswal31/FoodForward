import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/order.dart';

class ImageListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image List'),
        backgroundColor:  const Color(0xFFe8772e)
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('images').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }
          final documents = snapshot.data!.docs;
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemCount: documents.length,
            itemBuilder: (context, index) {
              final imageUrl = documents[index]['imageUrl'] as String?;
              if (imageUrl == null) {
                return Container(); // Or any other placeholder widget
              }
              return Image.network(
                imageUrl,
                fit: BoxFit.cover,
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyWidget()));
        },
        icon: Icon(Icons.volunteer_activism),
        label: Text('Ask for Donation'),
      ),
    );
  }
}
