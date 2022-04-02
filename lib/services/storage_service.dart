// create a singleton
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  static final StorageService _singleton = StorageService._internal();
  static final FirebaseStorage _storage = FirebaseStorage.instance;
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  factory StorageService() {
    return _singleton;
  }

  StorageService._internal();

  // add image to firebase storage
  static Future<String> uploadImage(
      String path, String filename, Uint8List file, bool isPost) async {
    UploadTask uploadTask =
        _storage.ref().child(path).child(_auth.currentUser!.uid).putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}
