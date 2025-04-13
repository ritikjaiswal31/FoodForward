import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class UploadScreen extends StatefulWidget {                       //Integration of Image UploadScreen 
  @override    
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  File? _image;
  String? _imageUrl;

  Future<void> _getImage() async {
    final image = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image!.path);
    });
  }

  Future<void> _uploadImage() async {
    final storage = FirebaseStorage.instance;
    final ref = storage.ref().child('images/${DateTime.now()}.jpg');
    final uploadTask = ref.putFile(_image!);
    final downloadUrl = await (await uploadTask).ref.getDownloadURL();
    setState(() {
      _imageUrl = downloadUrl;
    });
    FirebaseFirestore.instance.collection('images').add({
      'imageUrl': _imageUrl,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Photo'),
        backgroundColor:  const Color(0xFFe8772e),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_imageUrl != null) ...[
              Image.network(_imageUrl!),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShowImageScreen(imageUrl: _imageUrl!),
                    ),
                  );
                },
                child: Text('Show Image'),
              ),
            ] else ...[
              if (_image != null) ...[
                Image.file(_image!),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _uploadImage,
                  child: Text('Upload'),
                ),
              ] else ...[
                Text('No image selected.'),
              ],
            ],
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo,color:  const Color(0xFFe8772e),),
      ),
    );
  }
}

class ShowImageScreen extends StatelessWidget {
  final String imageUrl;

  ShowImageScreen({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Show Image'),
      ),
      body: Center(
        child: Image.network(imageUrl),
      ),
    );
  }
}

